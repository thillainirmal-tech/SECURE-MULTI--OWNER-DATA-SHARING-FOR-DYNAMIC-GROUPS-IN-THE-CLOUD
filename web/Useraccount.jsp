<%@page import="java.sql.ResultSet"%>
<%@page import="com.commondb.Common_DB"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>User information</title>
		<meta name="description" content="Sticky Table Headers Revisited: Creating functional and flexible sticky table headers" />
		<meta name="keywords" content="Sticky Table Headers Revisited" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize_3.css" />
		<link rel="stylesheet" type="text/css" href="css/demo_4.css" />
		<link rel="stylesheet" type="text/css" href="css/component_2.css" />
		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
        <style>
            input[type="checkbox"]{
  width: 30px; /*Desired width*/
  height: 30px; /*Desired height*/
}
        </style>
        <%
        String group=session.getAttribute("group").toString();
        System.out.println("Group name is: "+group);
        %>
	<body align="center">
            <form name="ff1" action="Useraccount" method="POST">
		<div class="container">
			<!-- Top Navigation -->
			
			<header>
				<h1>Patient Information</h1>	
				
			</header>
			<div class="component">
				
				<table class="">
					<thead>
						<tr>
						<th>Select User</th>
                                                <th>Username</th>
                                                <th>Email ID</th>
                                                <th>Group name</th>
						</tr>
					</thead>
					<tbody>
                                             <%
                        ResultSet rs1=Common_DB.ViewParticularData("mona", "login", "groupname", group);
                        while(rs1.next())
                        {
                     %>
						<tr>
							<td><input type="checkbox" name="c12" value="<%=rs1.getString(1)%>"/></td>
                        <td><%=rs1.getString("UserName")%></td>
                        <td><%=rs1.getString("Email")%></td>
                        <td><%=rs1.getString("groupname")%></td>
                                                       
						</tr>
                                                <%
            }
            %>
					</tbody>
				</table>
               <input type="submit" value="Delete" name="b2" />
			
				
			
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js"></script>
		<script src="js/jquery.stickyheader.js"></script>
                </form>	
	</body>
</html>