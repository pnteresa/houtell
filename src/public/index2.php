<!DOCTYPE HTML>
<html>
  <head> </head>
  <body>
    <?php
       require_once __DIR__.'/../vendor/autoload.php';

      $queryErr = "";
      $query = "";

      session_start();
    //   if(isset($_SESSION['access_token']) ) {
    //     $_SESSION['access_token'] = ""; // add this line if not added somewhere else
    //     // header('Location: index.php');
    // }

    // $_SESSION['access_token'] = NULL;
    
      $client = new Google_Client();
      $client->setAuthConfig('client_secrets.json');
      $client->addScope(Google_Service_Prediction::PREDICTION);

      if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
        // var_dump($_SESSION['access_token']);
        $client->setAccessToken($_SESSION['access_token']);
        // $drive_service = new Google_Service_Drive($client);
        
      } else {
        $redirect_uri = 'http://localhost/houtell/src/public/oauth2callback.php';
        header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
      }


      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (empty($_POST["csvInstance"])) {
          $queryErr = "Query is required";
        } else {
          $query = test_input($_POST["csvInstance"]);
          if (!preg_match("/^[a-zA-Z ,.?!;'']*$/",$query)) {
            $queryErr = "Format : letters, numbers, symbols (,.?!;')."; 
          }
          else {
            
            $prediction_service = new Google_Service_Prediction($client);
            $a = new Google_Service_Prediction_InputInput();
            $input = new Google_Service_Prediction_Input();
            // $query_dummy = array("I you we they are I don't know");
            global $client, $prediction_service, $a, $input, $query;
          
            $data = array($query);
            $a->setCsvInstance($data);
            $input->setInput($a);
            $predict_query =  $prediction_service->trainedmodels->predict('houtell-150706', 'language-identifier', $input); 
            echo json_encode($predict_query);
                
          }
        }
      }
        function test_input($data) {
          $data = trim($data);
          $data = stripslashes($data);
          $data = htmlspecialchars($data);
          return $data;
        }
        // function refreshToken() {
        //   echo "refresh";
        // }
    ?>


    <h2>Houtell Query : Google Prediction API</h2>
    <p><span class="error">* required field.</span></p>
    <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
      Query: <input type="text" name="csvInstance">
      <span class="error">* <?php echo $queryErr;?></span>
      <input type="submit" name="submit" value="Submit">  
    </form>
    <!-- <button text = "Refresh Token" onclick = "refreshToken()"> -->
    <?php
      echo "<h2>Your Input:</h2>";
      echo $query;
      echo "<br>";
    ?>
   </body>

</html>
