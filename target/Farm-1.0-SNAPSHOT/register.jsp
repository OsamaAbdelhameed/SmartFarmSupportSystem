<%-- 
    Document   : register
    Created on : Dec 27, 2021, 9:43:16 AM
    Author     : OSAMA
--%>

<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <style>
            body {
                background-image: url(images/Registerbackground.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <title>Register</title>
    </head>

    <%
        String errmsg = "";
        if (session.getAttribute("ERROR") != null) {
            errmsg = (String) session.getAttribute("ERROR");
        }

    %>

    <body>
    <main class="d-flex align-items-center primary-background" style="margin:100px; height:180vh">
        <div class="container" style="align-content: center;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center"  style="padding:10px">
                            <span class="fa fa-user-plus fa-3x" style="color: gray;"></span> <br>
                            <p>Register</p>
                            <span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("errmsg") == null) ? "" : request.getAttribute("errmsg")%></span>
                            <span style="color: #00e676; font-style: inherit;"><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></span>
                        </div>
                        <div class="card-body"  style="padding:10px">
                            <div class="card-header">Personal Details</div>
                            <form action="UserCtrl" method="post">
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputPassword1">Role</label>
                                    <select name="role" class="form-control">
                                        <option value="Farmer">Farmer</option>
                                        <option value="Supplier">Supplier</option>
                                    </select>
                                </div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="">Name</label> 
                                    <input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name" required>
                                    <span style="color: red; font-style: inherit;">
                                        <strong><%=(request.getAttribute("namevalidation") == null) ? "" : request.getAttribute("namevalidation")%></strong>
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1"  style="padding:10px">Username</label> 
                                    <input type="text" class="form-control" name="uname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Username" required>
                                    <span style="color: red; font-style: inherit;">
                                        <strong><%=(request.getAttribute("unamevalidation") == null) ? "" : request.getAttribute("unamevalidation")%></strong>
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputMobile"  style="padding:10px">Mobile</label> 
                                    <input type="tel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="mobile" placeholder="Enter Mobile number in +60-[0-9]{4}-[0-9]{4} format" maxlength="13" pattern="+60-[0-9]{4}-[0-9]{4}" required >
                                    <!-- pattern="[0-9]{11}" maxlength="10" -->
                                    <span style="color: red; font-style: inherit;">
                                        <strong><%=(request.getAttribute("mobvalidation") == null) ? "" : request.getAttribute("mobvalidation")%></strong>
                                    </span>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label> 
                                    <input type="password" pattern=".{8,}" class="form-control" name="pass" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputPassword1">Confirm Password</label> 
                                    <input type="password" class="form-control" name="cpass" id="exampleInputPassword1" placeholder="Password">
                                    <span style="color: red; font-style: inherit;">
                                        <strong><%=(request.getAttribute("password") == null) ? "" : request.getAttribute("password")%></strong>
                                    </span>
                                </div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputEmail1">Email</label> 
                                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" placeholder="Enter Email" required>
                                </div>
                                <div class="card-header"  style="padding:10px">Address Details</div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputEmail1">City</label> 
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="city" placeholder="Enter City" required>
                                    <span style="color: red; font-style: inherit;">
                                        <strong><%=(request.getAttribute("city") == null) ? "" : request.getAttribute("city")%></strong>
                                    </span>
                                </div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputPassword1">State</label>
                                    <select name="state" class="form-control">
                                        <option value="Selangor">Selangor</option>
                                        <option value="Sarawak">Sarawak</option>
                                        <option value="Johor">Johor</option>
                                        <option value="Terengganu">Terengganu</option>
                                        <option value="Perlis">Perlis</option>
                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                        <option value="Perak">Perak</option>
                                        <option value="Penang">Penang</option>
                                        <option value="Pahang">Pahang</option>
                                        <option value="Negeri Sembilan">Negeri Sembilan</option>
                                        <option value="Puducherry">Puducherry</option>
                                        <option value="Malacca">Malacca</option>
                                        <option value="Kelantan">Kelantan</option>
                                        <option value="Kedah">Kedah</option>
                                    </select>
                                </div>
                                <div class="form-group"  style="padding:10px">
                                    <label for="exampleInputEmail1">Full Address</label>
                                    <textarea rows="3" cols="3" name="address" class="form-control"></textarea>
                                </div>
                                <button type="submit"  style="padding:10px" class="btn btn-primary" name="Action" value="Sign Up">Sign up</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <div style="margin: 200px;"><%@ include file="footer.jsp"%></div>

</body>
</html>