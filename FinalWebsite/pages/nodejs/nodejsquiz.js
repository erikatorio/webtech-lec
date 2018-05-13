function initialize() {
    var request = new XMLHttpRequest();
    //id = document.getElementById('quiz_name').value;
    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200){
            var q = JSON.parse(request.responseText);
            var a = request.responseText;
            console.log(q);
            function buildQuiz() {
                const output = [];
            
                q.forEach((currentQuestion, questionNumber) => {
                    const answers = [];
            
                    for (letter in currentQuestion.answers) {
                        //console.log(currentQuestion.answers[letter].a);
                        answers.push(
                            `<label>
                            <input type="radio" name="question${questionNumber}" value="a">
                                a.
                                ${currentQuestion.answers[letter].a}
                            </label>
                            <br>`
                        );
                        answers.push(
                            `<label>
                            <input type="radio" name="question${questionNumber}" value="b">
                                b.
                                ${currentQuestion.answers[letter].b}
                            </label>
                            <br>`
                        );
                        answers.push(
                            `<label>
                            <input type="radio" name="question${questionNumber}" value="c">
                                c.
                                ${currentQuestion.answers[letter].c}
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
        
            function sendResults() {
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
                window.location.href = "../../server/recordquiz.php?result="+correct+"&id="+1;
                // if (correct == 1) {
                //     resultsContainer.innerHTML = `You correctly answered ${correct} question out of ${q.length} questions!`;
                // } else if (correct == 0) {
                //     resultsContainer.innerHTML = `You have no correct answers!`;
                // } else {
                //     resultsContainer.innerHTML = `You correctly answered ${correct} questions out of ${q.length} questions!`;
                // }
            
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
            submitButton.addEventListener("click", sendResults);
            previousButton.addEventListener("click", showPreviousSlide);
            nextButton.addEventListener("click", showNextSlide);
        }
    };
    //console.log(id);
    var id = 3;
    request.open('GET', '../../server/quiz.php?id='+id, true);
    request.send();
}
initialize();