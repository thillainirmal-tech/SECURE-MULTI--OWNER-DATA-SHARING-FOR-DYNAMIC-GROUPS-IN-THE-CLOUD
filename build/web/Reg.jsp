<%@page import="com.commondb.Common_DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Registration form</title>
    <link href='http://fonts.googleapis.com/css?family=Asap:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    
    <!-- Bootstrap Styles -->
    <link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Plugins Styles -->
    <link href="assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="assets/plugins/animate/animate.css" rel="stylesheet">
    <!-- Skin Styles -->
    <link href="assets/css/xtraform.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/img/ico/apple-touch-icon-144-precomposed.png">
    <link rel="shortcut icon" href="assets/img/ico/favicon.ico">
    <!-- demo styles -->
    <style>
        body {
            padding: 30px 20px 0 20px;
        }
        .demo-title span {
            color: #29A1D3;
        }
        .demo-title h1 {
            font-weight: bold;
        }
        .panel-body {
            min-height: 502px;
        }
        #page-footer {
            padding: 30px;
        }
    </style>
</head>

<body>
    <!-- Container -->
    <div id="form-container" class="container">
        <!-- Logo & title =========================================================== -->
        <div class="text-center demo-title bounceInDown animated">
            <h1>User Registration form</h1>
            
        </div>
        <!-- //Logo & title =========================================================== -->
        <br>
        <!-- Signup form   =========================================================== -->
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-default hidden">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Sign up</h3>
                    </div>
                    <div class="panel-body">
                        <form name="form1" id="defaultForm" method="post" action="RegServlet">
                            <div id="name-form-group" class="form-group hidden">
                                <label>Username</label>
                                <input type="text" class="form-control" name="reguser" placeholder="Username" />
                            </div>
                            <div id="email-form-group" class="form-group hidden">
                                <label>Email</label>
                                <input type="text" class="form-control" name="regemail" placeholder="Email" />
                            </div>
                            <div id="password-form-group" class="form-group hidden">
                                <label>Password</label>
                                <input type="password" class="form-control" name="regpass" placeholder="Password" />
                            </div>
                            <div id="re-password-form-group" class="form-group hidden">
                                <label>Retype password</label>
                                <input type="password" class="form-control" name="ConPassword" placeholder="Retype password" />
								 
								 </div>
							
						
                            <div id="accept-form-group" class="form-group hidden">
							<label>Group Name</label>
								<select class="form-control" name="groupname">
                                                                 <%  
           ArrayList li=new ArrayList();
            ResultSet rr=Common_DB.ViewTable("mona","groupname");
          
         while(rr.next())            
         {
          String n=rr.getString(1);   
           
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
                            </div>
                            <div id="submit-form-group" class="form-group hidden">
                                <button type="submit" class="btn btn-primary">Sign up</button>
                            </div>
                            <div class="line line-dashed hidden"></div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- //Signup form   =========================================================== -->
    </div>
    <!-- //Container -->
    <!-- Page Footer =========================================================== -->
    <!-- //Page Footer =========================================================== -->
    <!-- Main Scripts-->
    <script src="assets/plugins/jquery/jquery.js"></script>
    <script src="assets/plugins/bootstrapValidator/js/bootstrapValidator.min.js"></script>
    <script>
        $(document).ready(function () {
			//Put animation end trigger on global variable to be used bellow on each animation end callback 
            var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
			//Get actual browser used to disable animation if is Internet Explorer
			var ua = window.navigator.userAgent
			var msie = ua.indexOf ( "MSIE " )
			// If Internet Explorer, disable animation
            if (msie > 0) {
                $(".hidden").removeClass('hidden');
            } else {
                //Animation Script
                $('.demo-title').one(animationEnd,
                    function () {
                        $(".panel").removeClass('hidden');
                        $(".panel").addClass('flipInX animated').one(animationEnd,
                            function () {
                                $("#name-form-group").removeClass('hidden');
                                $("#name-form-group label").addClass('fadeIn animated')
                                $("#name-form-group input").addClass('fadeInLeftBig animated').one(animationEnd,
                                    function () {
                                        $("#email-form-group").removeClass('hidden');
                                        $("#email-form-group label").addClass('fadeIn animated')
                                        $("#email-form-group input").addClass('fadeInLeftBig animated').one(animationEnd,
                                            function () {
                                                $("#password-form-group").removeClass('hidden');
                                                $("#password-form-group label").addClass('fadeIn animated')
                                                $("#password-form-group input").addClass('fadeInLeftBig animated').one(animationEnd,
                                                    function () {
                                                        $("#re-password-form-group").removeClass('hidden');
                                                        $("#re-password-form-group label").addClass('fadeIn animated')
                                                        $("#re-password-form-group input").addClass('fadeInLeftBig animated').one(animationEnd,
                                                            function () {
                                                                $("#accept-form-group").removeClass('hidden');
                                                                $("#accept-form-group").addClass('fadeIn animated').one(animationEnd,
                                                                    function () {
                                                                        $("#submit-form-group").removeClass('hidden');
                                                                        $("#submit-form-group").addClass('bounceIn animated').one(animationEnd,
                                                                            function () {
                                                                                $(".line").removeClass('hidden');
                                                                                $(".line").addClass('fadeInLeftBig animated');
                                                                                $("#have-account-text").removeClass('hidden');
                                                                                $("#have-account-text").addClass('fadeIn animated').one(animationEnd,
                                                                                    function () {
                                                                                        $("#btn-signin").removeClass('hidden');
                                                                                        $("#btn-signin").addClass('bounce animated');
                                                                                    });
                                                                            });
                                                                    });
                                                            });
                                                    });
                                            });
                                    });
                            });
                        $("#page-footer").removeClass('hidden');
                        $("#page-footer").addClass('fadeInDown animated');
                    }
                );

				//Sign in button animation on click
                $("#btn-signin").click(
                    function () {
                        event.preventDefault();
                        $(this).addClass('hinge animated').one(animationEnd,
                            function () {
                                window.location = "signin.html";
                            }
						);
                    }
                );
            }
            //End of Animation Script
            //Form validation
            $('#defaultForm').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        message: 'The username is not valid',
                        validators: {
                            notEmpty: {
                                message: 'The username is required and can\'t be empty'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: 'The username must be more than 6 and less than 30 characters long'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\.]+$/,
                                message: 'The username can only consist of alphabetical, number, dot and underscore'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: 'The email address is required and can\'t be empty'
                            },
                            emailAddress: {
                                message: 'The input is not a valid email address'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'The password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'confirmPassword',
                                message: 'The password and its confirm are not the same'
                            }
                        }
                    },
                    confirmPassword: {
                        validators: {
                            notEmpty: {
                                message: 'The confirm password is required and can\'t be empty'
                            },
                            identical: {
                                field: 'password',
                                message: 'The password and its confirm are not the same'
                            }
                        }
                    },
                    acceptTerms: {
                        validators: {
                            notEmpty: {
                                message: 'You have to accept the terms and policies'
                            }
                        }
                    }
                }
            });
        }); //end document ready
    </script>
</body>

</html>