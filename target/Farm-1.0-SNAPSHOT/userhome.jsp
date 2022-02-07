<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="Farm.Model.UserDB"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
    if (request.getSession(true).getAttribute("user") == null && request.getSession(true).getAttribute("supplier") == null && request.getSession(true).getAttribute("admin") == null) {
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%
    }else if(request.getSession(true).getAttribute("user") != null) {
%>
<%@include file="userheader.jsp" %>
<%
    }else if(request.getSession(true).getAttribute("supplier") != null) {
%>
<%@include file="supplierheader.jsp" %>
<%        } else if (request.getSession(true).getAttribute("admin") != null) {
%>
<%@include file="adminheader.jsp" %>
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
            <%=(session.getAttribute("msg") != null) ? session.getAttribute("msg"): "" %>
            <%
                if (session.getAttribute("user") != null || session.getAttribute("supplier") != null || session.getAttribute("admin") != null) {
                    String uname = (String) ((request.getSession(true).getAttribute("user") != null) ? request.getSession(true).getAttribute("user"): (request.getSession(true).getAttribute("admin") != null)? request.getSession(true).getAttribute("admin") : (request.getSession(true).getAttribute("supplier") != null)? request.getSession(true).getAttribute("supplier"):"");
                    Connection con = DBConnect.getConn();
                    Statement st = con.createStatement();
                    String sql = "SELECT * FROM User WHERE USERNAME='" + uname + "'";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {%>
            <h1 align="center">My Profile</h1>
            <table align="center">
                <tr><td>Name</td><td><%=rs.getString(1)%></td></tr>
                <tr><td>Username</td><td><%=rs.getString(2)%></td></tr>
                <tr><td>Role</td><td><%=(rs.getInt(3) == 1) ? "Admin" : (rs.getInt(3) == 2) ? "Farmer" : "Supplier" %></td></tr>
                <tr><td>Mobile Number</td><td><%=rs.getString(5)%></td></tr>
                <tr><td>Password</td><td><%=rs.getString(4)%></td></tr>
                <tr><td>Email</td><td><%=rs.getString(9)%></td></tr>
                <tr><td>City</td><td><%=rs.getString(6)%></td></tr>
                <tr><td>State</td><td><%=rs.getString(7)%></td></tr>
                <tr><td>Address</td><td><%=rs.getString(8)%></td></tr>


            </table>
            <% }
                }
            %>
        </div>
        <div style="margin-top: 30px">
            <%@ include file="footer.jsp"%>
        </div>
    </body>
</html>
<% if(session.getAttribute("msg") != null) session.removeAttribute("msg"); %>