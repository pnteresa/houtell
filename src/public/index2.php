<?php
require_once __DIR__.'/../vendor/autoload.php';

session_start();

// session_unset();
$client = new Google_Client();
$client->setAuthConfig('client_secrets.json');
// $client->addScope(Google_Service_Drive::DRIVE_METADATA_READONLY);
$client->addScope(Google_Service_Prediction::PREDICTION);

// if(isset($_SESSION['access_token']) ) {
//     $_SESSION['access_token'] = ""; // add this line if not added somewhere else
//     // header('Location: index.php');
// }

// $_SESSION['access_token'] = NULL;
// echo "AA";

if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
  // var_dump($_SESSION['access_token']);
  $client->setAccessToken($_SESSION['access_token']);
  // $drive_service = new Google_Service_Drive($client);
  
  $prediction_service = new Google_Service_Prediction($client);
  // echo "JANCOK";
  $tt = $prediction_service->trainedmodels->get('houtell-150706', 'language-identifier');
  // $files_list = $drive_service->files->listFiles(array())->getItems();
  // echo json_encode($files_list);
  echo json_encode($tt);
  // echo "KONTS";
} else {
	// echo "MASUK2";
  // $redirect_uri = 'http://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php';
  $redirect_uri = 'http://localhost/houtell/src/public/oauth2callback.php';
  // echo "MASUK1";
  header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
}
// echo "HIHI";