function topic() {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200){ 
            var t = JSON.parse(request.responseText);
            console.log(t);
            function displayTopics() {
                const output = [];
                t.forEach((currentTopic, count) => {
                    output.push(
                        `
                        <div class="container content-discuss">
                        <a href="../server/getposts.php?id=${currentTopic.topic_id}&topic=${currentTopic.topic_name}&title=${currentTopic.topic_title}&description=${currentTopic.description}">
                            <div class="row">
                                <div class="col-1">
                                  <div class="side-design">
                                  </div>
                                </div>
                                <div class="col-11">
                                  <h3 class="mt-4">${currentTopic.topic_title} (${currentTopic.topic_name})</h3>
                                  <h10 class="mt-3">Posted by: ${currentTopic.username}</h4>
                                  <p>${currentTopic.description}</p>
                                </div>
                            </div>
                            </a>
                        </div>`
                    );
                })
                topicContainer.innerHTML = output.join('');
            }
            const topicContainer = document.getElementById('topic-container');
            displayTopics();
        }
    }
    request.open('GET','../server/gettopics.php', true);
    request.send();
}

topic();