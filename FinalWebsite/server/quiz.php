<?php
session_start();
require('connect.php');
//pass quiz_id here using $_GET, javascript of topic home page (the start button per subtopic has a value attribute) would have click event then 
// https://stackoverflow.com/questions/8191124/send-javascript-variable-to-php-variable 
if(isset($_GET['id'])) {
    $quizid = $_GET['id'];
    $query = "SELECT questions.question_id, question, questions.quiz_id, correctanswer, choices.idchoices, choices.a, choices.b, choices.c FROM quiz JOIN questions ON quiz.quiz_id = questions.quiz_id JOIN choices ON questions.question_id = choices.question_id WHERE quiz.quiz_id = '$quizid'";

$result = mysqli_query($link, $query) or die(mysqli_error($link));

$questions = array();

$questionID = 0;
$choiceID = 0;

$questionIndex = -1;
$choiceIndex = -1;

while ($row = mysqli_fetch_assoc($result)) {
    if ($questionID != $row['question_id']) {
        $questionIndex++;
        $choiceIndex = -1;
        $questionID = $row['question_id'];

        $questions[$questionIndex]['question'] = $row['question'];

        $questions[$questionIndex]['answers'] = array();

        $questions[$questionIndex]['correctAnswer'] = $row['correctanswer'];
    }

    if($choiceID != $row['idchoices']) {
        $choiceIndex++;
        $choiceID = $row['idchoices'];
        $a = 

        $questions[$questionIndex]['answers'][$choiceIndex] = array(
            'a' => $row['a'],
            'b' => $row['b'],
            'c' => $row['c']
        );
    }
}
echo json_encode($questions);
}
?>