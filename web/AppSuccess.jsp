<%-- 
    Document   : ClickthroughSubmit
    Created on : Jun 20, 2016, 6:37:49 PM
    Author     : Java
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/sub.css" type="text/css" />
<style>
body {
    background-color: bisque;
    background-image: url("Images/img2.jpg");
}
</style>
<style>
.button {
  border-radius: 4px;
  background-color: #000000;
  border: none;
  color: #ffffff;
  text-align: center;
  font-size: 15px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '»';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
</style>
    </head>
    <body>
        <div class="diffuse-light">Approval Successfully</div>
<link async href="http://fonts.googleapis.com/css?family=Arizonia" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>
   
<p align="center"><a align="center" href="Login.jsp"> <button class="button"><span>Click Here to logout </span></button></a></p>
    </body>
</html>

