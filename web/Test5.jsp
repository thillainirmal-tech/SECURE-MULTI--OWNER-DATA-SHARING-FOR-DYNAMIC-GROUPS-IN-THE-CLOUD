<%-- 
    Document   : Test12
    Created on : Dec 23, 2013, 8:34:50 PM
    Author     : sentamilpandi.m
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <!-- The first select list -->
Select RequestGroup:
<select name="slist1" onchange="SList.getSelect('slist2', this.value);">
 <option>- - -</option>
   
 <% 
          String UserName=session.getAttribute("username").toString();
          String group=session.getAttribute("group").toString(); 
          Connection con2=null;
          Statement st2=null;
          ResultSet rs2=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st2=con2.createStatement();
          rs2=st2.executeQuery("Select Requestgroup from othergroup where UserName='"+UserName+"' and groupname='"+group+"'");
          while(rs2.next())
               {
           
            %>    
            <option value="<%=rs2.getString("Requestgroup")%>"><%=rs2.getString("Requestgroup")%></option>
                                         
          <% }                                        
             
          }
           catch(Exception  ex)
             {
               System.out.println(ex.getMessage());
             }
%>  
</select>
<!-- Tags for the seccond dropdown list, and for text-content -->
<span id="slist2"></span> <div id="scontent"></div>

<script><!--
/* Script Double Select Dropdown List, from: coursesweb.net/javascript/ */


var SList = new Object();             // JS object that stores data for options

// HERE replace the value with the text you want to be displayed near Select
var txtsl2 = 'Select FileName:';

/*
 Property with options for the Seccond select list
 The key in this object must be the same with the values of the options added in the first select
 The values in the array associated to each key represent options of the seccond select
*/
 
<%  	
          String UserName1=session.getAttribute("username").toString();
          String group1=session.getAttribute("group").toString(); 
          Connection con=null;
          Statement st=null;
          ResultSet rs=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st=con.createStatement();
          rs=st.executeQuery("Select Requestgroup,filename from othergroup where UserName='"+UserName1+"' and groupname='"+group1+"'");
          int p=0;
          String sss=",";
          while(rs.next())
               {
           System.out.println("Select List///"+rs.getString("Requestgroup")+"..."+rs.getString("filename"));
            
                
             
    if(p==0){
        %>                         
            
SList.slist2 = {
 "<%=rs.getString("Requestgroup")%>": [<% p=1;}if(rs.isLast()){%>'<%=rs.getString("filename")%>'<% }else{%>'<%=rs.getString("filename")%>',<%}}%>]
 
 //"coursesweb": ['php-mysql', 'javascript', 'flash-as3']
};

      <%  
                      
            }
           catch(Exception  ex)
             {
               System.out.println(ex.getMessage());
             }
            %>              
 
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
 // document.getElementById('scontent').innerHTML = '';           // empty option-content

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
    
    
    </body>
</html>
