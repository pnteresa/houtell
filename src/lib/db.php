<?php
function connect_db() {
    $server = 'localhost'; // this may be an ip address instead
    $user = 'root';
    $pass = '';
    $database = 'houtell'; // name of your database
    $connection = new mysqli($server, $user, $pass, $database);
 
    return $connection;
}
?>