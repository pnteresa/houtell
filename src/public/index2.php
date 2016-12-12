<!DOCTYPE HTML>
<html>
  <head> </head>
  <body>
    <?php
      session_start();

      // var_dump($_SESSION['access_token']);
      // sleep(5);
       require_once __DIR__.'/../vendor/autoload.php';
      $queryErr = "";
      $query = "";

      // session_destroy();
      // exit;
      // if(isset($_SESSION['access_token']) ) {
      //   session_unset(); // add this line if not added somewhere else
      //   // header('Location: index.php');
      // }

    // $_SESSION['access_token'] = NULL;
    
      $client = new Google_Client();
      $client->setAuthConfig('client_secrets.json');
      $client->addScope(Google_Service_Prediction::PREDICTION);

      if (! isset($_SESSION['counter3'])) {

        // $_SESSION['counter3'] == 1;

        // // var_dump($_SESSION['counter']);
        // echo "Belum terotentikasi";
        // $redirect_uri = 'http://localhost/houtell/src/public/oauth2callback.php';
        // header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
        
      }
      unset($_SESSION['counter3']);
      if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
        // echo "SUdah terotentikasi";
        echo "=============================== YOUR TOKEN ==================================";
  
        var_dump($_SESSION['access_token']);
        echo "\n";
        $client->setAccessToken($_SESSION['access_token']);
        // $drive_service = new Google_Service_Drive($client);
        
      } else {
        // // Belum terotentikasi
        echo "Belum terotentikasi";
        $redirect_uri = 'http://localhost/houtell/src/public/oauth2callback.php';
        header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
        echo "Harusnya udah terotentikasi";
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
          
            function parseReview($string) {
              $string = preg_replace('/[^A-Za-z0-9]/', ' ', $string);
              $string = preg_replace('/\s+/', ' ', $string);
              $string = preg_replace('/[0-9]/', '', $string);
              
              return strtolower($string);
            }

            $parsed_query = parseReview($query);
            $data = array($parsed_query);
            $a->setCsvInstance($data);
            $input->setInput($a);
            $predict_query =  $prediction_service->trainedmodels->predict('1065505813620', 'houtell-review', $input); 

            echo "=============================== RESULT ========================================";
            
            $json_predict_query = json_encode($predict_query);
            $json_predict_query = json_decode($json_predict_query, true);

            $json_with_percentage = json_encode($predict_query->getOutputMulti());
            $json_with_percentage = json_decode($json_with_percentage, true);
            $score = round($json_with_percentage[0]['score'], 2) * 10;
            
            echo "label: " . $json_predict_query['outputLabel'];
            echo "score: " . $score;

            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "houtell";

            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);
            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            } 

            $sql = "INSERT INTO review (review, rating, hotel_id) VALUES ('$query', $score, 1)";

            if ($conn->query($sql) === TRUE) {
                echo $query . "inserted succesfully";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }

            $conn->close();
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
