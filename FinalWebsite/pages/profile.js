function profile() {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200){ 
            var p = JSON.parse(request.responseText);
            console.log(p);
            function displayProfile() {
                const profile = `<label>Username: </label>
                <br>
                <p>${p.username}</p>
                <label>Your points: </label>
                <p>${p.points}</p>`;
                profileContainer.innerHTML = profile;
            }
            const profileContainer = document.getElementById('profile-container');
            displayProfile();
        }        
    }
    request.open('GET','../server/profile.php', true);
    request.send();
    
}

profile();