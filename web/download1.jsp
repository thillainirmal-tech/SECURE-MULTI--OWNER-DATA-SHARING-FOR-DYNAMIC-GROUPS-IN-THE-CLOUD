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
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
    <body>
        <form name="form1" method="post" action="DownloadotherServlet">
    <div align="center">       
      <table width="200" border="0">
            <tr>
              <td><div align="center">Download Page</div></td>
            </tr>  
      </table>
      <p>&nbsp;</p>
      <table width="250" border="0">
        <tr>
          <td width="82"><label for="Select a FileName"></label>
            <div align="center">Select a File:</div>
          <td width="152"><div align="center">
            <select name="filename" >
              <%  
              String Approved="Approved";
              ArrayList li=new ArrayList();
              String UserName=session.getAttribute("username").toString();
              String group=session.getAttribute("group").toString();
              //String filename=session.getAttribute("filaname").toString();
              //String Requestgroup=session.getAttribute("Requestgroup").toString();
              String Requestgroup=request.getParameter("Requestgroup");
              Connection con=null;
              Statement st=null;
              ResultSet rs=null;
             Class.forName("com.mysql.jdbc.Driver");
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
             st=con.createStatement();
             rs=st.executeQuery("select filename from othergroup where username='"+UserName+"'");
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
          </div></td>
        </tr>
      </table>
      <table width="200" border="0">
   <tr>
       <td>
           <div align="center">
   <input type="submit" name="Submit" id="Submit" value="Submit">
   
           </div>
   </td>
   </tr>
</table>
      </div> 
        </form>
    </body>
</html>
