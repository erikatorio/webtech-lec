<?php
session_start();
require('connect.php');

$username =  $_SESSION['username'];
//echo $username;

$profile = "SELECT username FROM accounts WHERE username='$username'";
$result = mysqli_query($link, $profile) or die(mysqli_error($link));
$user = mysqli_fetch_row($result);
//echo $user[0];
$score = "SELECT SUM(points_accumulated) FROM quiz_taken WHERE username='$username'";
$scoreresult = mysqli_query($link, $score) or die(mysqli_error($link));
$total = mysqli_fetch_row($scoreresult);
//echo $total[0];
$info = array();
$info['username'] = $user[0];
$info['points']= $total[0];

echo json_encode($info);