<%-- 
    Document   : editCropView
    Created on : Dec 31, 2021, 5:39:00 PM
    Author     : OSAMA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="adminheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <% String cropName = request.getParameter("choice"); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update <%=cropName %></title>
        <style>
            body {
                background-image: url(images/Lost-crop.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <h1 align="center" style="margin: 50px;">Update Crop</h1>
    <main class="d-flex align-items-center primary-background" style="height:100vh; margin-left: 200px;">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Update <%=cropName %></p>
                        </div>
                        <%
                        Connection con = DBConnect.getConn();
                        Statement st = con.createStatement();
                        String sql = "SELECT * FROM crop WHERE name='" + cropName + "'";
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {%>
                        <div class="card-body">
                            <form action="CropCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Crop Name</label> 
                                    <input type="text" pattern="[a-zA-Z]{1,}$" class="form-control" name="cname" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=cropName %>" readonly>
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
                                    <input  type="number" name="price" step="any" class="form-control" value="<%=rs.getDouble("price") %>" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" <% if(rs.getString("enabled").equals("on")) out.println("checked"); %>>
                                    <br>
                                </div>			
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Crop Image</label> 
                                    <input type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" value="<%=rs.getString("image") %>" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Crop Description</label> 
                                    <textarea rows="5" cols="3" name="desc" class="form-control"><%=rs.getString("describ") %></textarea>
                                </div>
                                    <% session.setAttribute("editedCrop", cropName); %>
                                <button type="submit" class="btn btn-primary" name="Action" value="Edit">Update Crop</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Crop</button>
                            </form>
                        </div>
                    <% } %>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div style="margin: 150px">
        <%@ include file="footer.jsp"%>
    </div>    
</body>
</html>
