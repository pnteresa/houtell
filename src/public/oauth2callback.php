<?php
require_once __DIR__.'/../vendor/autoload.php';

session_start();
// session_destroy();
//       exit;
      
$client = new Google_Client();
$client->setAuthConfigFile('client_secrets.json');
// $client->setRedirectUri('http://' . $_SERVER['HTTP_HOST'] . '/oauth2callback.php');
$client->setRedirectUri('http://localhost/houtell/src/public/oauth2callback.php');

// $client->addScope(Google_Service_Drive::DRIVE_METADATA_READONLY);
$client->addScope(Google_Service_Prediction::PREDICTION);


// var_dump($auth_url);

if (! isset($_GET['code'])) {

  echo "belum ada otentikasi kode";
  $auth_url = $client->createAuthUrl();
  // var_dump($auth_url);
  header('Location: ' . filter_var($auth_url, FILTER_SANITIZE_URL));
  // $client->authenticate($_GET['code']);
  // $_SESSION['access_token'] = $client->getAccessToken();
  
  // echo $client->getAccessToken();
  
} else {
  echo "udah ada otentikasi kode";
  $client->authenticate($_GET['code']);
  $_SESSION['access_token'] = $client->getAccessToken();
  // echo "=============================== YOUR TOKEN ==================================\n";
  // echo json_encode($client->getAccessToken());
  // echo "\n";
  $redirect_uri = 'http://localhost/houtell/src/public/index2.php';

  header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
  // Initialize Guzzle client
}