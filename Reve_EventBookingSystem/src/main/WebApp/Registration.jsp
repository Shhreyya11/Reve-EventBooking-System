<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R�ve - User Registration</title>
    <link rel="icon" href="images/butterfly.ico">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    
    <!-- Icons -->
    <script src="https://kit.fontawesome.com/f4fe8c127f.js" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;900&family=Source+Serif+Pro:ital@0;1&family=Whisper&display=swap" rel="stylesheet">

    <!-- StyleSheets -->
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/Registration.css">
</head>


<body>
    <p>Return to <a href="/" class="logo">R�ve</a> homepage.</p>
    <br>

    <h2 class="heading">User Registration</h2>

    <form action="registerUser"  method="post" onsubmit="return check();">

  <div class="form-group">
    <label for="id" class="col-form-label">Name:</label>
    <input type="text" class="form-control" id="id" name="name" required>
  </div>
  <div class="form-group">
    <label for="username" class="col-form-label">Username:</label>
    <input type="email" class="form-control" id="username" name="email" required>
  </div>
  <div class="form-group">
    <label for="dob" class="col-form-label">Date of Birth:</label>
    <input type="date" class="form-control" id="dob" name="dob" required>
  </div>
  <div class="form-group">
    <label for="pwd" class="col-form-label">Password:</label>
    <input type="password" class="form-control" id="pwd" name="pwd" onkeyup="recheck()" required >
  </div>
  <div class="form-group">
    <label for="cpwd" class="col-form-label">Confirm password:</label>
    <input type="password" class="form-control" id="cpwd" name="cpwd" onkeyup="recheck()" required >
    <span id="errorMessage"></span>
  </div>

  <br>
  <!-- SUBMIT -->
  <button type="submit" value="Submit" class="btn custom-btn col-3">REGISTER</button>
  
</form>

      <br><br>
      
<script src="Registration.js"></script>

</body>
</html>