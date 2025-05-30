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
    <!-- The first select list -->
Select WebSite: <select name="slist1" onchange="SList.getSelect('slist2', this.value);">
 <option>- - -</option>
  <% 
          String UserName3=session.getAttribute("username").toString();
          String group3=session.getAttribute("group").toString(); 
          Connection con3=null;
          Statement st3=null;
          ResultSet rs3=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st3=con3.createStatement();
          rs3=st3.executeQuery("Select Requestgroup,filename from othergroup where UserName='"+UserName3+"' and groupname='"+group3+"'");
          while(rs3.next())
               {
                     rs3.getString("Requestgroup");
               }  
                   }
          catch(Exception  ex)
             {
               System.out.println(ex.getMessage());
             }
                  %> 
 <option value="<%=rs3.getString("Requestgroup")%>">MarPlo.net</option>
 <option value="<%=rs3.getString("filename")%>">CoursesWeb.net</option>
</select>
<!-- Tags for the seccond dropdown list, and for text-content -->
<span id="slist2"></span> <div id="scontent"></div>

<script><!--
/* Script Double Select Dropdown List, from: coursesweb.net/javascript/ */
var SList = new Object();             // JS object that stores data for options

// HERE replace the value with the text you want to be displayed near Select
var txtsl2 = 'Select Category:';

/*
 Property with options for the Seccond select list
 The key in this object must be the same with the values of the options added in the first select
 The values in the array associated to each key represent options of the seccond select
*/
SList.slist2 = {
 "marplo": ['ajax', 'games', 'anime'],
 "coursesweb": ['php-mysql', 'javascript', 'flash-as3']
};

/*
 Property with text-content associated with the options of the 2nd select list
 The key in this object must be the same with the values (options) added in each Array in "slist2" above
 The values of each key represent the content displayed after the user selects an option in 2nd dropdown list
*/
SList.scontent = {
 "ajax": 'www.marplo.net/ajax/',
 "games": 'www.marplo.net/jocuri/',
 "anime": 'www.marplo.net/anime/',
 "php-mysql": 'coursesweb.net/php-mysql/',
 "javascript": 'coursesweb.net/javascript/',
 "flash-as3": 'coursesweb.net/flash/'
};

    /* From here no need to modify */

// function to get the dropdown list, or content
SList.getSelect = function(slist, option) {
  document.getElementById('scontent').innerHTML = '';           // empty option-content

  if(SList[slist][option]) {
    // if option from the last Select, add text-content, else, set dropdown list
    if(slist == 'scontent') document.getElementById('scontent').innerHTML = SList[slist][option];
    else if(slist == 'slist2') {
      var addata = '<option>- - -</option>';
      for(var i=0; i<SList[slist][option].length; i++) {
        addata += '<option value="'+SList[slist][option][i]+'">'+SList[slist][option][i]+'</option>';
      }

      document.getElementById('slist2').innerHTML = txtsl2+' <select name="slist2" onchange="SList.getSelect(\'scontent\', this.value);">'+addata+'</select>';
    }
  }
  else if(slist == 'slist2') {
    // empty the tag for 2nd select list
    document.getElementById('slist2').innerHTML = '';
  }
}
--></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <center>
            <form name="form1" method="post" action="OthergroupServlet">
            <table width="450" Border="0">
                <tr>
                    <td>
                        <div align="center">Send Request to Other Group</div>
                    </td>
                </tr>
                <tr>
            </table>
            <%
            String user=session.getAttribute("username").toString();
            %>
            <div align="left">
            <h1>Welcome, <%=user%></h1>
            </div>           
            <table width="250" border="0">
                    <td><div align="center">Group Name: </div></td>
                    <td>
                        <label for="groupname"></label>
                        <select name="Requestgroup">
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
               <input type="radio" name="filename" value="<%=file[i].getName()%>">
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
                                <div align="center">
                                <input type="submit" name="submit" value="submit">
                                </div>
                            </td>
                        </tr>
                    </table>                                                                                     
        </center> 
        <script>
        function showHide(id)
        {
            var d = new Date();
            if(d.getDay() ==1)
            document.getElementById(id).style.display ="block";     
        }
    </script>
    <center>
    </body>
    <body onLoad="javascript: showHide('popup');">
        <div id="popup">
            <h1>Approval Box</h1>
             <%
            String user1=session.getAttribute("username").toString();
            %>
            <div align="left">
            <h1>Welcome: <%=user1%></h1>
            </div>
             <table width="250" border="0">
        <tr>
            <td width="150"><label for="groupname"></label>
               <div align="center">RequestGroup</div></td>
          <td width="100">
          <select name="groupname" >     
           <% 
          String UserName2=session.getAttribute("username").toString();
          String group2=session.getAttribute("group").toString(); 
          Connection con2=null;
          Statement st2=null;
          ResultSet rs2=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st2=con2.createStatement();
          rs2=st2.executeQuery("Select Requestgroup,filename from othergroup where UserName='"+UserName2+"' and groupname='"+group+"'");
          while(rs2.next())
               {
           
            %>            
            <option><%=rs2.getString("Requestgroup")%></option>
                              
            <% }                                        
             
          }
           catch(Exception  ex)
             {
               System.out.println(ex.getMessage());
             }
%>            
          </select>
          </td>
        </tr>
             </table>
            <table width="250" border="0">
        <tr>
          <td width="150"><label for="Select a FileName"></label>
            <div align="center">Select a File:</div>
          <td width="100">
            <select name="filename" >
              <%  	
          String UserName=session.getAttribute("username").toString();
          String group1=session.getAttribute("group").toString(); 
          Connection con=null;
          Statement st=null;
          ResultSet rs=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st=con.createStatement();
          rs=st.executeQuery("Select filename from othergroup where UserName='"+UserName+"' and groupname='"+group+"'");
          while(rs.next())
               {
           
            %>
            <option> <%=rs.getString("filename")%> </option>
                              
            <% }                                        
             
          }
           catch(Exception  ex)
             {
               System.out.println(ex.getMessage());
             }
            %>
            </select>
          </td>
        </tr>
      </table>
            <p>            
            </p>
            <p>
            </p>
            <table width="250" border="0">
                <tr>
                    <td>
                        <div align="center">
                           <input type="submit" name="submit" id="submit" value="Approved">
                        </div>
                    </td>
              </tr>
            </table>
               </form> 

    </body>
    </body>
     <style>
       #wrap{
			margin: 100px auto;
			width: 800px;                        
		}
		#accordion{
			width: 800px;
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
                
                #popup
             {
                 border: 2px solid #000000;
                 width:400px;
                 height: 400px;
                 margin: 0 0 30% auto;
                 display: none;
                 alignment:right;
            }
    </style> 
</html>
