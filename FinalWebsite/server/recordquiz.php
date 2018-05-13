<?php
session_start();
date_default_timezone_get();
require('connect.php');

//get the value of the quiz name and result through javascript (pass the variable from javascript to php)
if(isset($_GET['result']) and isset($_GET['id'])) {
    $username =  $_SESSION['username'];
    $today = date("Y-m-d");
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
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style/main.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:500" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand ml-5" href="../pages/home.html">
      <img src="../image/Logo1x.png" alt="" id="logos">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto mr-5">
        <li class="nav-item active">
          <a class="nav-link" href="../pages/home.html">Catalog<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Profile
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="logout.php">Logout</a>
            <a class="dropdown-item" href="../pages/profile.html">Profile</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="row mt-5">
    <div class="col-sm-0 col-md-3"></div>
    <div class="col-sm-0 col-md-6">
      <div class="container track-card">
        <div class="row">
          <div class="col-4">
            <div class="container status mt-3">
                <h6 id="statusCode">Your <br><br> Score</h6>
            </div>
          </div>
          <div class="col-8">
            <h5 class="mt-3">You got:</h5>
            <p class="text-justify" style="font-size: 50px;">
            <?php $result = $_GET['result'];
              echo $result;
            ?>
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="col-sm-0 col-md-3"></div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>
