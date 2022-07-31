
//--------------------------FOR EDITING: List of Events--------------------------

// 1 - Getting Selected Row and displaying its text

var table = document.getElementById("table"), rIndex;

for(var i = 1; i < table.rows.length; i++){
    table.rows[i].onclick = function(){
        rIndex = this.rowIndex;
        console.log(rIndex);

        document.getElementById("id").value = this.cells[0].innerHTML;
        document.getElementById("hiddenId").value = this.cells[0].innerHTML;
        document.getElementById("name").value = this.cells[1].innerHTML;
        document.getElementById("venue").value = this.cells[2].innerHTML;

        // ISO Format: yyyy-MM-ddT00:00
        // alt; use <fmt:formatDate type = "both" pattern="yyyy-MM-dd'T'HH:mm" value = "${event.startDate}"/>

        // local time -offset
        // solution-1
        // var tzoffset = (new Date()).getTimezoneOffset() * 60000; //offset in milliseconds
        // var localISOTime = (new Date(Date.now() - tzoffset)).toISOString().slice(0, -1);
        // solution-2
        // date.setMinutes(date.getMinutes() - date.getTimezoneOffset());
        const d1 = new Date(this.cells[3].innerHTML);
        //console.log(d1);
        const d2 = new Date(this.cells[4].innerHTML);
        //console.log(d2);

        // console.log(d.toLocaleString());
        d1.setMinutes(d1.getMinutes() - d1.getTimezoneOffset());
        let dt1 = d1.toISOString();
        d2.setMinutes(d2.getMinutes() - d2.getTimezoneOffset());
        let dt2 = d2.toISOString();  

        document.getElementById("start").value = dt1.slice(0, dt1.length - 8);
        document.getElementById("end").value = dt2.slice(0, dt2.length - 8);

        document.getElementById("atdc").value = this.cells[5].innerHTML;
        
        //delete event
        document.getElementById("id-del").value = this.cells[0].innerHTML;
        document.getElementById("hiddenIDdel").value = this.cells[0].innerHTML;
        document.getElementById("name-del").value = this.cells[1].innerHTML;
    };
}

// 2 - Saving Edits made after SAVE button is clicked

function editRow(){
    table.rows[rIndex].cells[0].innerHTML = document.getElementById("id").value;
    table.rows[rIndex].cells[1].innerHTML = document.getElementById("name").value;
    table.rows[rIndex].cells[2].innerHTML = document.getElementById("venue").value;

    const d = new Date(document.getElementById("start").value);
    let dt = d.toLocaleString();
    dt = dt.slice(0, dt.length-6) + " " + dt.slice(dt.length-2, dt.length);

    table.rows[rIndex].cells[3].innerHTML = dt;
    
    table.rows[rIndex].cells[4].innerHTML = document.getElementById("end").value;
    table.rows[rIndex].cells[5].innerHTML = document.getElementById("atdc").value;
}

//----------------------------- OLD CODE ----------------------------------------

// 1 - Getting Selected Row and displaying its text

// var table = document.getElementById("table"), rIndex;

// for(var i = 1; i < table.rows.length; i++){
//     table.rows[i].onclick = function(){
//         rIndex = this.rowIndex;
//         console.log(rIndex);

//         document.getElementById("id").value = this.cells[0].innerHTML;
//         document.getElementById("name").value = this.cells[1].innerHTML;
//         document.getElementById("venue").value = this.cells[2].innerHTML;
//         document.getElementById("start").value = this.cells[3].innerHTML;
//         document.getElementById("end").value = this.cells[4].innerHTML;
//         document.getElementById("atdc").value = this.cells[5].innerHTML;
//     };
// }

// 2 - Saving Edits made after SAVE button is clicked

// function editRow(){
//     table.rows[rIndex].cells[0].innerHTML = document.getElementById("id").value;
//     table.rows[rIndex].cells[1].innerHTML = document.getElementById("name").value;
//     table.rows[rIndex].cells[2].innerHTML = document.getElementById("venue").value;
//     table.rows[rIndex].cells[3].innerHTML = document.getElementById("start").value;
//     table.rows[rIndex].cells[4].innerHTML = document.getElementById("end").value;
//     table.rows[rIndex].cells[5].innerHTML = document.getElementById("atdc").value;
// }

