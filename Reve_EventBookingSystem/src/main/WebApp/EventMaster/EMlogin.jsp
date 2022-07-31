<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Master - Login</title>
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

<body class="login" style="background-image: url('../images/background.jpg'); background-size: 100% 110%;">

    <p>Return to <a href="/" class="logo">R�ve</a> homepage.</p>


    <div class="text-col" >
        <h2>Event Master Login</h2>
        <form action="adminLogin" method="post">
            <div class="form-group">
                <label for="username">Admin Username:</label> <br>
                <input id="username" class="col-12" type="text" name="username">
                <br>
                <label for="pwd">Password:</label> <br>
                <input id="pwd" class="col-12"  type="password" name="password">
            </div>
           
            <button type="submit" class="btn  custom-btn" onclick="window.location.href='EMhome.jsp';">LOGIN</button>
        </form>

    </div>


</body>
</html>