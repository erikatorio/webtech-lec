(function() {
  const HTMLQuestions = [
    {
      question: "What does HTML mean?",
      answers: {
        a: "Hypertext Markup Language",
        b: "Hypertext Module Language",
        c: "Hypertext Medium Language"
      },
      correctAnswer: "a"
    },
    {
      question: "These are keywords in an HTML document that define the structure and behavior of an HTML element",
      answers: {
        a: "Content",
        b: "Attributes",
        c: "Tags"
      },
      correctAnswer: "c"
    },
    {
      question: "HTML tag that is used for links",
      answers: {
        a: "img",
        b: "div",
        c: "ul",
        d: "a"
      },
      correctAnswer: "d"
    }
  ];

  function buildQuiz() {
    const output = [];

    HTMLQuestions.forEach((currentQuestion, questionNumber) => {
      const answers = [];

      for (letter in currentQuestion.answers) {
        answers.push(
          `<label>
             <input type="radio" name="question${questionNumber}" value="${letter}">
              ${letter} :
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

    HTMLQuestions.forEach((currentQuestion, questionNumber) => { 
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
      resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${HTMLQuestions.length} questions!`;
    } else if (correct == 0) {
      resultsContainer.innerHTML = `You have no correct answers!`;
    } else {
      resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${HTMLQuestions.length} questions!`;
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