function profile() {
    var request = new XMLHttpRequest();

    request.onreadystatechange = function() {
        if (request.readyState == 4 && request.status == 200){ 
            var p = JSON.parse(request.responseText);
            console.log(p);
            function displayProfile() {
                const uname = `<h2 id="userName">Username: ${p.username}</h2>`;
                const name = `<h3 id="user-Name">Name: ${p.name}</h3>`;
                const email = `<h2 id="userMail">Email: ${p.email}</h2>`;
                const points = `<button type="button" class="btn btn-primary">
                Points <span class="badge badge-light">${p.points}</span>
              </button>`;
                unameContainer.innerHTML = uname;
                nameContainer.innerHTML = name;
                emailContainer.innerHTML = email;
                poinstContainer.innerHTML = points;
            }
            const unameContainer = document.getElementById('vusername');
            const nameContainer = document.getElementById('vname');
            const emailContainer = document.getElementById('vemail');
            const poinstContainer = document.getElementById('vpoints');
            displayProfile();
        }        
    }
    request.open('GET','../server/profile.php', true);
    request.send();
    
}

profile();