<?php
session_start();
require('connect.php');

if (isset($_POST['username']) and isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = "SELECT * FROM accounts WHERE username='$username' AND password='$password'";

    $result = mysqli_query($link, $query) or die(mysqli_error($link));

    $user = mysqli_fetch_row($result);
    if ($user[0] == $username && $user[1] == $password) {
        $_SESSION['username'] = $username;

        Header("Location: home.html");

        $active = "UPDATE accounts SET status='1' WHERE username='$username'";
        mysqli_query($link, $active);
    } else {
        echo "Invalid Login Credentials";
        echo "<a href='index.html'><br>Back</a>";
    }
}