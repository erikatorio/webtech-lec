<?php
session_start();
require('connect.php');

$query = "SELECT questions.question_id, question, questions.quiz_id, correctanswer, choices.id, choice FROM quiz JOIN questions ON quiz.quiz_id = questions.quiz_id JOIN choices ON questions.question_id = choices.question_id WHERE quiz.quiz_id = 1";

$result = mysqli_query($link, $query) or die(mysqli_error($link));

// $questionfield = array_fill_keys(array(question), null);

// $choicekeys = array(a, b, c);
// $choicefields = array_fill_keys($choice_keys, null);

// $questions = array();
// $choice = array();

// while ($row = mysqli_fetch_assoc($result)) {
//     $questionID = $row['question_id'];
//     $choiceID = $row['id'];
//     if(isset($questions[$questionID]['choices'])) {
//         $questions[$questionID]['choices'][] = array_intersect_key($choiceID, $choicefields);
//     } else {
//         $questions[$questionID] = array_intersect_key($row, $questionfield);
//         $questions[$questionID]['choices'] = array(array_intersect_key($, $choicefields));
//     }
// }

// $questions = array_values($questions);
// echo json_encode($questions);

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

        $questions[$questionIndex]['theQuestion'] = $row['question'];

        $questions[$questionIndex]['choices'] = array();

        $questions[$questionIndex]['correct'] = $row['correctanswer'];
    }

    if($choiceID != $row['id']) {
        $choiceIndex++;
        $choiceID = $row['id'];
        //$choicekeys = array(a, b, c);

        $questions[$questionIndex]['choices'][$choiceIndex][strval($choiceIndex+1)] = $row['choice'];
    }
}
$j = json_encode($questions)
?>

<script type="text/javascript">
const q = <?php echo $j?>;
console.log(q)
</script>