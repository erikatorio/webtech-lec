function topic() {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200){ 
            var t = JSON.parse(request.responseText);
            console.log(t);

        }
    }
    request.open('GET','../server/gettopics.php', true);
    request.send();
}

topic();