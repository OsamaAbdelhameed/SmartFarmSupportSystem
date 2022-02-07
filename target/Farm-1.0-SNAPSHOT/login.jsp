<%-- 
    Document   : login
    Created on : Dec 27, 2021, 9:43:16 AM
    Author     : OSAMA
--%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <style>
        body {
                background-image: url(images/Registerbackground.jpg);
                background-repeat: no-repeat;
                background-size: cover;
        }
        </style>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="css/style.css">
        <title>Login Page</title>
    </head>
    <body>
            <%=(session.getAttribute("msg") != null) ? session.getAttribute("msg"): "" %>
	<main class="d-flex align-items-center primary-background" style="height:80vh">
            <div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
                            <div class="card">
                            	<div class="card-header text-center">
                                        <span class="fa fa-user-plus fa-3x" style="color: gray;"></span> <br>
                                        <p>Login</p>
                                        <span style="color: #00e73d; font-style: inherit;"><%=(request.getAttribute("ermsg") == null) ? "" : request.getAttribute("ermsg")%></span>
                                        <span style="color: #ff0000; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span>
                            	</div>
                                <div class="card-body" style="padding:10px">
                            		<form action="UserCtrl" method="post">
                            			<div class="form-group"  style="padding:10px">
                            				<label for="exampleInputEmail1">Username</label>
                                                            <input type="text" class="form-control" name="uname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username" required>
                            			</div>
                            			<div class="form-group"  style="padding:10px">
                                                        <label for="exampleInputPassword1">Password</label> 
                                                        <input type="password" name="pass" class="form-control" id="exampleInputPassword1" placeholder="Password">
                            			</div>
                            			<button type="submit" class="btn btn-success" name="Action" value="Login">Login</button>
                    				&nbsp;&nbsp;&nbsp; 
                                                    <a href="register.jsp" class="btn btn-primary">Sign up</a>
                    			</form>
                            	</div>
                            </div>
                        </div>
                </div>
            </div>
	</main>
	<%@ include file="footer.jsp"%>
	
    </body>
</html>