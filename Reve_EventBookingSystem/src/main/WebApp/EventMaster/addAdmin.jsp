<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rêve - Event Master</title>
    <link rel="icon" href="../images/butterfly.ico">

    <!-- Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>    
    <!-- Icons -->
    <script src="https://kit.fontawesome.com/f4fe8c127f.js" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;900&family=Source+Serif+Pro:ital@0;1&family=Whisper&display=swap" rel="stylesheet">

    <!-- StyleSheets -->
    <link rel="stylesheet" href="EM.css">
</head>
<body>
 
  <!-- SIDEBAR -->    
  <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;" id="sidebar">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      <span class="fs-4"><span class="logo">Rêve</span> - Event Master</span>
    </a>

    <hr>

    <ul class="items nav nav-pills flex-column">
      <li class="nav-item">
        <a href="EMhome" class="nav-link link-dark" aria-current="page">
            <i class="fa-solid fa-house"></i>
            Home Dashboard: View
        </a>
      </li>
      <li>
        <a href="ListOfEvents" class="nav-link link-dark">
            <i class="fa-solid fa-file-pen"></i>
            List of Events: Edit
        </a>
      </li>
      <li>
        <a href="addEvent" class="nav-link link-dark">
          <i class="fa-solid fa-calendar-plus"></i>
          Add Event
        </a>
      </li>
      <li>
        <a href="pastEvents" class="nav-link link-dark">
          <i class="fa-solid fa-list-check"></i>
          Past Events
        </a>
      </li>
      <li>
        <a href="addAdmin" class="nav-link active">
          <i class="fa-solid fa-user-plus"></i>
          Add Admin
        </a>
      </li>
    </ul>
    <hr>
    <div class="dropdown">
      <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fa-solid fa-house-user"></i>
        Event Master
      </a>
      <ul class="dropdown-menu text-small shadow" aria-labelledby="dropdownUser2">

        <li><a class="dropdown-item" href="EMprofile">Profile</a></li>
        <!--<li><hr class="dropdown-divider"></li>-->
        <li><a class="dropdown-item" href="EMlogin">Sign out</a></li>
      </ul>
    </div>
</div>

<!-- MAIN BODY -->
<main>
    <h1>Add Admin</h1>
    <br>
    <p>Enter the details for the new admin -</p>


    <form class="add-form" onsubmit="return check();" action="registerAdmin" method="post" modelAttribute="admin">
    
        <div class="form-group">
            <label for="adName" class="col-form-label">Name:</label>
            <input type="text" id="adminName" class="form-control" required name="adminName">
        </div>
        <div class="form-group">
            <label for="adUsername" class="col-form-label">Username:</label>
            <input type="text" id="adUsername" class="form-control" required name="username">
        </div>
        <div class="form-group">
            <label for="adEmail" class="col-form-label">Email ID:</label>
            <input type="email" id="adEmail" class="form-control" required name="adminEmail">
        </div>
        <div class="form-group">
            <label for="adDob" class="col-form-label">Date of Birth:</label>
            <input type="date" id="adDob" class="form-control" required name="dob">
        </div>
        <div class="form-group">
            <label for="pwd" class="col-form-label">Password:</label>
            <input type="password" id="pwd" class="form-control" required onkeyup="recheck()" name="password">
        </div>
        <div class="form-group">
            <label for="cpwd" class="col-form-label">Confirm Password:</label>
            <input type="password" id="cpwd" class="form-control" required onkeyup="recheck()">
            <span id="errorMessage"></span>
        </div>

        <br>
        <button class="btn custom-btn col-3" type="submit" value="Submit">ADD ADMIN</button>
        <br>
    </form>

</main>

<script src="../Registration.js"></script>

</body>
</html>