
//--------------------------FOR EDITING: List of Events--------------------------

// 1 - Getting Selected Row and displaying its text

var table = document.getElementById("table"), rIndex;

for(var i = 1; i < table.rows.length; i++){
    table.rows[i].onclick = function(){
        rIndex = this.rowIndex;
        console.log(rIndex);
		// id- disabled, hiddenId- to pass thru form
        document.getElementById("id").value = this.cells[0].innerHTML;
        document.getElementById("hiddenId").value = this.cells[0].innerHTML;
        
        document.getElementById("name").value = this.cells[1].innerHTML;
        document.getElementById("venue").value = this.cells[2].innerHTML;
        
        // ISO Format: yyyy-MM-ddT00:00
        // alt; use <fmt:formatDate type = "both" pattern="yyyy-MM-dd'T'HH:mm" value = "${event.startDate}"/>
        const d1 = new Date(this.cells[3].innerHTML);
        console.log(d1);
        const d2 = new Date(this.cells[4].innerHTML);
        console.log(d2);
        
        // console.log(d.toLocaleString());
        
        //local time -offset
        // dt-1
        d1.setMinutes(d1.getMinutes() - d1.getTimezoneOffset());
        document.getElementById("start").value = d1.toISOString().slice(0, -8);
        //dt-2
        d2.setMinutes(d2.getMinutes() - d2.getTimezoneOffset());
        document.getElementById("end").value = d2.toISOString().slice(0, -8);
        
        document.getElementById("atdc").value = this.cells[5].innerHTML;
        
        //delete event
        document.getElementById("id-del").value = this.cells[0].innerHTML;
        document.getElementById("hiddenIDdel").value = this.cells[0].innerHTML;
        document.getElementById("name-del").value = this.cells[1].innerHTML;
    };
}

// 2 - Saving Edits made after SAVE button is clicked

//function editRow(){
//    table.rows[rIndex].cells[0].innerHTML = document.getElementById("id").value;
//    table.rows[rIndex].cells[1].innerHTML = document.getElementById("name").value;
//    table.rows[rIndex].cells[2].innerHTML = document.getElementById("venue").value;
//    table.rows[rIndex].cells[3].innerHTML = document.getElementById("st").value;
//    table.rows[rIndex].cells[4].innerHTML = document.getElementById("end").value;
//    table.rows[rIndex].cells[5].innerHTML = document.getElementById("atdc").value;
//}
