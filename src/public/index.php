<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

require '../lib/db.php';

$app = new \Slim\App;

// Get container
$container = $app->getContainer();

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

$app->get('/hello/{name}', function (Request $request, Response $response, $args) {
    $name = $request->getAttribute('name');
    // $response->getBody()->write("Hello, $name");
    return $this->view->render($response, 'index.html', [
        'name' => $args['name']
    ]);
});

$app->get('/', function (Request $request, Response $response, $args) {
    return $this->view->render($response, 'index.html', []);
})->setName('index');

$app->get('/city/{id}-{nama_kota}', function (Request $request, Response $response, $args) {
	$id = $args['id'];
	$nama_kota = $args['nama_kota'];
	$hotels = get_city_hotels($id, $nama_kota);
    return $this->view->render($response, 'city.html', [
    	'nama_kota' => $args['nama_kota'],
    	'hotels' => $hotels
    ]);
})->setName('city');

$app->get('/hotel/{id}+{canonical_name}', function (Request $request, Response $response, $args) {
	$id = $request->getAttribute('id');
	$canonical_name = $request->getAttribute('canonical_name');
	get_hotel($id);
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
    } else {
    	$data = array("error" => "invalid city");
    }
    $db = null;
    return $data;
}

function get_hotel($id) {
    $db = connect_db();
    $sql = "SELECT * FROM `hotel` WHERE `id` = '$id'";
    $exe = $db->query($sql);
    $data = array();
    while ($row = $exe->fetch_assoc()) {
	  $data[] = $row;
	}
    $db = null;
    echo json_encode($data);
}

$app->run();