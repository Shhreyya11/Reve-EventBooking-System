<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- JSTL Tags for Dynamic Table and date formatting -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
          <a href="pastEvents" class="nav-link active">
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
          <li><a class="dropdown-item" href="EMlogin">Sign out</a></li>
        </ul>
      </div>
  </div>

  <main>
    <h1>Past Events</h1>

    <!-- TABLE -->
    <table id="table">
      <!-- Headings -->
      <thead>
        <th>Event ID</th>
        <th>Event Name</th>
        <th>Venue</th>
        <th>Start</th>
        <th>End</th>
        <th>Attendance</th>
      </thead>
      <!-- Content -->
      <tbody>
      <c:forEach items="${events}" var="event">
          <tr> 
            <td>${event.eventID}</td>
            <td>${event.eventName}</td>
            <td>${event.venue}</td>
            <td><fmt:formatDate type = "both" pattern="yyyy-MM-dd hh:mm a" value = "${event.startDate}"/></td>
            <td><fmt:formatDate type = "both" pattern="yyyy/MM/dd hh:mm a" value = "${event.endDate}"/></td>
            <td>${event.attendance}</td>
          </tr>
      </c:forEach>
        
      </tbody>
    </table>

	<!----------------- For Editing Events' List ---------------------->

  <!-- EDIT BUTTON -->
  <button type="button" class="btn custom-btn" data-toggle="modal" data-target="#EditEvent">EDIT</button>

  <!-- DELETE BUTTON -->
  <button type="button" class="btn custom-btn" data-toggle="modal" data-target="#DeleteEvent"><i class="fa-solid fa-trash"></i></button>

  <!-- Modal: Edit Event -->
  <div class="modal fade" id="EditEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Edit Selected Row</h5>
          <button type="button" class="btn close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true"><strong>&times;</strong></span>
          </button>
        </div>

        <form action="/editEvent" method="post" modelAttribute="event">

            <div class="modal-body">
                <div class="form-group">
                <fieldset disabled>
                  <label for="eventID" class="col-form-label">Event ID:</label>
                  <input type="text" class="form-control" id="id" name="id">
                  </fieldset>
                  <input type="hidden" id="hiddenId" name="eventID">
                </div>
                <div class="form-group">
                <fieldset disabled>
                  <label for="name" class="col-form-label">Event Name:</label>
                  <input type="text" class="form-control" id="name" name="eventName">
                  </fieldset>
                </div>
                <div class="form-group">
                  <label for="venue" class="col-form-label">Venue:</label>
                  <input type="text" class="form-control" id="venue" name="venue">
                </div>
                <div class="form-group">
                  <label for="start" class="col-form-label">Start:</label>
                  <input type="datetime-local" class="form-control" id="start" name="startDate">  
                </div>
                <div class="form-group">
                  <label for="end" class="col-form-label">End:</label>
                  <input type="datetime-local" class="form-control" id="end" name="endDate">
                </div>
                <div class="form-group">
                <fieldset disabled>
                  <label for="atdc" class="col-form-label">Attendance:</label>
                  <input type="text" class="form-control" id="atdc" name="attendance">
                  </fieldset>
                </div>
            </div>

            <div class="modal-footer">
              <!-- Save Changes -->
              <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
              <button onclick="editRow();" type="submit" value="Submit" class="btn custom-btn">SAVE</button>
            </div>
            
            </form>

      </div>
    </div>
  </div>

  <!-- Modal: Delete Event -->
  <div class="modal fade" id="DeleteEvent" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Delete a record</h5>
          <button type="button" class="btn close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true"><strong>&times;</strong></span>
          </button>
        </div>

        <form action="deleteEvent" method="post">
        
        <div class="modal-body">
          <p class="mb-2">Are you sure you want to delete the following record?</p>
          <fieldset disabled>
            <div class="form-group">
              <label for="id-del" class="col-form-label">Event ID:</label>
              <input type="text" class="form-control" id="id-del">
            </div>
            <div class="form-group">
              <label for="name-del" class="col-form-label">Event Name:</label>
              <input type="text" class="form-control" id="name-del">
            </div>
          </fieldset>
          	<!-- To Send eventID to backend -->
            <input hidden id="hiddenIDdel" name="hiddenIDdel">
        </div>
        <div class="modal-footer">
          <!-- Save Changes -->
          <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
          <button onclick="editRow();" type="submit" class="btn btn-danger">DELETE</button>
        </div>
        
      </form>

      </div>
    </div>
  </div>


  <script src="eventMaster.js"></script>

  </main>

</body>
</html>