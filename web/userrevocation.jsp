<%-- 
    Document   : userrevocation
    Created on : Feb 24, 2014, 12:49:48 AM
    Author     : java
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="com.commondb.Common_DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body background="Images/img9.png">   
        <center>
            <form name="form1" method="post" action="UserRevocationServlet">
         <br>
           </br>
           <table width="" border="0">
                <tr>
                    <td>
                        <div align="center">
                            <font size="10" face="Fixedsys" color="#CD6155">User Revocation Page</font></div>
                    </td>
                </tr>
            </table>
           <p>
           </p>
        </center>
        <%
        String gname=session.getAttribute("gname").toString();
        %>
        <div align="right"><font size="4" face="Brush Script MT" color="#922B21">
            <h1>Welcome, <%=gname%>, Your Client List Here</h1></font>
        </div>
        <center>
        <table width="250" border="0">
            <tr>
                <td>
                    <div align="center"><font size="6" face="Chiller" color="#922B21">UserName List:</font></div>
                    <label for="username"></label>
                </td>
                <td>
                    <select name="username" >    
           <%  
           //String groupkey=session.getAttribute("groupkey").toString();
           ArrayList li=new ArrayList();
           Connection con=null;
           Statement st=null;
           ResultSet rs=null;
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
           st=con.createStatement();
           String qry="select username from login where groupname='"+gname+"'";
           rs=st.executeQuery(qry);
            //ResultSet rr=Common_DB.ViewParticularData("mona","login","groupname",group1);
          
         while(rs.next())            
         {
          String n=rs.getString(1);   
           
             li.add(n);             
         }
            if(!(li.isEmpty()))        
         for(int ij=0; ij<li.size(); ij++)                   
              {
           %>
           <option value="<%=li.get(ij)%>"> <%=li.get(ij)%></option>
           <%
               }
             
                else {               
          %>
            <option value=""> </option>
          <%
         }
%>
          
       </select> 
                </td>
            </tr>
        </table>
        <table width="250" border="0">
            <tr>
                <td>
                    <div align="center">
                    <input type="submit" name="submit" id="submit" value="Delete">
                    </div>
                </td>
            </tr>
        </table>
        </form>
        </center>
    </body>
</html>
