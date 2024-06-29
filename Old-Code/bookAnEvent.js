// const seats = document.querySelectorAll(".fas:not(.sold)"); //available seats
const container = document.querySelector(".container"); //contains all seats

//Selected seats count
let regular = document.getElementById("regular");
let vip = document.getElementById("vip");

// Pricing
let total = document.getElementById("price");


// 1 --- SELECTING A SEAT ---
container.addEventListener("click", function(e){
    if( e.target.classList.contains("fas") && !e.target.classList.contains("sold") ){
        // Toggle seat [select/deselect]
        e.target.classList.toggle("selected");

        //update seat count & price
        update();
    }
});


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

// 3 --- BOOK TICKETS (selected -> sold) ----
function book(){
    var vip_count = document.querySelectorAll(".vip-row .fas.selected").length;
    var reg_count = document.querySelectorAll(".seat-row .fas.selected").length;

    document.querySelectorAll(".selected").forEach( x => {
        // x = element
        x.classList.remove("selected");
        x.classList.add("sold");
    });

    if(vip_count + reg_count > 0){
        document.getElementsByClassName("success-prompt")[0].style.visibility = "visible";
    }
    else{
        alert("Select seats before booking.");
    }
}
