<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Code ninja</title>
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-grid.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style/main.css">
    <link rel="stylesheet" href="../svg-with-js/css/fa-svg-with-js.css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="icon" type="image/png" href="../image/course_logo.png">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand ml-5" href="../pages/home.html">
      <img src="../image/Logo1x.png" alt="" id="logos">
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="../pages/home.html">Catalog<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="../pages/discussion.html">Community<span class="sr-only">(current)</span></a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto mr-5">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Profile
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="../server/logout.php">Logout</a>
            <a class="dropdown-item" href="../pages/profile.html">Profile</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <div class="wrapper-topic">
      <div class="container-fluid">
          <div class="container">
              <div class="row">
                  <div class="col-12">
                      <h2 class="mt-5"><?php echo $_GET['title']." (".$_GET['topic'].")"; ?></h2>
                      <p>Topic Description
                          <br>
                          <?php echo $_GET['description']; ?>
                      </p>
                  </div>
              </div>
              <div class="row mt-4">
                <div class="col-12">
                <h3 class="mt-5">Comments</h3>
                    <div class="container post1">
                    <?php
                        require('connect.php');

                        if(isset($_GET['id'])) {
                            $topicid = (int)$_GET['id']; 
                            $query = "SELECT username, comment FROM comments WHERE topic_id = $topicid";
                            $result = mysqli_query($link, $query) or die(mysqli_error($link));
                            $posts = array();

                            while($row = mysqli_fetch_assoc($result)) {
                                $posts[] = $row;
                                echo "<h5>".$row['username']."</h5>";
                                echo "<p>".$row['comment']."</p>";
                            }
                        }
                    ?>
                    </div>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-8">
                    <div class="container">
                            <form method="POST" action="addcomment.php?id=<?php echo $_GET['id']?>&topic=<?php echo $_GET['topic']; ?>&title=<?php echo $_GET['title']; ?>&description=<?php echo$_GET['description']; ?>">
                                    <div class="form-group">
                                        <textarea class="form-control col-12" id="postComment" rows="10" name="comment"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Post</button>
                                    </div>
                            </form>
                    </div>
                </div>
              </div>
          </div>
      </div>
  </div>
<footer class="container-fluid">
  <div class="container mt-5">
    <div class="container">
        <div class="row">
          <div class="col-sm-12 col-md-4">
            <div class="container banner-footer">
              <h5>Code ninja</h5>
              <ul>
                <li><a href="#">Discussion</a></li>
                <li><a href="#">About us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md-4">
            <div class="container footer-catalog">
              <h4>Catalog</h4>
              <ul>
                <li>
                  <a href="#">Java Servlet</a>
                </li>
                <li>
                  <a href="#">PHP</a>
                </li>
                <li>
                  <a href="#">Nodejs</a>
                </li>
                <li>
                  <a href="#">Web security</a>
                </li>
              </ul>
            </div>
          </div>
          <div class="col-sm-12 col-md-4">
            <div class="container footer-catalog">
                <h4>Resources</h4>
                <ul>
                  <li>
                    <a href="#">Java Servlet</a>
                  </li>
                  <li>
                    <a href="#">PHP</a>
                  </li>
                  <li>
                    <a href="#">Nodejs</a>
                  </li>
                  <li>
                    <a href="#">Web security</a>
                  </li>
                </ul>
            </div>
          </div>
        </div>
    </div>
  </div>
  <div class="container-fluid footer-child">
      <div class="container">
        <div class="row text-center">
          <div class="col-12">
              <h5 class="mt-3">9340A-G4 © Code ninja</h5>
          </div>
        </div>
      </div>
  </div>
</footer>
  <!-- Bootstrap script -->
  <script src="../svg-with-js/js/fontawesome-all.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
</body>
</html>



