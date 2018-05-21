<?php
require('connect.php');

if(isset($_GET['topicid'])) {
    $topicid = (int)$_GET['topicid']; 
    $query = $link->prepare("SELECT username, post FROM posts WHERE topic_id = ?");
    $query->bind_param("i", $topicid);
    $query->execute();

    $posts = array();

    while($row = mysqli_fetch_assoc($query)) {
        $posts[] = $row;
    }
}
