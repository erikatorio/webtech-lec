<?php
require('connect.php');

$query = "SELECT topic_id, username, topic_title, topic_name, description FROM topic";
$result = mysqli_query($link, $query) or die(mysqli_error($link));

$topics = array();

while($row = mysqli_fetch_assoc($result)) {
    $topics[] = $row;
}

echo json_encode($topics);