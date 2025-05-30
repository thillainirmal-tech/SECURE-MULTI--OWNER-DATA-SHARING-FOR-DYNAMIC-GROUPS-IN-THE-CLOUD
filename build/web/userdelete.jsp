<%@page import="com.commondb.Common_DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>user delete page</title>
    
    
    
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css'>

        <link rel="stylesheet" href="css/style_3.css">

    
    
    
  </head>

  <body>

            <div id="hero">
            <div id="background_animate"></div>
            <h1>Group Manager Validation</h1>
            <span class="img_holder">
                <img class="dr-glue-little" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/drglue.png" alt="Dr Glue Little">
                <div class="left_arm">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/left-arm.png" alt="Left Arm">
                </div>
                <div class="right_arm">
                    <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/right-arm.png" alt="Right Arm">
                </div>
            </span>
        </div>
       <form name="form" method="post" action="UserDeleteServlet" accept-charset="utf-8">
            <div class="input_holder">
			<label>Select Group name:</label>
                <select name="gname">
            <%
                    ArrayList li=new ArrayList();
                    ResultSet rr=Common_DB.ViewTable("mona","groupname");
                    while(rr.next())            
                    {
                        String n=rr.getString(1);   
                        li.add(n);             
                    }
                    if(!(li.isEmpty()))        
                    for(int ij=0; ij<li.size(); ij++)                   
                     {
                        %>
                         <option value="<%=li.get(ij)%>"> <%=li.get(ij)%></option>
                        <%
                     }
                    else 
                    {
                        %>
                        <option value=""> </option>
                        <%
                    }
            %>
                      
               </select>
            </div>
            <div class="input_holder">
                <span><i class="fa fa-lock"></i></span><input type="password" name="groupkey" id="password_field" placeholder="Enter GroupKey:" required>
            </div>
            <input type="submit" class="submit_button" value="Submit"><br><br>
            <button class="submit_button" type="submit" name="search" onclick="form.action='Deletegroup';"><span>Delete Group </span></button>
        </form>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/transit.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/background.js'></script>

        <script src="js/index_2.js"></script>

    
    
    
  </body>
</html>
