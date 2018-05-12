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

    $score = "INSERT INTO quiz_taken (date_taken, points_accumulated, username, quiz_taken) VALUES ('$today', $result, '$username', $quiz)";
    $insert = mysqli_query($link, $score) or die(mysqli_error($link));

    if($insert) {
        //echo "updated!";
    } else {
        echo "fail";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Code ninja</title>
    <link rel="stylesheet" href="Bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/main.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand ml-5" href="#">
      <img src="image/Logo1x.png" alt="" id="logos">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto mr-5">
        <li class="nav-item active">
          <a class="nav-link" href="#">Catalog<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Learn</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Profile
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="logout.php">Logout</a>
            <a class="dropdown-item" href="profile.html">Profile</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="results">
      <?php $result = $_GET['result'];
        echo $result;
      ?>
  </div>
</body>
</html>