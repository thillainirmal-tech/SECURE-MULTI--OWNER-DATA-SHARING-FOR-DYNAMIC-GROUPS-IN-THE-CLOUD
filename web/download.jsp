<%-- 
    Document   : filename
    Created on : Oct 19, 2013, 10:24:11 AM
    Author     : sentamilpandi.m
--%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Random"%>
<%@page import="javax.naming.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="com.sun.mail.smtp.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<script type="text/javascript">
    function subform2() {
        document.form2.submit();
    }
</script>
</head>
    <body onLoad="javascript: showHide('popup');" background="BacImages/images20.jpg">   
        <div align="left">
        <form name="form1" method="post" action="DownloadServlet"> 
            <div align="center">
      <br>
         </br>
           <table width="" border="0">
                <tr>
                    <td>
                        <div align="center">
                            <font size="10" face="Colonna MT">File Download Page</font></div>
                    </td>
                </tr>
            </table>
           <p>
           </p>              
      <p>&nbsp;</p>
      <table width="400" border="0">
        <tr>
          <td width="150"><label for="Select a FileName"></label>
            <div align="center"><font size="5" face="Comic Sans Ms">Select a File:</font></div>
          <td width="152"><div align="left">
            <select name="filename" >
              <%  		
           String group=session.getAttribute("group").toString();                                                                                  
          ArrayList filename=(ArrayList)session.getAttribute("filename");                        
          for(int i=0;i<filename.size();i++) {			 
%>
              <option> <%=filename.get(i)%> </option>
              <% }
       
%>
            </select>
          </div></td>
        </tr>
      </table>
      <table width="350" border="0">
        <tr>
     <td><div align="center"><font size="5" face="Comic Sans Ms">Enter a Key:</font></div>
     </td>
     <td><label for="Enter a Key"></label>
       <input type="password" name="keyvalidation" id="keyvalidation">
       </td>
   </tr>
    </table><table width="200" border="0">
   <tr>
       <td>
           <div align="center">
   <input type="submit" name="Submit" id="Submit" value="Submit">
   
           </div>
             </div>
   </td>
</table>   
            <table width="" border="0">
                <tr>
                    <div align="left">   
                        <p>
                             <h1><font size="6" face="Colonna MT">Choose Your Requirement Links Here</font></h1>
                        </p>
      <p>
          <a href="Upload.jsp"><font size="5" face="Comic Sans Ms">Go to Upload Page</font></a>
     </p>
      <p>
          <a href="Delete.jsp"><font size="5" face="Comic Sans Ms">Go to Delete Page</font></a>
     </p>
      <p>
          <a href="Useraccount.jsp"><font size="5" face="Comic Sans Ms">Delete User account</font></a>
     </p>
     <p>
          <a href="Links.jsp"><font size="5" face="Comic Sans Ms">Download Other Group Files</font></a>
    </p>    
    <p>
        <a href="Login.jsp"><font size="5" face="Comic Sans Ms">Go to Home Page</font></a>
    </p>
                    </div>
            </tr>
            </table>
  </form>
     <form name="form2" method="post" id="form2id" action="ApprovedServlet">  
<div id="popup">
    <div align="center"><font size="5" face="Colonna MT">
            <h1>Approval Box</h1></font>
    </div>
             <%
            String group2=session.getAttribute("group").toString();
            %>
            <div align="left"><font size="3" face="Comic Sans Ms">
            <h1>Welcome: <%=group2%></h1>
            Select UserName:</font>
<select name="slist1" onchange="SList.getSelect('slist2', this.value);">
 <option>- - -</option>
   
 <% 
          String UserName=session.getAttribute("username").toString();
          //String group=session.getAttribute("group").toString(); 
          //String Requestgroup=session.getAttribute("Requestgroup").toString();
          Connection con2=null;
          Statement st2=null;
          ResultSet rs2=null;
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st2=con2.createStatement();
          rs2=st2.executeQuery("Select username,groupname from othergroup where Requestgroup='"+group+"'");
          ArrayList aa = new ArrayList();
          String tmp= "";
          while(rs2.next())
               {
              String us = rs2.getString("username");     
                  
          // aa.add(us);
              if(!(aa.contains(us))) {
            %>    
            <option value="<%=us%>"><%=us%>[<%=rs2.getString("groupname")%>]</option>
                                      
          <%
                   }
           aa.add(us);  
          }                                        
             
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
          //String UserName=session.getAttribute("username").toString();
          //String group1=session.getAttribute("group").toString(); 
          Connection con=null;
          Statement st=null;
          ResultSet rs=null;
          ArrayList alist = new ArrayList();
          ArrayList alist1=new ArrayList();
          try
          {
          Class.forName("com.mysql.jdbc.Driver");
          con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mona","root","password");
          st=con.createStatement();
          rs=st.executeQuery("Select username,filename from othergroup where Requestgroup='"+group+"'");
          int p=0;
          String sss=",";
          while(rs.next())
               {
           System.out.println("Select List///"+rs.getString("username")+"..."+rs.getString("filename"));
           
                String fname = rs.getString("filename");            
                alist.add(fname);
                String uname=rs.getString("username");
                alist1.add(uname);
                System.out.println(""+uname);
                           }
         // Collections.sort(alist1);
          StringBuilder sb = new StringBuilder();
          for(int ij=0;ij<alist1.size();ij++){              
              String temp = alist1.get(ij).toString(); 
              System.out.println("******* "+temp);
              if(!(alist1.get(ij) instanceof Integer)){
             sb.append(temp+"@"+alist.get(ij).toString());}
             Random rd = new Random();
              alist1.set(ij, rd.nextInt(99999));
              System.out.println(ij+" !!!!!! "+alist1.get(ij).toString());
              //String bb = "";
               while((alist1.indexOf(temp))!=-1) {
                   System.out.println(alist1.get((alist1.indexOf(temp)))+" @@@@@@@ "+(alist.get((alist1.indexOf(temp)))));
                  sb.append("&"+alist.get((alist1.indexOf(temp)))); 
                  alist1.set((alist1.indexOf(temp)), rd.nextInt(99999));
               }
              
              sb.append("#");              
              //   String fn = alist.get(ij).toString();
              // }
          }
          String ss = sb.toString();
          System.out.println("^^^^^^^^ "+ss);
          String sp[] = ss.split("#");
          %>
             
              SList.slist2 = {<%for(int ih=0;ih<sp.length;ih++){String s = sp[ih];System.out.println("%%%%%%%% "+s);String sa[]=s.split("@");String sc[]=sa[1].split("&");%>"<%=sa[0]%>": [<%for(int ik=0;ik<sc.length;ik++){%>'<%=sc[ik]%>'<%if(ik!=sc.length-1)%>,<%else{%>]<%}}if(ih!=sp.length){%>,<%}}%> 
 //"coursesweb": ['php-mysql', 'javascript', 'flash-as3']
};

      <%  
      
          HttpSession sessi=request.getSession();  
           sessi.setAttribute("selectedfile", alist);
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

      document.getElementById('slist2').innerHTML = txtsl2+' <select name="slist3" onchange="SList.getSelect(\'scontent\', this.value);">'+addata+'</select>';
     
      
 }
  }
  else if(slist == 'slist2') {
    // empty the tag for 2nd select list
    document.getElementById('slist2').innerHTML = '';
  }
}

--></script>
<p>
</p>
<p>
</p>
 
           
<script>
        function showHide(id)
        {
            var d = new Date();
            //if(d.getDay() ==1)
            document.getElementById(id).style.display ="block";     
        }
    </script>   
       
<table width="400" border="0">  
                <tr>
                    <td>
                        <div align="center">
                            
                            <input type="button" name="submitform2" id="submitform2" onclick="subform2()" value="Approved">                                                      
                        </div>
                    </td>
              </tr>    
            </table>
     </form>
             </div>
      </div>
            
    </body>    
</html>
<style>
     #popup
             {
                 border: 3px solid #000000;
                 width:400px;
                 height: 400px;
                 margin: 0 0 30px  auto;
                 display: none;                 
             }
    </style> 