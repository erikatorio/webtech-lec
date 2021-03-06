(function() {
    const CSSQuestions = [
        {
            question: "Who developed CSS?",
            answers: {
              a: "Steve Jobs",
              b: "Hakon Wium Lee",
              c: "Hailee Steinfeld"
            },
            correctAnswer: "b"
        },
        {
          question: "What is the recommended way of creating your stylesheet?",
          answers: {
            a: "embedded",
            b: "inline",
            c: "external"
          },
          correctAnswer: "c"
      },
      {
        question: "At rule that describes the aspect of intermediate steps in a CSS animation sequence.",
        answers: {
          a: "@import",
          b: "@page",
          c: "@keyframes"
        },
        correctAnswer: "c"
      },
      {
        question: "Combinator denoted by &gt",
        answers: {
          a: "Child combinator",
          b: "Descendant combinator",
          c: "Sibling combinator"
        },
        correctAnswer: "a"
      },
      {
        question: "Combinator denoted by whitespace",
        answers: {
          a: "Child combinator",
          b: "Descendant combinator",
          c: "Sibling combinator"
        },
        correctAnswer: "b"
      },
      {
        question: "Which statement properly declares an ID selector",
        answers: {
          a: "#id",
          b: ".id",
          c: ":id"
        },
        correctAnswer: "a"
      },
      {
        question: "Which statement properly declares a class selector",
        answers: {
          a: "#class",
          b: ".class",
          c: ":class"
        },
        correctAnswer: "b"
      },
      {
        question: "Which statement properly declares a pseudo class",
        answers: {
          a: "#pseudo",
          b: ".pseudo",
          c: ":pseudo"
        },
        correctAnswer: "c"
      },
      {
        question: "How specific is this block of code '#options .selected > option:hover'",
        answers: {
          a: "21",
          b: "121",
          c: "22"
        },
        correctAnswer: "b"
      },
    ];
  
    function buildQuiz() {
      const output = [];
  
      CSSQuestions.forEach((currentQuestion, questionNumber) => {
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
  
      CSSQuestions.forEach((currentQuestion, questionNumber) => { 
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
        resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${CSSQuestions.length} questions!`;
      } else if (correct == 0) {
        resultsContainer.innerHTML = `You have no correct answers!`;
      } else {
        resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${CSSQuestions.length} questions!`;
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