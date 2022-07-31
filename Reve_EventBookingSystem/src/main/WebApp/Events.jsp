<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- JSTL Tags for Dynamic Table and date formatting -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rêve - Event Booking</title>
    <!-- Favicon -->
    <link rel="icon" href="images/butterfly.ico">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
    
    <!-- Icons -->
    <script src="https://kit.fontawesome.com/f4fe8c127f.js" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;300;500;900&family=Source+Serif+Pro:ital@0;1&family=Whisper&display=swap" rel="stylesheet">
    <!-- StyleSheets -->
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/Events.css">
</head>

<body>

<div class="container-fluid">
  
  <!-- NavBar -->
  <nav class="navbar navbar-expand-lg navbar-light">
      <div class="container-fluid">
          
        <a class="navbar-brand logo" href="/">Rêve</a>
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
              
          <ul class="navbar-nav">
            <li class="nav-item">
            <a class="nav-link" aria-current="page" href="index.jsp#about-us">About Us</a>
            </li>
            <li class="nav-item">
            <a class="nav-link active" href="Events">Book Event</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="#">Past Events</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href="index.jsp#contact-us">Contact Us</a>
            </li>
          </ul>
        </div>
  
        <ul class="navbar-nav">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-solid fa-arrow-right-to-bracket"></i>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="dropdown-item btn" href="#">Login</a></li>
                <li><a class="dropdown-item" href="Registration.jsp">Registration</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="EventMaster/EMlogin">Event Master</a></li>
            </ul>
        </li>
        </ul>
          
      </div>
  </nav>
  
  <h2 class="heading">Upcoming Events</h2>
  
  <!-- TABLE -->
  <table id="table">
    <!-- Headings -->
    <thead>
      <th>Event ID</th>
      <th>Event Name</th>
      <th>Venue</th>
      <th>Start</th>
      <th>End</th>
      <!-- <th>Attendance</th> -->
      <th>Book</th>
    </thead>
    <!-- Content -->
    <tbody>
    <c:forEach var="e" items="${events}">
    	<tr> 
        <td>${e.eventID}</td>
        <td>${e.eventName}</td>
        <td>${e.venue}</td>
        <td><fmt:formatDate type = "both" pattern="dd-MM-yyyy, h:mm a" value = "${e.startDate}"/></td>
        <td><fmt:formatDate type = "both" pattern="dd-MM-yyyy, h:mm a" value = "${e.endDate}"/></td>
        <!-- <td>${e.attendance}</td> -->
        <td><a href="bookAnEvent-${e.eventID}"><button class="btn custom-btn">Book Event</button></a></td>
      </tr>
    </c:forEach>
    
      
      
    </tbody>
  </table>



<!-- ----------------------LOGIN MODAL----------------------- -->

  <!-- Button trigger modal -->
  <!-- Login Modal Form -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
          
        <div class="modal-header">
          <h4 class="modal-title" id="exampleModalLabel">Login Window</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            
          <div class="md-form mb-3">
            <i class="fa-solid fa-envelope"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-email">Username:</label>
            <input type="email" id="defaultForm-email" class="form-control validate">
          </div>
  
          <div class="md-form mb-3">
            <i class="fa-solid fa-lock"></i>
            <label data-error="wrong" data-success="right" for="defaultForm-pass">Password:</label>
            <input type="password" id="defaultForm-pass" class="form-control validate">
          </div>
          <p>New User? Register <a href="Registration.jsp">here</a>.</p>  
        </div>
        <div class="modal-footer">
          <button type="button" class="btn login-btn gap-2 col-4 mx-auto">LOGIN</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
    
</body>
</html>