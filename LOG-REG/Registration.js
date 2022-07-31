var pwd = document.getElementById('pwd');
var cpwd = document.getElementById('cpwd');

// check confirm-password matching password
function check(){

  // alert("IN THE FXN");
  console.log(pwd.value);

  if(pwd.value == cpwd.value){
    //alert("PASSWORD MATCHED");
    console.log("...PASSWORD MATCHING...");
    cpwd.setCustomValidity('');
  }else{
    console.log("Passwords don't match.");
    alert("Entered Passwords do not match!");
    //cpwd.setCustomValidity('Passwords do not match');
    return false;
  }

  return true;
}

function check_xyz(){

  alert("IN THE FXN");
  console.log(pwd.value);

  if(pwd.value == cpwd.value){
    //alert("PASSWORD MATCHED");
    console.log("...PASSWORD MATCHING...");
    cpwd.style.backgroundColor='green';
  }else{
    console.log("NAWT MATCHIN");
    alert("PASSWORD NOT MATCHING");
    cpwd.style.backgroundColor='red';
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
    console.log("uh-huh");
    errorMessage.style.color='red';
    errorMessage.innerText="Passwords not matching!";
  }
}

// pwd.onchange = check;
//cpwd.onkeyup = check;



//------------------------------- non-nullable inputs--------------------------------------
// const inputs = document.querySelectorAll('input')

// inputs.forEach(function(i) {
//   i.addEventListener('change', function(e) {
//     if (e.target.value == null) {
//       e.target.setCustomValidity('Field cannot be null');
//     }
//   })

// })


// let x = document.getElementById('name');
// x.setCustomValidity("mkdksnk");
