<?php
session_start();
require('connect.php');

$comment = $_POST['comment'];
$username =  $_SESSION['username'];
$id = (int)$_GET['id'];
$title = $_GET['title'];
$topic = $_GET['topic'];
$description = $_GET['description'];

$insert = $link->prepare("INSERT INTO comments (username, topic_id, comment) VALUES (?,?,?)");
$insert->bind_param("sis", $username, $id, $comment);
$insert->execute();

Header("Location: ../server/getposts.php?id=".$_GET['id']."&topic=".$_GET['topic']."&title=".$_GET['title']."&description=".$_GET['description']);