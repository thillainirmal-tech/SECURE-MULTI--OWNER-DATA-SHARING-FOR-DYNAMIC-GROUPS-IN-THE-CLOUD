<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    
    
    <link rel="stylesheet" href="css/normalize.css">

    <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto+Slab'>

        <style>
      /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
      * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  height: 100%;
  background-color: #7C8C91;
  background-image: url("Images/pic8.jpg");
  font-family: "Roboto Slab", serif;
  color: white;
}

.preload * {
  transition: none !important;
}

label {
  display: block;
  font-weight: bold;
  font-size: small;
  text-transform: uppercase;
  font-size: 0.7em;
  margin-bottom: 0.35em;
}

input[type="text"], input[type="password"] {
  width: 100%;
  border: none;
  padding: 0.5em;
  border-radius: 2px;
  margin-bottom: 0.5em;
  color: #333;
}
input[type="text"]:focus, input[type="password"]:focus {
  outline: none;
  box-shadow: inset -1px -1px 3px rgba(0, 0, 0, 0.3);
}

button {
  padding-left: 1.5em;
  padding-right: 1.5em;
  padding-bottom: 0.5em;
  padding-top: 0.5em;
  border: none;
  border-radius: 2px;
  background-color: #034F67;
  text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.25);
  color: white;
  box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.45);
}

small {
  font-size: 1em;
}

.login--login-submit {
  float: right;
}

.login--container {
  width: 600px;
  background-color: #7C8C91;
  margin: 0 auto;
  position: relative;
  top: 35%;
}

.login--toggle-container {
  position: absolute;
  background-color: #7C8C91;
  right: 0;
  line-height: 2.5em;
  width: 50%;
  height: 120px;
  text-align: right;
  cursor: pointer;
  transform: perspective(1000px) translateZ(1px);
  transform-origin: 0% 0%;
  transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
  backface-visibility: hidden;
}
.login--toggle-container .js-toggle-login {
  font-size: 4em;
  text-decoration: underline;
}
.login--active .login--toggle-container {
  transform: perspective(1000px) rotateY(180deg);
  background-color: #bc1012;
}

.login--username-container, .login--password-container {
  float: left;
  background-color: #7C8C91;
  width: 50%;
  height: 120px;
  padding: 0.5em;
}

.login--username-container {
  transform-origin: 100% 0%;
  transform: perspective(1000px) rotateY(180deg);
  transition: all 1s cubic-bezier(0.06, 0.63, 0, 1);
  background-color: #bc1012;
  backface-visibility: hidden;
}
.login--active .login--username-container {
  transform: perspective(1000px) rotateY(0deg);
  background-color: #7C8C91;
}

footer {
  position: absolute;
  bottom: 12px;
  left: 20px;
}

    </style>

    
        <script src="js/prefixfree.min.js"></script>

    
  </head>
  <script>
      function validation()
      {
          var uname=document.f1.UserName.value;
          var pass=document.f1.Password.value;
          
          if((uname=="")||(pass==""))
              {
                  alert("Enter your username and password");
                  return false;
              }
              return true;
      }
        
      
  </script>
  <body align="center">
      
      
      <h1><font size="10">A Secure Anti-Collusion Data Sharing Scheme for Dynamic Groups in the Cloud</font></h1>
      <h1><font size="8" color="#034F67">User Login</font></h1>

      <form name="f1" action="LoginServlet" method="post" onsubmit="return validation()">
    <div class='preload login--container'>
  <div class='login--form'>
    <div class='login--username-container'>
      <label>Username</label>
      <input autofocus placeholder='Username' type='text' name="UserName">
    </div>
    <div class='login--password-container'>
      <label>Password</label>
      <input placeholder='Password' type='password' name="Password">
          <button class='js-toggle-login login--login-submit'>Login</button>
          
    </div>
 
  </div>
        
  <div class='login--toggle-container'>
    <small>welcome you,</small>
    <div class='js-toggle-login'>Login</div>
    <small>First here</small>
  </div>
     <p>
 <a href="AdminLogin.jsp" ><font size="5" color="black">Create Account</font></a>
 </p>  
</div>
             
     

    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

        <script src="js/index.js"></script>

    
    
   </form>
  </body>
</html>
