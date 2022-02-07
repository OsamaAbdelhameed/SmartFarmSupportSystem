<%-- 
    Document   : index
    Created on : Dec 27, 2021, 9:43:16 AM
    Author     : OSAMA
--%>
<%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <style>
            body {
                    background-image: url(images/Registerbackground.jpg);
                    background-repeat: no-repeat;
                    background-size: cover;
            }
        </style>
    </head>
    
    <body>
        <br>
	<div class="card text-center">
		<div class="card-header">Welcome</div>
		<div class="card-body">
			<h1 class="card-title">Welcome to Smart Farm Support System</h1>
			<p class="card-text" style="font-size: 200%;">"The Farm is more
				than land and crops.It's our family heritage and future"</p>
			<p class="card-text">Come & see the Information of
				Crops,Pesticide, and Equipments</p>
			<a href="login.jsp" class="btn btn-primary"><span
				class="fa fa-sign-in" aria-hidden="true"> Please Log in</span></a>
		</div>
	</div>


	<div style="margin-top: 289px">
	<%@ include file="footer.jsp"%>
	</div>
    </body>
</html>
