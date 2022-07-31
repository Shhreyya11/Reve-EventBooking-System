
var pwd = document.getElementById('pwd');
var cpwd = document.getElementById('cpwd');

// check confirm-password matching password
function check(){

  if(pwd.value == cpwd.value){
    //cpwd.setCustomValidity('');
  }else{
    //console.log("Passwords don't match.");
    alert("Entered Passwords do not match!");
    //cpwd.setCustomValidity('Passwords do not match');
    return false;
  }

  return true;
}

//while entering details
function recheck(){
  var errorMessage = document.getElementById('errorMessage');

  if(cpwd.value.length == 0){
    errorMessage.innerText="";
  }
  else if(pwd.value == cpwd.value){
    errorMessage.innerText="Passwords entered match.";
    errorMessage.style.color='green';
  }else{
    errorMessage.style.color='red';
    errorMessage.innerText="Passwords not matching!";
  }
}

//------------------------------- non-nullable inputs--------------------------------------




