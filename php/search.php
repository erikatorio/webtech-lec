<?php
if (isset($_POST['query'])) {
    $query = $_POST['query'];

    switch(strtolower($query)) {
        case "www":
            Header("Location: ../pages/www.html");
            break;
        case "html":
            Header("Location: ../pages/html.html");
            break;
        case "http":
            Header("Location: ../pages/http.html");
            break;
        default:
            Header("Location: ../index.html");
    }
}
unset($_POST['query']);