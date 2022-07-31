<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R�ve - Event Master</title>
    <link rel="icon" href="../images/butterfly.ico">

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
    <link rel="stylesheet" href="EM.css">
</head>

<body>
    
    <!-- SIDEBAR -->    
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;" id="sidebar">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
          <span class="fs-4"><span class="logo">R�ve</span> - Event Master</span>
        </a>

        <hr>

        <ul class="items nav nav-pills flex-column"">
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
            <a href="addEvent" class="nav-link active">
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
          <a href="addAdmin" class="nav-link link-dark">
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
            <li><a class="dropdown-item" href="EMlogin.jsp">Sign out</a></li>
          </ul>
        </div>
    </div>

    <main>
      <h1>Add an Event</h1>
      <br>
      <p>Enter the event details -</p>

      <form class="add-event-form" action="createEvent" method="post" commandName="event">
        <!-- <div class="form-group">
          <label for="id" class="col-form-label">Event ID:</label>
          <input type="text" class="form-control" id="id">
        </div> --> 
        
        <div class="form-group">
          <label for="name" class="col-form-label">Event Name:</label>
          <input type="text" class="form-control" id="name" required name="eventName">
        </div>
        <div class="form-group">
          <label for="venue" class="col-form-label">Venue:</label>
          <input type="text" class="form-control" id="venue" required name="venue">
        </div>
        <div class="form-group">
          <label for="start" class="col-form-label" path="startDate">Start:</label>
          <input type="datetime-local" class="form-control" id="start" required name="startDate">
        </div>
        <div class="form-group">
          <label for="end" class="col-form-label">End:</label>
          <input type="datetime-local" class="form-control" id="end" required name="endDate">
        </div>
        <div class="form-group">
          <label for="atdc" class="col-form-label">Attendance:</label>
          <input type="text" class="form-control" id="atdc" required name="attendance">
        </div>

        <br>
        <button type="submit" value="Submit" class="btn custom-btn col-3">CREATE EVENT</button>
      </form>

    </main>

</body>
</html>