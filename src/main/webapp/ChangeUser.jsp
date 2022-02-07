<%-- 
    Document   : ChangeUser
    Created on : Dec 31, 2021, 8:07:47 PM
    Author     : OSAMA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="Farm.Model.UserDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (request.getSession(true).getAttribute("user") != null) {
%>
<%@include file="userheader.jsp" %>
<%        } else if (request.getSession(true).getAttribute("admin") != null) {
%>
<%@include file="adminheader.jsp" %>
<%        } else if (request.getSession(true).getAttribute("supplier") != null) {
%>
<%@include file="supplierheader.jsp" %>
<%            }else{
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%            }
%>
<html>
    <head>
        <title>Welcome <%=(request.getSession(true).getAttribute("user") != null) ? request.getSession(true).getAttribute("user"): (request.getSession(true).getAttribute("admin") != null)? request.getSession(true).getAttribute("admin") : (request.getSession(true).getAttribute("supplier") != null)? request.getSession(true).getAttribute("supplier"):"" %></title>
        <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 80%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
    </head>
    <body>
        <div class="card text-center">
            <div class="card-header" style=" font-family: sans-serif; color: #8bc34a;">
                Welcome To Smart Farm Support System
            </div>

            <%
                if (session.getAttribute("user") != null || session.getAttribute("supplier") != null || session.getAttribute("admin") != null) {
                    String uname = ((String) session.getAttribute("user") != null) ? (String) session.getAttribute("user") : ((String) session.getAttribute("supplier") != null) ? (String) session.getAttribute("supplier") : (String) session.getAttribute("admin");
                    Connection con = DBConnect.getConn();
                    session.setAttribute("updatedUser", uname);
                    Statement st = con.createStatement();
                    String sql = "SELECT * FROM User WHERE USERNAME='" + uname + "'";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {%>
            <h1 align="center">Update Profile Details</h1><br>
            <span style="color: red; font-style: inherit;">
                <strong><%=(request.getAttribute("err") == null) ? "" : request.getAttribute("err")%></strong>
            </span>
            <span style="color: green; font-style: inherit;">
                <strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong>
            </span>
            <form action="UserCtrl" method="post">	
                <table align="center">
                    <tr><td>Name</td><td><input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=rs.getString(1)%>" required></td></tr>
                    <tr><td>Username</td><td><%=rs.getString(2)%></td></tr>
                    <tr><td>Role</td><td><%=(rs.getInt(3) == 1) ? "Admin" : (rs.getInt(3) == 2) ? "Farmer" : "Supplier" %></td></tr>
                    <tr><td>Mobile Number</td><td><input type="tel" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="mobile" placeholder="Enter Mobile number in +60-[0-9]{4}-[0-9]{4} format" maxlength="13" value="<%=rs.getString(5)%>" pattern="+60-[0-9]{4}-[0-9]{4}" required ></td></tr>
                    <tr><td>Password</td><td><input type="text" pattern=".{8,}" class="form-control" name="pass" id="exampleInputPassword1" value="<%=rs.getString(4)%>"></td></tr>
                    <tr><td>Confirm Password</td><td><input type="text" pattern=".{8,}" class="form-control" name="cpass" id="exampleInputPassword1" value="<%=rs.getString(4)%>"></td></tr>
                    <tr><td>Email</td><td><input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email" value="<%=rs.getString(9)%>" required></td></tr>
                    <tr><td>City</td><td><input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="city" value="<%=rs.getString(6)%>" required></td></tr>
                    <tr><td>State</td><td><%=rs.getString(7)%></td></tr>
                    <tr><td>Address</td><td><textarea rows="3" cols="3" name="address" class="form-control"><%=rs.getString(8)%></textarea></td></tr>

                </table>
                    <input type="hidden" name="role" value="<%=rs.getInt(3)%>">
                    <input type="hidden" name="state" value="<%=rs.getString(7)%>">
                <button type="submit"  style="padding:10px" class="btn btn-primary" name="Action" value="Update">Update</button>
            </form>        
            <% }
                }
            %>
        </div>
        <div style="margin-top: 100px">
            <%@ include file="footer.jsp"%>
        </div>
    </body>
</html>