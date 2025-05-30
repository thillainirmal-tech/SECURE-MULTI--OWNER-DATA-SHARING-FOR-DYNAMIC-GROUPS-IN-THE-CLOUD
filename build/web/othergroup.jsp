<%-- 
    Document   : othergroup
    Created on : Dec 10, 2013, 11:49:10 AM
    Author     : sentamilpandi.m
--%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.commondb.Common_DB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onLoad="javascript: showHide('popup');" background="Images/img1.jpg">
        <center>
            <form name="form1" method="post" action="OthergroupServlet">
                <br>
                </br>
         <table width="" border="0">
             <tr>
                <td>
             <div align="center">
             <font size="7" face="Castellar" color="#ffffff">Users Request Other Group Files</font>
                </div>
                   </td>
           </tr>
      </table> 
                <p>
                </p>
                <div align="center" color="#ffffff">
            <%
            String user=session.getAttribute("username").toString();
            %>
            <div align="left">
                <font size="4" face="Brush Script MT" color="#ffffff">
            <h1>Welcome, <%=user%></h1>
            </font>
            </div>           
            <table width="250" border="0">
                    <td><div align="center"><font size="6" face="Chiller" color="#ffffff">Group Name: </font></div></td>
                    <td>
                        <label for="groupname"></label>
                        <select name="Requestgroup">
            <%  
           ArrayList kk=new ArrayList();
           ResultSet r1=Common_DB.ViewTable("mona","groupname");          
           while(r1.next())            
           {
            String n=r1.getString(1);              
             kk.add(n);             
           }
            if(!(kk.isEmpty()))        
           for(int ij=0; ij<kk.size(); ij++)                   
             {
           %>           
           <option value="<%=kk.get(ij)%>"> <%=kk.get(ij)%></option>
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
                    <table width="500" border="0">                        
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
			<h2><font size="5" face="Comic Sans Ms"><%=li.get(ij)%></font></h2>
                        
	<div class="content">
		<%           
          File file[] = new File("D:/"+li.get(ij)).listFiles();                                  
          for(int i=0;i<file.length;i++)
              {			 
                %>   
                <font size="5" face="Comic Sans Ms">
                 <%=file[i].getName()%>
                 </font>
                 <br>                 
                <input type="radio" name="filename" value="<%=file[i].getName()%>">
               </br>
               <% 
             }
            }
          }                            
          
             %>
                        </div>			
		</li>           
	</ul>    
</div><!-- wrap -->
</table>                         
<table width="250" border="0">
                        <tr>
                            <td>
                                <div align="center">
                                <input type="submit" name="submit" value="submit">
                                </div>
                            </td>
                        </tr>
                    </table>  
                </div>               
            </form>
        </center>
    </body>
     <style>
        
       #wrap{
			margin:10px;
			width:130px;                        
                       
                       
		}
		#accordion{
			width:250%;
			margin:0px;
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
