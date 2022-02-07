<%-- 
    Document   : editInsectView
    Created on : Dec 31, 2021, 5:59:49 PM
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
        <% String insecName = request.getParameter("choice"); %> 
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update <%=insecName %></title>
        <style>
            body {
                background-image: url(images/Lost-crop.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <h1 align="center" style="margin: 50px;">Update Insecticide</h1>
    <main class="d-flex align-items-center primary-background" style="height:100vh; margin-left: 200px;">
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <p>Update <%=insecName %></p>
                        </div>
                        <%
                        Connection con = DBConnect.getConn();
                        Statement st = con.createStatement();
                        String sql = "SELECT * FROM insecticide WHERE name='" + insecName + "'";
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {%>
                        <div class="card-body">
                            <form action="InsecticideCtrl" method="post">
                                <div class="form-group">
                                    <label for="">Insecticide Name</label> 
                                    <input type="text" class="form-control" name="cname" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=insecName %>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="">Targeted Insect</label> 
                                    <input type="text" class="form-control" name="insect" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getString("insect") %>" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticides Range</label> 
                                    <input type="number" min="0" name="range" class="form-control" id="exampleInputPassword1" value="<%=rs.getInt("insecRange") %>">
                                </div>			
                                <div class="form-group">
                                    <label for="">Price</label> 
                                    <input  type="number" step="any" min="0" class="form-control" name="price" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getDouble("price") %>" required>
                                    <label for="">Farmers and suppliers able to show it</label> 
                                    <input  type="checkbox" name="enabled" <% if(rs.getString("enabled").equals("on")) out.println("checked"); %>>
                                    <br>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticide Image</label> 
                                    <input  type="text" name="image" class="form-control" id="image" pattern=".{1,}[.png/.jpg/.jpeg]$" value="<%=rs.getString("image") %>" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Insecticides Description</label> 
                                    <textarea rows="3" cols="3" name="desc" class="form-control"><%=rs.getString("describ") %></textarea>
                                </div>
                                    <% session.setAttribute("editedInsect", insecName); %>
                                <button type="submit" class="btn btn-primary" name="Action" value="Edit">Update Insecticides</button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Insecticides</button>
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