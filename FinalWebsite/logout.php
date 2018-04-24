<?php
session_start();
require('connect.php');

if (isset($_SESSION['username'])) {
    $username = $_SESSION['username'];

    $active = "UPDATE accounts SET status='0' WHERE username='$username'";
    mysqli_query($link, $active);
}

unset($_SESSION['username']);
header('Location: login.html');