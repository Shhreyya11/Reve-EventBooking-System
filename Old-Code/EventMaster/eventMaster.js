
//--------------------------FOR EDITING: List of Events--------------------------

// 1 - Getting Selected Row and displaying its text

var table = document.getElementById("table"), rIndex;

for(var i = 1; i < table.rows.length; i++){
    table.rows[i].onclick = function(){
        rIndex = this.rowIndex;
        console.log(rIndex);

        document.getElementById("id").value = this.cells[0].innerHTML;
        document.getElementById("name").value = this.cells[1].innerHTML;
        document.getElementById("venue").value = this.cells[2].innerHTML;
        document.getElementById("start").value = this.cells[3].innerHTML;
        document.getElementById("end").value = this.cells[4].innerHTML;
        document.getElementById("atdc").value = this.cells[5].innerHTML;
    };
}

// 2 - Saving Edits made after SAVE button is clicked

function editRow(){
    table.rows[rIndex].cells[0].innerHTML = document.getElementById("id").value;
    table.rows[rIndex].cells[1].innerHTML = document.getElementById("name").value;
    table.rows[rIndex].cells[2].innerHTML = document.getElementById("venue").value;
    table.rows[rIndex].cells[3].innerHTML = document.getElementById("start").value;
    table.rows[rIndex].cells[4].innerHTML = document.getElementById("end").value;
    table.rows[rIndex].cells[5].innerHTML = document.getElementById("atdc").value;
}
