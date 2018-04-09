(function() {
    const WWWQuestions = [
      {
        question: "Father of the modern World Wide Web",
        answers: {
          a: "Steve Jobs",
          b: "Bill Gates",
          c: "Tim Berners-Lee"
        },
        correctAnswer: "c"
      },
      {
        question: "What year was the WWW proposal made?",
        answers: {
          a: "1989",
          b: "1999",
          c: "1995"
        },
        correctAnswer: "b"
      },
      {
        question: "Which does not belong",
        answers: {
          a: "HTML",
          b: "CSS",
          c: "URL",
          d: "HTTP"
        },
        correctAnswer: "b"
      },
      {
        question: "Who hosted the first website created by the Father of the modern WWW?",
        answers: {
          a: "IETF",
          b: "W3C",
          c: "CERN"
        },
        correctAnswer: "c"
    },
    {
      question: "These are the end devices utilized by clients and servers",
      answers: {
        a: "Hosts",
        b: "Computers",
        c: "Electronic Devices"
      },
      correctAnswer: "a"
    },
    {
      question: "Provides the IP addresses to hosts",
      answers: {
        a: "DMS",
        b: "DNS",
        c: "DWS"
      },
      correctAnswer: "a"
    },
    {
      question: "Pertains to the standards for communication, connections, and data transfer in a network.",
      answers: {
        a: "Protocols",
        b: "Rules",
        c: "Standards"
      },
      correctAnswer: "a"
    }
    ];
  
    function buildQuiz() {
      const output = [];
  
      WWWQuestions.forEach((currentQuestion, questionNumber) => {
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
  
      WWWQuestions.forEach((currentQuestion, questionNumber) => { 
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
        resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${WWWQuestions.length} questions!`;
      } else if (correct == 0) {
        resultsContainer.innerHTML = `You have no correct answers!`;
      } else {
        resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${WWWQuestions.length} questions!`;
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