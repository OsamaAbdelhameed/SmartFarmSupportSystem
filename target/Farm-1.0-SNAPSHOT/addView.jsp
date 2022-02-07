<%-- 
    Document   : addView
    Created on : Dec 28, 2021, 4:56:27 PM
    Author     : OSAMA
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="adminheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Add Supplies</title>
        <style>
            body {
                background-image: url(images/Lost-crop.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <h1 align="center" style="margin: 50px;">Add Supplies</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="addView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose a Type To Add</label> 
                            <span style="color: #00e676; font-style: inherit;"><br><%=(session.getAttribute("msg") == null) ? "" : session.getAttribute("msg")%><% if(session.getAttribute("msg") != null) session.removeAttribute("msg"); %></span>
            <div style="color: red; font-style: inherit;" align="center">
                <strong><%=(session.getAttribute("err") == null) ? "" : session.getAttribute("err")%></strong>
            </div><% if(session.getAttribute("err") != null) session.removeAttribute("err"); %>

                                <select name="choice" class="form-control">
                                    <option value="Crop">Crop</option>
                                    <option value="Equipment">Equipment</option>
                                    <option value="Insecticide">Insecticide</option>
                                    <option value="Fertilizer">Fertilizer</option>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
    <main class="d-flex align-items-center primary-background" style="height:100vh; margin-left: 200px;">
        <%                if (request.getParameter("Action") != null) {
                if (request.getParameter("choice").equals("Crop")) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Add Crops</p>
                        </div>
                        <div class="card-body">
                            <form action="CropCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Crop Name</label> 
                                    <input type="text" pattern="[a-zA-Z]{1,}$" class="form-control" name="cname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Crop name" required>
                                    <br>
                                    <div class="form-group form-inline"> 
                                        <label for="exampleInputPassword1">Start Month</label> 
                                        <select name="startmonth" class="form-control">
                                            <option value="January">January</option>
                                            <option value="February">February</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="Decemeber">December</option>
                                        </select>
                                        <label for="exampleInputPassword1">End Month</label> 
                                        <select name="endmonth" class="form-control">
                                            <option value="January">January</option>
                                            <option value="February">February</option>
                                            <option value="March">March</option>
                                            <option value="April">April</option>
                                            <option value="May">May</option>
                                            <option value="June">June</option>
                                            <option value="July">July</option>
                                            <option value="August">August</option>
                                            <option value="September">September</option>
                                            <option value="October">October</option>
                                            <option value="November">November</option>
                                            <option value="Decemeber">December</option>
                                        </select>
                                    </div>
                                    <div class="form-group form-inline"> 
                                        <label for="exampleInputPassword1">Season</label> 
                                        <select name="season" class="form-control">
                                            <option value="Spring">Spring</option>
                                            <option value="Summer">Summer</option>
                                            <option value="Winter">Winter</option>
                                            <option value="Autumn">Autumn</option>
                                        </select>
                                    </div>
                                    <label for="">Price</label> 
                                    <input  type="number" name="price" step="any" class="form-control" placeholder="Enter Crop Price" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" checked>
                                    <br>
                                </div>			
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Crop Image</label> 
                                    <input type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" placeholder="Enter the name of the image with the type .png, .jpg, .jpeg" required>
                                    <%--<label for="">Destination</label> 
                                    <input  type="text" class="form-control" name="dest" value="/temp" id="exampleInputEmail1">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Crop Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary" name="Action" value="Add">Save Crop</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Crop</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else if (request.getParameter("choice").equals("Equipment")) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Add Equipment</p>
                        </div>
                        <div class="card-body">
                            <form action="EquipmentCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Equipment Name</label> 
                                    <input type="text" class="form-control" name="cname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Equipment name" required>
                                    <label for="exampleInputPassword1">Equipment Range</label> 
                                    <input type="number" name="range" min="0" class="form-control" id="exampleInputPassword1" placeholder="Enter Range">
                                </div>
                                <div class="form-group">
                                    <label for="">Price</label> 
                                    <input  type="number" step="any" min="0" class="form-control" name="price" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Equipment Price" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" checked>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Equipment Image</label> 
                                    <input type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" placeholder="Enter the name of the file with the type .png, .jpg, .jpeg" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Equipment Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary" name="Action" value="Add">Save Equipment</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Equipment</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else if (request.getParameter("choice").equals("Insecticide")) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Add Insecticides</p>
                        </div>
                        <div class="card-body">
                            <form action="InsecticideCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Insecticide Name</label> 
                                    <input type="text" class="form-control" name="cname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Insecticide name" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Targeted Insect</label> 
                                    <input type="text" class="form-control" name="insect" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Insect name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticides Range</label> 
                                    <input type="number" min="0" name="range" class="form-control" id="exampleInputPassword1" placeholder="Enter range">
                                </div>			
                                <div class="form-group">
                                    <label for="">Price</label> 
                                    <input  type="number" step="any" min="0" class="form-control" name="price" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Crop Price" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" checked>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticide Image</label> 
                                    <input  type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" placeholder="Enter the name of the image with the type .png, .jpg, .jpeg" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticides Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary" name="Action" value="Add">Save Insecticides</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Insecticides</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
        } else if (request.getParameter("choice").equals("Fertilizer")) {
        %>
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Add Fertilizer</p>
                        </div>
                        <div class="card-body">
                            <form action="FertilizerCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Fertilizer Name</label> 
                                    <input type="text" class="form-control" name="fname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Fertilizer name" required>
                                </div>
                                <div class="form-group">
                                    <label for="">Targeted Plant Name</label> 
                                    <input type="text" class="form-control" name="pname" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Plant name" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Range</label> 
                                    <input type="number" name="range" min="0" class="form-control" id="exampleInputPassword1" placeholder="Enter range">
                                </div>			
                                <div class="form-group">
                                    <label for="">Price</label> 
                                    <input  type="number" step="any" min="0" class="form-control" name="price" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Crop Price" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" checked>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Image</label> 
                                    <input  type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" placeholder="Enter the name of the image with the type .png, .jpg, .jpeg" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary" name="Action" value="Add">Save Fertilizer</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Fertilizer</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>

    </main>

    <div style="margin: 150px">
        <%@ include file="footer.jsp"%>
    </div>    
</body>
</html>