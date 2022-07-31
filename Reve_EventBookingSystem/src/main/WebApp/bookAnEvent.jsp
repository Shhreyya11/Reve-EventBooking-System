<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- JSTL Tags for Dynamic Table and date formatting -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rêve - Book a seat</title>

    <!-- Favicon -->
    <link rel="icon" href="images/butterfly.ico">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js" integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-kjU+l4N0Yf4ZOJErLsIcvOU2qSb74wXpOhqTvwVx3OElZRweTnQ6d31fXEoRD1Jy" crossorigin="anonymous"></script>
    
    <!-- Icons -->
    <script src="https://kit.fontawesome.com/f4fe8c127f.js" crossorigin="anonymous"></script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@100;300;500;900&family=Source+Serif+Pro:ital@0;1&family=Whisper&display=swap" rel="stylesheet">
    <!-- FA cheat pro link v5.10-->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous">


    <!-- StyleSheets -->
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/bookAnEvent.css">
</head>

<body onload="populateSoldSeats();">

    <p class="return">Return to <a href="Events">previous</a> page.</p>
<br><br>
    <h2 class="heading">Book seats</h2>


<!--------------------- Form for details -------------------->   
    <form onsubmit="return updateValues();" action="bookSeats" method="post" id="details" modelAttribute="booking">
    <div class="row">
        <div class="col-md-6"> 
        <div class="mb-3">
            <label class="form-label" for="event">Selected Event: </label>
            <select name="event.eventID" id="event" class="form-select" aria-label="Default select example">
                <c:forEach  var="e" items="${eventList}" >
	                <c:if test="${e.eventID == event.eventID}">
	                <option value="${e.eventID}">${e.eventName}</option>
	                </c:if>
                </c:forEach>
            </select>
        </div>
        <input hidden type="text" value="${event.eventName}" name="event.eventName">
        <div>
            <label class="form-label" for="date">Date for booking: </label>
            <input required class="form-control" type="text" id="date" name="eventDateBooked"
            placeholder="Enter Date" onfocus="(this.type='date')"
            min="<fmt:formatDate type = "both"  pattern="yyyy-MM-dd" value = "${bookStartDate}"/>" 
            max="<fmt:formatDate type = "both"  pattern="yyyy-MM-dd" value = "${event.endDate}"/>">
        </div>
        <div>
            <label class="form-label" for="pay">Payment Method: </label>
            <select name="paymentMethod" id="pay" class="form-select" aria-label="Default select example">
                <option value="Cash at Counter">Cash at Counter</option>
            </select>
        </div>
        </div>
        
        <div class="col-md-6">
        <div>
            <label class="form-label" for="booker">Name: </label>
            <input required class="form-control" type="text" id="booker" name="bookerName">
        </div>
        <div>
            <label class="form-label" for="contact">Contact Number: </label>
            <input required class="form-control" type="tel" id="contact" name="contactNumber">
        </div>
        <div>
            <label class="form-label" for="email">Email ID: </label>
            <input required class="form-control" type="email" id="email" name="bookerEmail">
        </div>
        </div>
    </div>


<!-------------------- SEAT SELECTION ----------------------->
    <hr>
    <h5 class="m-4">- Please select desired seats -</h5>

    <input hidden type="text" id="seatNumbers" name="seatNumbers">

    <!-- Guide -->
    <div class="alert alert-secondary p-2" role="alert">
        <p class="mb-0"><strong>Seats available:</strong> &nbsp <i class="guide-icon fas fa-chair-office"></i> Regular: ₹100 &nbsp <i class="guide-icon fas fa-loveseat"></i> VIP: ₹150</p>
        <p class="mb-0">Grey seats are already booked.</p>
    </div>

	<!-- Sold Seats ids passed to JavaScript -->
<%--     <input hidden id="soldSeats" type="text" value="${soldSeats}"> --%>

    <!-- Seats -->
    <div id="seats" class="container">

        <!-- REGULAR -->
    
        <!-- Row 1 -->
        <div class="seat-row">
            <i id="A1" class="fas fa-chair-office"></i>
            <i id="A2" class="fas fa-chair-office"></i>
            <i id="A3" class="fas fa-chair-office"></i>
            <i id="A4" class="fas fa-chair-office"></i>
            <i id="A5" class="fas fa-chair-office"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="A6" class="fas fa-chair-office"></i>
            <i id="A7" class="fas fa-chair-office"></i>
            <i id="A8" class="fas fa-chair-office"></i>
            <i id="A9" class="fas fa-chair-office"></i>
            <i id="A10" class="fas fa-chair-office"></i>
        </div>
        <!-- Row 2 -->
        <div class="seat-row">
            <i id="B1" class="fas fa-chair-office"></i>
            <i id="B2" class="fas fa-chair-office"></i>
            <i id="B3" class="fas fa-chair-office"></i>
            <i id="B4" class="fas fa-chair-office"></i>
            <i id="B5" class="fas fa-chair-office"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="B6" class="fas fa-chair-office"></i>
            <i id="B7" class="fas fa-chair-office"></i>
            <i id="B8" class="fas fa-chair-office"></i>
            <i id="B9" class="fas fa-chair-office"></i>
            <i id="B10" class="fas fa-chair-office"></i>
        </div>
        <!-- Row 3 -->
        <div class="seat-row">
            <i id="C1" class="fas fa-chair-office"></i>
            <i id="C2" class="fas fa-chair-office"></i>
            <i id="C3" class="fas fa-chair-office"></i>
            <i id="C4" class="fas fa-chair-office"></i>
            <i id="C5" class="fas fa-chair-office"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="C6" class="fas fa-chair-office"></i>
            <i id="C7" class="fas fa-chair-office"></i>
            <i id="C8" class="fas fa-chair-office"></i>
            <i id="C9" class="fas fa-chair-office"></i>
            <i id="C10" class="fas fa-chair-office"></i>
        </div>
        <!-- Row 4 -->
        <div class="seat-row">
            <i id="D1" class="fas fa-chair-office"></i>
            <i id="D2" class="fas fa-chair-office"></i>
            <i id="D3" class="fas fa-chair-office"></i>
            <i id="D4" class="fas fa-chair-office"></i>
            <i id="D5" class="fas fa-chair-office"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="D6" class="fas fa-chair-office"></i>
            <i id="D7" class="fas fa-chair-office"></i>
            <i id="D8" class="fas fa-chair-office"></i>
            <i id="D9" class="fas fa-chair-office"></i>
            <i id="D10" class="fas fa-chair-office"></i>
        </div>
            
    <br>
        <!-- VIP SEATS -->
        
        <!-- Row 5 -->
        <div class="vip-row">
            <i id="V1" class="fas fa-loveseat"></i>
            <i id="V2" class="fas fa-loveseat"></i>
            <i id="V3" class="fas fa-loveseat"></i>
            <i id="V4" class="fas fa-loveseat"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="V5" class="fas fa-loveseat"></i>
            <i id="V6" class="fas fa-loveseat"></i>
            <i id="V7" class="fas fa-loveseat"></i>
            <i id="V8" class="fas fa-loveseat"></i>
        </div>
    
        <!-- Row 6 -->
        <div class="vip-row">
            <i id="VV1" class="fas fa-loveseat"></i>
            <i id="VV2" class="fas fa-loveseat"></i>
            <i id="VV3" class="fas fa-loveseat"></i>
            <p style="display: inline;">&nbsp &nbsp &nbsp</p>
            <i id="VV4" class="fas fa-loveseat"></i>
            <i id="VV5" class="fas fa-loveseat"></i>
            <i id="VV6" class="fas fa-loveseat"></i>  
        </div>
        
    </div>


<!-- -------------------- PRICING & BOOKING ----------------------- -->

<div class="container-fluid">
    <!-- Price Display -->
    <div class="alert alert-info p-2 w-50" role="alert">
        <p class="mb-1">Seats selected: <span id="regular">0</span> Regular & <span id="vip">0</span> VIP seats.</p>
        <input hidden type="number" name="seatsReg" id="regSeats">
        <input hidden type="number" name="seatsVIP" id="vipSeats">
        <p class="mb-0"><strong>Total price: ₹ <span id="priceDisplay">0</span></strong></p>
        <input hidden type="number" name="price" id="price">
    </div>

    <!-- Book the tickets
    <button class="btn btn-secondary">BOOK THE TICKETS</button>
    
    Booking Success
    <div id="bookingAlert" class="success-prompt alert alert-success fade show p-3 mb-2" role="alert" style="visibility: hidden;">
        <p id="response" class="mb-0">Booking Successful! Tickets confirmed.</p>
        <p class="mb-0">Return to <a href="Events">previous</a> page.</p>
    </div> -->
    
    <!-- Book the tickets -->
        <button type="submit" value="Submit" class="btn btn-secondary btn-booking">BOOK THE TICKETS</button>

        <!-- Booking Success -->
        <div id="bookingAlert" class="success-prompt alert alert-success fade show p-3 mb-2" role="alert" style="visibility: hidden;">
            <p id="response" class="mb-0">Booking Successful! Tickets confirmed.</p>
            <!-- <p class="mb-0">Return to <a href="Events.html">previous</a> page.</p> -->
            <a href="bookSuccess"><strong>Check Booking Details</strong></a>
        </div>
    
</div>

</form>

<!-- JQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- JavaScript -->
<script src="bookAnEvent.js"></script>
</body>
</html>