<?php
	session_start();
	session_destroy();
	$redirect_uri = 'http://localhost/houtell/src/public/index2.php';

  header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
?>