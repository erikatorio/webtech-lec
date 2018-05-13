<?php
session_start();
require('connect.php');

//if (isset($_POST['fullname']) and isset($_POST['username']) and isset($_POST['email']) and isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $name = $_POST['fullname'];
    $email = $_POST['email'];
    $hpass = password_hash($password, PASSWORD_DEFAULT);

    $newuser = "INSERT INTO accounts (username, password, email, name) VALUES ('$username', '$hpass', '$email', '$name')";
    $insert = mysqli_query($link, $newuser) or die(mysqli_error($link));

    if($insert) {
        $_SESSION['username'] = $username;

        Header("Location: ../pages/home.html");
    } else {
        Header("Location: ../index.html");
    }
//}