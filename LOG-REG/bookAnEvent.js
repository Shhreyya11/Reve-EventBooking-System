//----------------------- BACK-END: Populating Sold seats ------------------------------

// let inp = document.getElementById("soldSeats").value;
// let soldSeats = inp.split(" ");

// function populateSoldSeats(){
//     for(let i= 0; i<soldSeats.length; i++){
//         //console.log(document.getElementById(soldSeats[i]));
//         document.getElementById( soldSeats[i] ).classList.add("sold");
//     }
// }

$("#date").change(function(){
    // remove any previously selected seats and unset sold-marked from previous date
    $(".selected").removeClass("selected");
    $(".sold").removeClass("sold");

    // Values of Date and EventID to send as parameters for query
    let date = $("#date").val();
    let eventID = $("#event").val();

    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        //dataType: "dataType",
        // Get Data from sending Query to backend 
        url: "/getSoldSeats.json",
        //data: { eid: eventID, dt: date},

        // Populate Sold Seats
        success: function (response) {
            $.each(response, function( i, val) { 
                // Convert each set to array 
                let soldSeats = val.split(", ");
                //mark each seat as sold
                for(let idx = 0; idx < soldSeats.length; idx++){
                    document.getElementById( soldSeats[idx] ).classList.add("sold");
                }
            });
        }
    });

});

//----------------- Seat Selection, Price Calculation, Selected Count -----------------------


// const seats = document.querySelectorAll(".fas:not(.sold)"); //available seats
const container = document.querySelector(".container"); //contains all seats

// 1 --- SELECTING A SEAT ---
container.addEventListener("click", function(e){
    if( e.target.classList.contains("fas") && !e.target.classList.contains("sold") ){
        // Toggle seat [select/deselect]
        e.target.classList.toggle("selected");

        //update seat count & price
        update();
    }
});



// Pricing
let total = document.getElementById("priceDisplay");
//Selected seats count
let regular = document.getElementById("regular");
let vip = document.getElementById("vip");

// 2 --- DISPLAY SEAT COUNT & CALCULATE PRICE
function update(){
    var vip_count = document.querySelectorAll(".vip-row .fas.selected").length;
    var reg_count = document.querySelectorAll(".seat-row .fas.selected").length;

    // seat count
    vip.innerText = vip_count;
    regular.innerText = reg_count
    //price = Rs.100 regular || Rs.150 vip
    total.innerText = vip_count*150 + reg_count*100;
}


// 3 --- UPDATE DETAILS OF SELECTED SEATS  ----

//Update Values in hidden <input> + check if No Seats are selected
function updateValues(){
    $("#bookingAlert").css("visibility", "hidden");

    var vip_count = document.querySelectorAll(".vip-row .fas.selected").length;
    var reg_count = document.querySelectorAll(".seat-row .fas.selected").length;

    var selectedSeats = "";

    document.querySelectorAll(".selected").forEach( x => { // x = element
        selectedSeats = selectedSeats + x.id + ", ";
        // x.classList.remove("selected");
        // x.classList.add("sold");
    });
    console.log(selectedSeats);

    // Sending computed values to Back-End
    if(vip_count + reg_count > 0){
        // Update count, prices, seat numbers into <inuput hidden> 
        document.getElementById("seatNumbers").value = selectedSeats.slice(0, -2);
        document.getElementById("regSeats").value = reg_count;
        document.getElementById("vipSeats").value = vip_count;
        document.getElementById("price").value = total.innerText;
    }
    else{
        // alert("Select seats before booking.");
        displayErrorAlert( "alert-danger"," No Seats have been selected.");
        return false;
    }

}

// 4 --- BOOK TICKETS (selected -> sold) + POST DATA ----
// Controlling Form Submission

$("#details").submit( function(event) { 

    var data =  $("#details").serialize();
    $.post("bookSeats", data, function(response) {
            //first reset the success alert
            // document.getElementById("detailsLink").setAttribute("href", "bookSuccess-" + response);
        })

        .done(function(){
            // Mark selected seats as sold
            $(".selected").addClass("sold");
            // $(".selected").css("color", "green");
            $(".selected").removeClass("selected");

            // Incase reset is required : resubmission [if visible: error displayed...reset]
            $("#bookingAlert").removeClass("alert-danger");
            $("#bookingAlert").removeClass("alert-warning");
            $("#bookingAlert").addClass("alert-success");
            $("#bookingAlert").html('<p id="response" class="mb-0">Booking Successful! Tickets confirmed.</p><a id="detailsLink" href="bookSuccess"><strong>Check Booking Details</strong></a>');
            
            document.getElementsByClassName("btn-booking")[0].disabled = true;
            document.getElementsByClassName("success-prompt")[0].style.visibility = "visible";
        })

        .fail(function(){
            if( $(".selected").length != 0){
                displayErrorAlert( "alert-warning", "Try booking fewer seats.");
            }
        })

    return false;
    // event.preventDefault();
});

var originalAlert = $("#bookingAlert").clone();

// success -1
// error 1/2 -> success
// error 1 <-> 2

function displayErrorAlert(classAdded, message){
   
    var bookingAlert = $("#bookingAlert");
    
    console.log(classAdded);

    // if(error == true){
        $("#bookingAlert").removeClass("alert-success");
        $("#bookingAlert").removeClass("alert-danger");
        $("#bookingAlert").removeClass("alert-warning");

        $("#bookingAlert").addClass(classAdded);

        message = '<p id="response" class="mb-0">ERROR! ' + message +  '</p>';
        $("#bookingAlert").html(message);

        console.log("exit");
    //}

    document.getElementsByClassName("success-prompt")[0].style.visibility = "visible";

};
