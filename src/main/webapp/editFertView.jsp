<%-- 
    Document   : editFertView
    Created on : Dec 31, 2021, 6:10:57 PM
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
        <% String fertName = request.getParameter("choice"); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update <%=fertName %></title>
        <style>
            body {
                background-image: url(images/Lost-crop.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <h1 align="center" style="margin: 50px;">Update Fertilizer</h1>
    <main class="d-flex align-items-center primary-background" style="height:100vh; margin-left: 200px;">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Update <%=fertName %></p>
                        </div>
                        <%
                        Connection con = DBConnect.getConn();
                        Statement st = con.createStatement();
                        String sql = "SELECT * FROM fertilizer WHERE name='" + fertName + "'";
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {%>
                        <div class="card-body">
                            <form action="FertilizerCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Fertilizer Name</label> 
                                    <input type="text" class="form-control" name="fname" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=fertName %>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">Targeted Plant Name</label> 
                                    <input type="text" class="form-control" name="pname" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getString("plantType") %>" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Range</label> 
                                    <input type="number" name="range" min="0" class="form-control" id="exampleInputPassword1" value="<%=rs.getInt("fertRange") %>">
                                </div>			
                                <div class="form-group">
                                    <label for="">Price</label> 
                                    <input  type="number" step="any" min="0" class="form-control" name="price" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getDouble("price") %>" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" <% if(rs.getString("enabled").equals("on")) out.println("checked"); %>>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Image</label> 
                                    <input  type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" placeholder="Enter the name of the image with the type .png, .jpg, .jpeg" value="<%=rs.getString("image") %>" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Fertilizer Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"><%=rs.getString("describ") %></textarea>
                                </div>
                                    <% session.setAttribute("editedFert", fertName); %>
                                <button type="submit" class="btn btn-primary" name="Action" value="Edit">Update Fertilizer</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Fertilizer</button>
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
