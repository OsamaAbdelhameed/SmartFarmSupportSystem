<%-- 
    Document   : viewCustomers
    Created on : Dec 31, 2021, 9:46:31 PM
    Author     : OSAMA
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@include file="adminheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Customers</title>
        <style>
            body {
                font-family: Arial;
            }

            * {
                box-sizing: border-box;
            }

            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 80%;
                background: #f1f1f1;
            }

            form.example button {
                float: left;
                width: 20%;
                padding: 10px;
                background: #2196F3;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none;
                cursor: pointer;
            }

            form.example button:hover {
                background: #0b7dda;
            }

            form.example::after {
                content: "";
                clear: both;
                display: table;
            }

            /* table formatting */
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
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
        <h1 align="center">Customers Information</h1>
        <table class="table" border="1">
            <tr class="thead-dark">
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Mobile</th>
                <th>Role</th>
                <th>Email</th>
                <th>City</th>
                <th>State</th>
                <th>Address</th>
            </tr>
            <%    int index = 1;
                Connection con = DBConnect.getConn();
                Statement st = con.createStatement();
                String str = "SELECT * FROM USER WHERE ROLEID<>1";
                ResultSet rs = st.executeQuery(str);
                while (rs.next()) {%>
            <tr>
                <td><%=index++%></td>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=(rs.getInt("roleid") == 2)? "Farmer" : "Supplier" %></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
            </tr>
            <%}%>
        </table>
        <div align="center"><a href="logsHistory.jsp">click here to view logs history of customers</a></div>
        <div style="margin-top: 100px">
            <%@ include file="footer.jsp"%>
        </div>
    </body>
</html>