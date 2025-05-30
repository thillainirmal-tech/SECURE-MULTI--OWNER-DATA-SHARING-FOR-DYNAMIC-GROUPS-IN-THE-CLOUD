
<%-- 
    Document   : filename
    Created on : Oct 19, 2013, 10:24:11 AM
    Author     : sentamilpandi.m
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="com.commondb.Common_DB"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title>Other group download page</title>
    
    
    
    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css'>

        <link rel="stylesheet" href="css/style_3.css">

    
    
    
  </head>

  <body>

            <div id="hero">
            <div id="background_animate"></div>
            <h1>Download Other group Files Page</h1>
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
       <form name="form" method="post" action="DownloadotherServlet" accept-charset="utf-8">
            <div class="input_holder">
			<label>Select a File:</label>
                <select name="gname">
            <%  
              try
                        {
              HttpSession session1=request.getSession(true);
              String Approved="Approved";
              Connection con=null;
              Statement st=null,st1=null,st2=null;
              ResultSet rs=null,rs2=null,rs3=null;
              ArrayList li1=new ArrayList();
           ArrayList li=new ArrayList();
           String UserName=session.getAttribute("username").toString();
           String group=session.getAttribute("group").toString();
           String keyvalidation=request.getParameter("keyvalidaion");
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
           st=con.createStatement();
           String qry="select filename,Requestgroup,usercount from othergroup where UserName='"+UserName+"'";
           rs=st.executeQuery(qry);
           System.out.println("JJJJJJJJJJJ"+qry);  
          while(rs.next())            
         {
             int approvecount = Integer.parseInt(rs.getString("usercount"));
             String reqgroupname = rs.getString("Requestgroup");
             //String files=rs.getString("filename");
                String count="select count(*) from login where groupname='"+reqgroupname+"'";
                st1=con.createStatement();
                rs2=st1.executeQuery(count);
                System.out.println(count);
           if(rs2.next()) {
               int c = rs2.getInt(1);
           if(approvecount==c){    
             String qry1="select product from groupname where groupname='"+reqgroupname+"'";
              st2=con.createStatement();
              rs3=st2.executeQuery(qry1);
              String reqgroup="";
             if(rs3.next())
             {                
                reqgroup=rs3.getString("product");
               System.out.println("HHHHHHHH"+reqgroup);
             }                                                                                                        
          String n=rs.getString(1);              
             li.add(n);
             li1.add(reqgroupname);  
             session1.setAttribute("keyvalidation", reqgroup);
             //session1.setAttribute("filename", files);                
           }                                 
         }       
                    
            if(!(li.isEmpty()))        
       for(int ij=0; ij<li.size(); ij++)                   
                     {
           %>
           <option value="<%=li.get(ij)%>(<%=li1.get(ij)%>)"> <%=li.get(ij)%>(<%=li1.get(ij)%>)</option>
               <%
                     }
             
                     else {
               
                  
          %>
            <option value=""> </option>
          <%
         }
           }
                     }
           catch(Exception ex)
                           {
               ex.printStackTrace();
                             
 }
%>
                      
               </select>
            </div><br>
            <input type="submit" class="submit_button" value="Submit">
        </form>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/transit.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/63425/background.js'></script>

        <script src="js/index_2.js"></script>

    
    
    
  </body>
</html>
