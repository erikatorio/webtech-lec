(function() {
    const JSQuestions = [
        {
          question: "In what HTML element do we put the javascript?",
          answers: {
            a: "<javascript>",
            b: "<java>",
            c: "<script>"
          },
          correctAnswer: "c"
        },
        {
          question: "This is a W3C standard that defines a standard for accessing documents.",
          answers: {
            a: "Document Operation Model",
            b: "Document Object Model",
            c: "Document Access Model"
          },
          correctAnswer: "b"
        },
        {
          question: "This tag is the alternative for the browsers that does not support scripting.",
          answers: {
            a: "<noscript>",
            b: "<nscript>",
            c: "<nscript>",
          },
          correctAnswer: "a"
        },
        {
          question: "This method retrieve references to node in the DOM that returns an element that has an id attribute.",
          answers: {
            a: "getElementById()",
            b: "getElementId()",
            c: "getElement()"
          },
          correctAnswer: "a"
        },
      {
          question: "This method returns a collection of all elements in the document that thas a specified tag name.",
          answers: {
            a: "getElementsByTName()",
            b: "getElementsByTagName()",
            c: "getElementsByTag()"
          },
          correctAnswer: "b"
        },
      {
          question: "This property returns the first child node.",
          answers: {
            a: "1Child",
            b: "fChild",
            c: "firstChild"
          },
          correctAnswer: "c"
        },
      {
          question: "This property returns the last child node.",
          answers: {
            a: "lChild",
            b: "lastChild",
            c: "LastChild"
          },
          correctAnswer: "b"
        },
      {
          question: "The programming language of a HTML and Web.",
          answers: {
            a: "Java",
            b: "C++",
            c: "JavaScript"
          },
          correctAnswer: "c"
        },
      {
          question: "Core language of Java Script",
          answers: {
            a: "EDMAScript",
            b: "ESMAScript",
            c: "ECMAScript"
          },
          correctAnswer: "c"
        },
      {
          question: "This method removes a specified child.",
          answers: {
            a: "removeChild()",
            b: "removeC()",
            c: "rChild()"
          },
          correctAnswer: "a"
        },
      {
          question: "This method appends the node as the last child.",
          answers: {
            a: "aChild(0",
            b: "appendChildNode()",
            c: "appendChild()"
          },
          correctAnswer: "c"
        },
      {
          question: "Inserts a node right before an existing node",
          answers: {
            a: "insertNodeBefore()",
            b: "insertBefore()",
            c: "insertNode()"
          },
          correctAnswer: "b"
        },
      {
          question: "Provide the correct syntax fore reffering to a external javascript called example.js",
          answers: {
            a: "<javascript src='example.js'",
            b: "<script src='example.js'>",
            c: "<java src='example.js'>"
          },
          correctAnswer: "b"
        },
      {
          question: "True/False: The external javascript must contain the <script> tag",
          answers: {
            a: "True",
            b: "False",
          },
          correctAnswer: "a"
        },
      {
          question: "This method creates an element node with the specified name.",
          answers: {
            a: "createNodeElement()",
            b: "createNode()",
            c: "createElement()"
          },
          correctAnswer: "c"
        },
      {
          question: "The method returns the first element that matches a specified CSS selector(s) in the document.",
          answers: {
            a: "getElement()",
            b: "querySelector()",
            c: "returnElement()"
          },
          correctAnswer: "b"
        },
      {
          question: "This method creates a copy of a node, and returns the copied node.",
          answers: {
            a: "cloneNode()",
            b: "copyNode()",
            c: "createNode()"
          },
          correctAnswer: "a"
        },
      {
          question: "This method returns a collection of all elements in the document with the specified class name, as a NodeList object.",
          answers: {
            a: "getElementsByClassName() ",
            b: "getElementsByName()",
            c: "getElementsByClass()"
          },
          correctAnswer: "a"
        },
      {
          question: "This property returns the node type, as a number, of the specified node.",
          answers: {
            a: "nodeNumberType",
            b: "nodeClass",
            c: "nodeType"
          },
          correctAnswer: "c"
        },
        {
          question: "This method adopts a node from another document.",
          answers: {
            a: "adoptNodeElement()",
            b: "adoptNode()",
            c: "adoptChild()"
          },
          correctAnswer: "b"
        }
    ];
  
    function buildQuiz() {
      const output = [];
  
      JSQuestions.forEach((currentQuestion, questionNumber) => {
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
  
      JSQuestions.forEach((currentQuestion, questionNumber) => { 
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
        resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${JSQuestions.length} questions!`;
      } else if (correct == 0) {
        resultsContainer.innerHTML = `You have no correct answers!`;
      } else {
        resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${JSQuestions.length} questions!`;
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