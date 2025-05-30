<%-- 
    Document   : Test
    Created on : Dec 11, 2013, 1:10:37 PM
    Author     : sentamilpandi.m
--%>

<%@page import="java.io.File"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.Select"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.commondb.Common_DB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>    
        <center>
        <form name="form1" method="post" action="DownloadotherServlet">
            <table width="250" border="0">
                <tr>
                    <td>
                        <div align="center">Download Other Group Files</div>
                    </td>
                </tr>
            </table>
            <table width="250" border="0">
                <tr>
                    <td>
                        <div align="center">Select your Files Below a Groups</div>
                    </td>
                </tr>
            </table>  
            <div align="left">
             <%
            String user=session.getAttribute("username").toString();
            %>            
            <h1>Welcome,<%=user%></h1>
            </div>
            <table width="250" border="0">
                    <td><div align="center">Group Name: </div></td>
                    <td>
                        <label for="groupname"></label>
                        <select name="Requestgroups">
                            <%
                            ArrayList li1=new ArrayList();
                            ResultSet rr1=Common_DB.ViewTable("mona", "groupname");
                            while(rr1.next())
                            {
                                String n=rr1.getString(1);
                                li1.add(n);
                            }
                            if(!(li1.isEmpty()))
                                for(int ij=0; ij<li1.size(); ij++)
                                {
                             %>
                             <option value="<%=li1.get(ij)%>"> <%=li1.get(ij)%> </option>                         
                             <%       
                                }
                            else
                            {                                                            
                            %>
                            <option value=""></option>
                            <%
                            }
                            %>
                    </td>
                </tr>
            </table> 
        <div id="wrap">
        <ul id="accordion">
            
             <%               
             String group=session.getAttribute("group").toString();
           ArrayList li=new ArrayList();
            ResultSet rr=Common_DB.ViewTable("mona","groupname");
          
         while(rr.next())            
         {
          String n=rr.getString(1);              
             li.add(n);   
         }           
             
            if(!(li.isEmpty())) {       
        for(int ij=0; ij<li.size(); ij++)                   
                     {
           %>           
                      
       
		<li>
			<h2><%=li.get(ij)%></h2>
                        
			<div class="content">
				<%           
                             File file[] = new File("D:/"+li.get(ij)).listFiles();                                  
          for(int i=0;i<file.length;i++) {			 
%>
                 <%=file[i].getName()%>
               <input type="radio" name="filenames" value="<%=file[i].getName()%>">
              <% }
                   }
            }                            
          
%>
			</div>
		</li>           
	</ul>

</div><!-- wrap -->
<table width="250" border="0">
    <tr>
        <td>
            <div align="center">Enter a Key:
            <label for="Enter a Key"></label>
            <input type="text" name="keyvalidation" id="keyvalidation">
            </div>
        </td>
    </tr>
</table>
<table width="250" border="0">
    <tr>
        <td>
            <div align="center">
            <input type="submit" name="submit" id="submit" value="submit">
            </div>
        </td>
    </tr>
</table>
        </form>
        </center>
    </body>
    <style>
       #wrap{
			margin: 100px auto;
			width: 700px;
		}
		#accordion{
			width: 700px;
			margin: 0px;
			padding: 0px;
			list-style: none;
		}

		#accordion h2{
			font-size: 12pt;
			margin: 0px;
			padding: 10px;
			background: #ccc;
			border-bottom: 1px solid #fff;
		}
		#accordion li div.content{
			display: none;
			padding: 10px;
			background: #f9f9f9;
			border: 1px solid #ddd;
		}

		#accordion li:hover div.content{
			display: inherit;
		}
    </style>    
</html>
