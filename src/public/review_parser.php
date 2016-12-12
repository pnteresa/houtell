<?php

$string = " 23 PM 68987654 sdasa. sadas12o,.wqeo. ? wqinsa";

function parseReview($string) {
  $string = preg_replace('/[^A-Za-z0-9]/', ' ', $string);
  $string = preg_replace('/\s+/', ' ', $string);
  $string = preg_replace('/[0-9]/', '', $string);
  
  return strtolower($string);
}

echo parseReview($string);
?>