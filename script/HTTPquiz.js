(function() {
    const HTTPQuestions = [
        {
            question: "Who developed HTTP?",
            answers: {
              a: "W3C",
              b: "IETF",
              c: "W3C and IETF"
            },
            correctAnswer: ""
        },
        {
          question: "What is the latest version of HTTP?",
          answers: {
            a: "HTTP 2",
            b: "HTTP 2.3",
            c: "HTTP 2.1"
          },
          correctAnswer: "a"
        },
        {
          question: "Also known as user agents",
          answers: {
            a: "Users",
            b: "Client",
            c: "Server"
          },
          correctAnswer: "b"
        },
        {
          question: "What does URL mean?",
          answers: {
            a: "Uniform Rebound Locator",
            b: "Uniform Resource Layer",
            c: "Uniform Resource Locator"
          },
          correctAnswer: "c"
        },
        {
          question: "What part of a URL pertains to the likes of HTTP or FTP?",
          answers: {
            a: "Scheme",
            b: "Path",
            c: "Protocol"
          },
          correctAnswer: "a"
        },
        {
          question: "What part of an HTTP Request Message is the protocol version found?",
          answers: {
            a: "Message Headers",
            b: "Message Body",
            c: "Request Line"
          },
          correctAnswer: "c"
        },
        {
          question: "What part of an HTTP Response Messages is the status code found?",
          answers: {
            a: "Request Line",
            b: "Status Line",
            c: "Empty Line"
          },
          correctAnswer: "b"
        },
        {
          question: "Type of HTTP method that requests the target resource to perform a resource-specific processing",
          answers: {
            a: "POST",
            b: "HEAD",
            c: "TRACE"
          },
          correctAnswer: "a"
        },
        {
          question: "These are called read-only methods",
          answers: {
            a: "Read Methods",
            b: "Safe Methods",
            c: "Idempotent Methods"
          },
          correctAnswer: "b"
        },
        {
          question: "Type of HTTP Status code that Not Modified belongs",
          answers: {
            a: "Client Error",
            b: "Redirection",
            c: "Informational Error"
          },
          correctAnswer: "b"
        },
        {
          question: "Occurs when a client requests for only part of a resource.",
          answers: {
            a: "Content Negotiation",
            b: "Range Request"
          },
          correctAnswer: "b"
        }

    ];
  
    function buildQuiz() {
      const output = [];
  
      HTTPQuestions.forEach((currentQuestion, questionNumber) => {
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
  
      HTTPQuestions.forEach((currentQuestion, questionNumber) => { 
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
        resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${HTTPQuestions.length} questions!`;
      } else if (correct == 0) {
        resultsContainer.innerHTML = `You have no correct answers!`;
      } else {
        resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${HTTPQuestions.length} questions!`;
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