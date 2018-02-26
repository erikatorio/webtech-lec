<?php
if (isset($_POST['query'])) {
    $query = $_POST['query'];

    switch(strtolower($query)) {
        case "www":
            Header("Location: www.html");
            break;
        case "html":
            Header("Location: html.html");
            break;
        case "http":
            Header("Location: http.html");
            break;
        default:
            Header("Location: index.html");
    }
}
unset($_POST['query']);