<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

require '../lib/db.php';

// Get container
$container = new \Slim\Container();

// Register component on container
$container['view'] = function ($container) {
    $view = new \Slim\Views\Twig('../templates', [
        'cache' => false
    ]);
    
    // Instantiate and add Slim specific extension
    $basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
    $view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));

    return $view;
};

//Override the default Not Found Handler
$container['notFoundHandler'] = function ($container) {
    return function ($request, $response) use ($container) {
        return redirect_to_home($container['response']);
    };
};

$app = new \Slim\App($container);

$app->get('/', function (Request $request, Response $response, $args) {
    return $this->view->render($response, 'index.html', []);
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
    	$sql = "SELECT * FROM `hotel` WHERE `id_kota` = $id;";
	    $exe = $db->query($sql);
	    while ($row = $exe->fetch_assoc()) {
			$data[] = $row;
		}
    }
    $db = null;
    return array('data' => $data, 'isCity' => $isCity);
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
    while ($row = $exe->fetch_assoc()) {
	  $reviews[] = $row;
	}

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