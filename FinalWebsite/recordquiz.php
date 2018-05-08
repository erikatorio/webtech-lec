<?php
session_start();
require('connect.php');

//get the value of the quiz name and result through javascript (pass the variable from javascript to php)
if(isset($_GET['result'])) {
    $username =  $_SESSION['username'];
    $today = date("F j, Y, g:i a"); 
    $result = "";
    $quiz = "";

    $score = "UPDATE quiz_taken SET date_taken='$today', points_accumulated='$result', username='$username', quiz_taken='$quiz'"; 
    $result = mysqli_query($link, $score) or die(mysqli_error($link));

    if($result) {
        
    }
}