<?php
session_start();
require('connect.php');

$query = "SELECT questions.question_id, question, questions.quiz_id, correctanswer, choices.idchoices, choices.a, choices.b, choices.c FROM quiz JOIN questions ON quiz.quiz_id = questions.quiz_id JOIN choices ON questions.question_id = choices.question_id WHERE quiz.quiz_id = 2";

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

        $questions[$questionIndex]['correct'] = $row['correctAnswer'];
    }

    if($choiceID != $row['idchoices']) {
        $choiceIndex++;
        $choiceID = $row['idchoices'];
        //$choicekeys = array(a, b, c);

        $questions[$questionIndex]['answers'][$choiceIndex] = array(
            'a' => $row['a'],
            'b' => $row['b'],
            'c' => $row['c']
        );
    }
}
$j = json_encode($questions);
?>
<script>
const q = <?php echo $j?>;
console.log(q)
(function() {
    function buildQuiz() {
      const output = [];
  
      q.forEach((currentQuestion, questionNumber) => {
        const answers = [];
  
        for (letter in currentQuestion.answers) {
          answers.push(
            `<label>
               <input type="radio" name="question${questionNumber}" value="${letter}">
                ${letter}.
                ${currentQuestion.answers[letter]}
             </label>`
          );
        }
  
        output.push(
          `<div class="slide">
             <div class="question"> ${currentQuestion.question} </div>
             <div class="answers"> ${answers.join("")} </div>
           </div>`
        );
      })
  
      quizContainer.innerHTML = output.join('');
    }
  
    function showResults() {
      const answerContainers = quizContainer.querySelectorAll(".answers");
  
      let correct = 0;
  
      q.forEach((currentQuestion, questionNumber) => { 
        const answerContainer = answerContainers[questionNumber];
        const selected = `input[name=question${questionNumber}]:checked`;
        const userAns = (answerContainer.querySelector(selected) || {}).value;
  
        if (userAns === currentQuestion.correctAnswer) {
          correct++;
  
          answerContainers[questionNumber].style.color = " #27ae60";
        } else {
          answerContainers[questionNumber].style.color = "red";
        }
      });
      if (correct == 1) {
        resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${q.length} questions!`;
      } else if (correct == 0) {
        resultsContainer.innerHTML = `You have no correct answers!`;
      } else {
        resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${q.length} questions!`;
      }
      
    }
  
    function showSlide(n) {
      slides[currentSlide].classList.remove("active-slide");
      slides[n].classList.add("active-slide");
      currentSlide = n;
      
      if (currentSlide === 0) {
        previousButton.style.display = "none";
      } else {
        previousButton.style.display = "inline-block";
      }
      
      if (currentSlide === slides.length - 1) {
        nextButton.style.display = "none";
        submitButton.style.display = "inline-block";
        resetButton.style.display = "inline-block";
      } else {
        nextButton.style.display = "inline-block";
        submitButton.style.display = "none";
        resetButton.style.display = "none";
      }
    }
  
    function showNextSlide() {
      showSlide(currentSlide + 1);
    }
  
    function showPreviousSlide() {
      showSlide(currentSlide - 1);
    }
  
    function restartQuiz() {
      location.reload();
    }
  
    const quizContainer = document.getElementById('quiz');
    const resultsContainer = document.getElementById('results');
    const submitButton = document.getElementById('submit');
    const resetButton = document.getElementById('reset');
  
    buildQuiz();
  
    const previousButton = document.getElementById('previous');
    const nextButton = document.getElementById('next');
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;
  
    showSlide(0);
  
    resetButton.addEventListener("click", restartQuiz);
    submitButton.addEventListener("click", showResults);
    previousButton.addEventListener("click", showPreviousSlide);
    nextButton.addEventListener("click", showNextSlide);
})();
</script>