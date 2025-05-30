<!DOCTYPE html>

<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>multi owner</title>
		<meta name="description" content="Demo for the tutorial: Styling and Customizing File Inputs the Smart Way" />
		<meta name="keywords" content="cutom file input, styling, label, cross-browser, accessible, input type file" />
		<meta name="author" content="Osvaldas Valutis for Codrops" />
		<link rel="shortcut icon" href="favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize_2.css" />
		<link rel="stylesheet" type="text/css" href="css/demo_2.css" />
		<link rel="stylesheet" type="text/css" href="css/component_1.css" />

		<!--[if IE]>
  		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<!-- remove this if you use Modernizr -->
	
                <script>(function(e,t,n){var r=e.querySelectorAll("html")[0];r.className=r.className.replace(/(^|\s)no-js(\s|$)/,"$1js$2")})(document,window,0);</script>
                <style>
.button {
  padding: 15px 25px;
  font-size: 15px;
  text-align: center;
  cursor: pointer;
  outline: none;
  color: #000000;
  background-color: #F5B7B1;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.button:hover {background-color: #F5B7B1}

.button:active {
  background-color: #F5B7B1;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>
        </head>
        <script>
            function valid()
            {
                var a1=document.form1.file1.value;
                
                if(a1=="")
                    {
                        alert("Choose file");
                        return false;
                    }
                    return true;
            }
        </script>
	<body>
            <form action="UploadServlet" method="post" name="form1" id="form1" enctype="multipart/form-data" onsubmit="return valid()">
		<div class="container">
			<header class="codrops-header">
                            <h1><font size="8" face="Californian FB">File Upload Page</font></h1>
			 <%
    String user=session.getAttribute("username").toString();    
    %>
     <div align="center">
        <font size="3" face="Bradley Hand ITC">
    <h1>welcome, <%=user%></h1></font>
    </div>	
			</header>
			<div class="content">
                           

				<div class="box">
					<input type="file" name="file1" id="file-5" class="inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple />
					<label for="file-5"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span>Choose a file&hellip;</span></label>
                                        <button name="Submit" class="button">Upload</button>
                                       
                                        
  
				</div>
                         
			</div>
		</div><!-- /container -->

		<script src="js/custom-file-input.js"></script>

		<!-- // If you'd like to use jQuery, check out js/jquery.custom-file-input.js
		<script src="js/jquery-v1.min.js"></script>
		<script src="js/jquery.custom-file-input.js"></script>
		-->
                </form>
	</body>
</html>
