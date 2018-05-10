<?php
session_start();
require('connect.php');

//get the value of the quiz name and result through javascript (pass the variable from javascript to php)
if(isset($_GET['result']) and isset($_GET['id'])) {
    $username =  $_SESSION['username'];
    $today = date("F j, Y, g:i a"); 
    $result = $_GET['result'];
    //echo $result;
    $quiz = $_GET['id']; //get quiz id from quiz.php

    //$score = "INSERT INTO quiz_taken SET date_taken='$today', points_accumulated='$result', username='$username', quiz_taken='$quiz'"; 
    $score = "INSERT INTO quiz_taken (date_taken, points_accumulated, username, quiz_taken) VALUES ('$today', $result, '$username', $quiz)";
    $insert = mysqli_query($link, $score) or die(mysqli_error($link));

    if($insert) {
        echo "updated!";
    } else {
        echo "fail";
    }
}