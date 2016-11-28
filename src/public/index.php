<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../lib/db.php';

$app = new \Slim\App;
$app->get('/hello/{name}', function (Request $request, Response $response) {
    $name = $request->getAttribute('name');
    $response->getBody()->write("Hello, $name");

    return $response;
});

$app->get('/', function (Request $request, Response $response) {
    $response->getBody()->write("Welcome!");

    return $response;
});

$app->get('/city/{id}-{nama_kota}', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');
	$nama_kota = $request->getAttribute('nama_kota');
	get_city_hotels($id, $nama_kota);
});

$app->get('/hotel/{id}+{canonical_name}', function (Request $request, Response $response) {
	$id = $request->getAttribute('id');
	$canonical_name = $request->getAttribute('canonical_name');
	get_hotel($id);
});

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
    echo json_encode($data);
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