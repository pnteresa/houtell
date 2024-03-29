<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

require '../lib/db.php';

// Start session for auth, initialize Google service
session_start();
$client = new Google_Client();
$client->setAuthConfig('client_secrets.json');
$client->addScope(Google_Service_Prediction::PREDICTION);

$container = new \Slim\Container();

// Register component on container
$container['view'] = function ($container) {
  $view = new \Slim\Views\Twig('../templates', [
      'cache' => false
  ]);
  
  $basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
  $view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));

  return $view;
};

// Override the default Not Found Handler
$container['notFoundHandler'] = function ($container) {
  return function ($request, $response) use ($container) {
      return redirect_to_home($container['response']);
  };
};

$app = new \Slim\App($container);

// / or /index.php
$app->get('/', function (Request $request, Response $response, $args) {
  $cities = get_city();
  $hotels = get_hotels_by_limit(6);

  return $this->view->render($response, 'index.html', [
    'cities' => $cities,
    'hotels' => $hotels['hotels']
  ]);
})->setName('index');

$app->get('/city/{id}-{nama_kota}', function (Request $request, Response $response, $args) {
  $id = $args['id'];
  $nama_kota = $args['nama_kota'];
  
  if (!is_numeric($id)) {
    return redirect_to_home($response);
  }

  $hotels = get_city_hotels($id, $nama_kota);

  if (!$hotels["isCity"]) {
    return redirect_to_home($response);
  }

  return $this->view->render($response, 'city.html', [
    'nama_kota' => $args['nama_kota'],
    'hotels' => $hotels["data"]
  ]);
})->setName('city');

$app->get('/hotel/{canonical_name}-{id}', function (Request $request, Response $response, $args) {
  $id = $args['id'];
  
  if (!is_numeric($id)) {
    return redirect_to_home($response);
  }
  
  $canonical_name = $args['canonical_name'];
  $hotel = get_hotel($id, $canonical_name);
  
  if (sizeof($hotel["hotel"]) == 0) {
    return redirect_to_home($response);
  }
  return $this->view->render($response, 'hotel.html', [
    'hotel' => $hotel["hotel"],
    'review' => $hotel["review"]
  ]);
})->setName('hotel');

//HALAMAN OTENTIKASI
$app->get('/hotel/authenticate', function (Request $request, Response $response, $args) use ($app){
  $clientauth = new Google_Client();
  $clientauth->setAuthConfigFile('client_secrets.json');
  $clientauth->setRedirectUri('http://localhost:8080/hotel/authenticate');

  $clientauth->addScope(Google_Service_Prediction::PREDICTION);
  if (! isset($_GET['code'])) {
    $auth_url = $clientauth->createAuthUrl();
    echo "Belom otentikasi";
    var_dump($auth_url);
    // return;
    // return $app->redirect('/');
   // header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));  
   return $response->withRedirect($auth_url); 
  } else {
    $clientauth->authenticate($_GET['code']);
    $_SESSION['access_token'] = $clientauth->getAccessToken();
    $redirect_uri = 'http://localhost:8080/hotel/'.$_SESSION['current_canonical'].'-'.$_SESSION['current_id'].'';
    // header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
    return $response->withRedirect($redirect_uri);
    echo "Sudah otentikasi";
    var_dump($_SESSION['access_token']);
    echo $redirect_uri;
    // return;
  }
})->setName('hotel');

//ADD_REVIEW HANDLER
$app->post('/hotel/{canonical_name}-{id}', function (Request $request, Response $response, $args) {
  $url = "/hotel/{$args['canonical_name']}-{$args['id']}";
  $_SESSION['current_canonical'] = $args['canonical_name'];
  $_SESSION['current_id'] = $args['id'];
  $review = $request->getParsedBody()['review'];
  if (!isset($_SESSION['query'])) {
      $_SESSION['query'] = $review;
  }
  $hotelId = $request->getParsedBody()['hotel-id'];
  global $client;
  if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
    $client->setAccessToken($_SESSION['access_token']);
    $prediction_service = new Google_Service_Prediction($client);
    $bundle = new Google_Service_Prediction_InputInput();
    $input = new Google_Service_Prediction_Input();
      
    $parsed_query = parseReview($_SESSION['query']);
    unset($_SESSION['query']);

    $data = array($parsed_query);
    $bundle->setCsvInstance($data);
    $input->setInput($bundle);

    $predict_query =  $prediction_service->trainedmodels->predict('1065505813620', 'houtell-review', $input);

    $json_predict_query = json_encode($predict_query);
    $json_predict_query = json_decode($json_predict_query, true);

    $json_with_percentage = json_encode($predict_query->getOutputMulti());
    $json_with_percentage = json_decode($json_with_percentage, true);
    $score = round($json_with_percentage[0]['score'], 2) * 10;
        
    $db = connect_db();

    $hotel_id = $args["id"];
    $sql = "INSERT INTO review (review, rating, hotel_id) VALUES ('$review', $score, $hotel_id)";
    $exe = $db->query($sql);

    $db->close();

  } else {
    $redirect_uri = 'http://localhost:8080/hotel/authenticate';
    return $response->withRedirect($redirect_uri);
  }
  return $response->withHeader('Location', $url);
})->setName('hotel_review_post');

function parseReview($string) {
  $string = preg_replace('/[^A-Za-z0-9]/', ' ', $string);
  $string = preg_replace('/\s+/', ' ', $string);
  $string = preg_replace('/[0-9]/', '', $string);
  return strtolower($string);
}

function get_city() {
  $db = connect_db();
  $sql = "SELECT * FROM `city`;";
  $exe = $db->query($sql);
  $cities = array();

  while ($row = $exe->fetch_assoc()) {
    $cities[] = $row;
  }

  return $cities;
}

function get_city_hotels($id, $nama_kota) {
  $db = connect_db();
  $sql = "SELECT * FROM `city` WHERE `id` = '$id' AND `nama_kota` = '$nama_kota';";
  $exe = $db->query($sql);
  $isCity = false;
  
  while ($row = $exe->fetch_assoc()) {
    $isCity = true;
  }
  
  $data = array();
  
  if ($isCity) {
    $sql = "SELECT hotel.id AS id, hotel.nama_hotel AS nama_hotel, hotel_rating.avg_rating AS rating, hotel.bintang AS bintang, hotel.url_foto AS url_foto, hotel.lokasi AS lokasi, hotel.canonical_name AS canonical_name FROM (SELECT hotel_id, ROUND(AVG(rating),1) as avg_rating FROM review GROUP BY hotel_id) hotel_rating INNER JOIN hotel ON hotel.id = hotel_rating.hotel_id WHERE hotel.id_kota = $id ORDER BY rating DESC;";
    $exe = $db->query($sql);
    
    while ($row = $exe->fetch_assoc()) {
     $data[] = $row;
    }
  }
 
  $db = null;
 
  return array('data' => $data, 'isCity' => $isCity);
}

function get_hotels_by_limit($limit) {
  $db = connect_db();
  $sql = "SELECT hotel.id AS id, hotel.nama_hotel AS nama_hotel, hotel_rating.avg_rating AS rating, hotel.bintang AS bintang, hotel.url_foto AS url_foto, hotel.lokasi AS lokasi, hotel.canonical_name AS canonical_name FROM (SELECT hotel_id, AVG(rating) as avg_rating FROM review GROUP BY hotel_id) hotel_rating INNER JOIN hotel ON hotel.id = hotel_rating.hotel_id ORDER BY rating DESC LIMIT 6;";
  $exe = $db->query($sql);
  $hotels = array();

  while ($row = $exe->fetch_assoc()) {
    $hotels[] = $row;
  }

  if (sizeof($hotels) == 0) {
    $error = "There is no hotel";
  }

  return array('hotels' => $hotels);//$hotels;
}

function get_hotel($id, $canonical_name) {
  $db = connect_db();
  $sql = "SELECT * FROM `hotel` WHERE `id` = '$id' AND `canonical_name` = '$canonical_name';";
  $exe = $db->query($sql);
  $data = array();
  
  while ($row = $exe->fetch_assoc()) {
    $data = $row;
  }

  $sql = "SELECT * FROM `review` WHERE `hotel_id` = $id;";
  $exe = $db->query($sql);
  $reviews = array();

  $total = 0;

  while ($row = $exe->fetch_assoc()) {
    $reviews[] = $row;
    $total += $row["rating"];
  }
  $data["rating"] = round($total / sizeof($reviews),1);

  $db = null;
  $error = '';
  
  if (sizeof($data) == 0) {
    $error = "Invalid hotel";
  }
  
  return array("hotel" => $data, "review" => $reviews, "error" => $error);
}

function redirect_to_home($response) {
  return $response->withStatus(302)->withHeader('Location', '/');
}

$app->run();