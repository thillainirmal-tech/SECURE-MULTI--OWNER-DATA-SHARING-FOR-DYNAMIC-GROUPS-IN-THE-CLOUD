<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Custom Login Form Styling</title>
        <meta name="description" content="Custom Login Form Styling with CSS3" />
        <meta name="keywords" content="css3, login, form, custom, input, submit, button, html5, placeholder" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/style_2.css" />
		<script src="js/modernizr.custom.63321.js"></script>
		<!--[if lte IE 7]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
		<style>	
			
			body {
				background: #eedfcc url(Images/pic7.jpg) no-repeat center top;
				-webkit-background-size: cover;
				-moz-background-size: cover;
				background-size: cover;
			}
			.container > header h1,
			.container > header h2 {
				color: #fff;
				text-shadow: 0 1px 1px rgba(0,0,0,0.5);
			}
		</style>
    </head>
    <script>
        function validate()
        {
            var a1=document.form1.groupname.value;
            var a2=document.form1.key.value;
            
            if((a1=="")||(a2==""))
                {
                    alert("Create groupname and groupkey");
                    return false;
                }
                return true;
        }
    </script>
    <body align="center">
        <div class="container">
			
	<h1><font size="10" face="Matura MT Script Capitals">Create Group Name</font></h1>	
			
			
			<section class="main">
                            <form name="form1" action="GroupnameServlet" method="post" onsubmit="return validate()" class="form-5 clearfix">
				    <p>
				        <input type="text" id="login" name="groupname" placeholder="Create groupname:">
				        <input type="text" name="key" id="password" placeholder="Create groupkey:"> 
				    </p>
				    <button type="submit" name="submit">
				    	<i class="icon-arrow-right"></i>
				    	<span>Create</span>
				    </button>     
				</form>
			</section>
			
        </div>
		<!-- jQuery if needed -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery.placeholder.min.js"></script>
		<script type="text/javascript">
		$(function(){
			$('input, textarea').placeholder();
		});
		</script>
    </body>
</html>