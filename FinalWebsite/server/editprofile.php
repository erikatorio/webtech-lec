<?php
session_start();
require('connect.php');

    $username = $_POST['username'];
    $password = $_POST['password'];
    $name = $_POST['fullname'];
    $email = $_POST['email'];
    $currentuser =  $_SESSION['username'];
    $hpass = password_hash($password, PASSWORD_DEFAULT);

    //$edituser = "INSERT INTO accounts (username, password, email, name) VALUES ('$username', '$hpass', '$email', '$name')";
    $edituser = "UPDATE accounts SET username='$username', password='$hpass', email='$email', name='$name' WHERE username='$currentuser'";
    $insert = mysqli_query($link, $edituser) or die(mysqli_error($link));

    if($insert) {
        $_SESSION['username'] = $username;

        Header("Location: ../pages/profile.html");
    } else {
        Header("Location: ../index.html");
    }