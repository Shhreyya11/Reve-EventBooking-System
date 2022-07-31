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
    <title>Booking Confirmation</title>
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

    <style>
         body{
            background-color: #F7F5F2;
            padding: 7% 3%;
            line-height: 2.2rem;
        }

        .heading{
            color: #F56D91;
            margin: 0 0 3%;
        }

        .subheading{
            color: #8D8DAA;
            font-size: 1.4rem;
            font-weight: 600;
            display: inline;
            /* margin: 100px 20px; */
        }

        p{
            display: inline;
        }
    </style>
</head>
<body>
    <h2 class="heading">Booking Confirmed!</h2>

	<h5 class="subheading">Booking ID: </h5>
    <p>${b.bookingID}</p>
    <br>
    <h5 class="subheading">Event: </h5>
    <p>${b.event.eventName}</p>
    <br>
    <h5 class="subheading">Event Date: </h5>
    <p><fmt:formatDate type = "both" pattern="dd MMMM yyyy, h:mm a" value = "${b.eventDateBooked}"/></p>
    <br>
    <h5 class="subheading">Booker's Name: </h5>
    <p>${b.bookerName}</p>
    <br>
    <h5 class="subheading">Contact Number: </h5>
    <p>${b.contactNumber}</p>
    <br>
    <h5 class="subheading">Seats Booked: </h5>
    <p>${b.seatNumbers}</p>
    <br>

    <button class="btn btn-secondary m-4" onclick="window.print()">GET TICKET</button>

</body>
</html>