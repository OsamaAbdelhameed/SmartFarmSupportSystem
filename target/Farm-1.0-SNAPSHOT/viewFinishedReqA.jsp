<%-- 
    Document   : viewFinishedReq
    Created on : Jan 5, 2022, 7:55:17 PM
    Author     : OSAMA
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%        if (request.getSession(true).getAttribute("admin") != null) {
%>
<%@include file="adminheader.jsp" %>
<%        } else if (request.getSession(true).getAttribute("supplier") != null) {
%>
<%@include file="supplierheader.jsp" %>
<%            } else {
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%            }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Request History</title>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <h1 align="center">Request History</h1>
        <div style="color: red; font-style: inherit;" align="center">
            <strong><%=(request.getAttribute("err") == null) ? "" : request.getAttribute("err")%></strong>
        </div>
        <div style="color: green; font-style: inherit;"  align="center">
            <strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong>
        </div>
        <table class="table" border="1">
            <tr class="thead-dark">
                <th>ID</th>
                <th>Time</th>
                <th>Day</th>
                <th>Month, Day Year</th>
                <th>Item Name</th>
                <th>Username</th>
                <th>Case Description</th>
                <th>Quantity</th>
                <th>Total Price</th>
                <th>Status</th>
            </tr>
            <%    int index = 1;
                Connection con = DBConnect.getConn();
                Statement st = con.createStatement();
                String str = "";
                if (session.getAttribute("admin") != null) {
                    str = "SELECT * FROM Request WHERE status in ('Rejected', 'Delivered', 'Corrupted')";
                } else if (session.getAttribute("supplier") != null) {
                    str = "SELECT * FROM Request WHERE supname='" + session.getAttribute("supplier") + "' AND status in ('Rejected', 'Delivered', 'Corrupted')";
                }
                ResultSet rs = st.executeQuery(str);
                String time, day, month, all, cname, uname, desc, status;
                int quan;
                double totalPrice;
                while (rs.next()) {
                    all = rs.getString("time");
                    day = all.substring(0, 3);
                    month = all.substring(3, 7) + ", " + all.substring(8, 10) + " " + all.substring(23);
                    time = all.substring(10, 23);%>
            <tr>
                <td><%=index++%></td>
                <td><%=time%></td>
                <td><%=day%></td>
                <td><%=month%></td>
                <td><%=rs.getString("cname")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("describ")%></td>
                <td><%=rs.getInt("quantity")%></td>
                <td><%=rs.getDouble("totalPrice")+"RM"%></td>
                <td><% if (rs.getString("status").equals("New")) {%> <form method="post" action="RequestCtrl"><input type="hidden" name="type" value="<%=rs.getString("type")%>"><input type="hidden" name="time" value="<%=rs.getString("time")%>"><button type="submit" class="btn btn-primary" style="background-color: green;" name="Action" value="Accept">Accept</button>&nbsp;&nbsp; <button type="submit" class="btn btn-primary" style="background-color: red;"  name="Action" value="Reject">Reject</button></form> 
                        <%} else {
                            out.println(rs.getString("status"));
                        } %></td>
            </tr>
            <%}%>
        </table>
        <div style="margin-top: 100px">
            <%@ include file="footer.jsp"%>
        </div>
    </body>
</html>