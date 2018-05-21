<?php
session_start();
require('connect.php');

$topic = $_POST['topic'];
$title = $_POST['title'];
$description = $_POST['post'];
$username =  $_SESSION['username'];

$insert = $link->prepare("INSERT INTO topic (username, topic_title, topic_name, description) VALUES (?,?,?,?)");
$insert->bind_param("ssss", $username, $title, $topic, $description);
$insert->execute();
//printf("%d Row inserted.\n", $insert->affected_rows);

Header("Location: ../pages/discussion.html");
