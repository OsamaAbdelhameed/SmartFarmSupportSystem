<%-- 
    Document   : consumedView
    Created on : Jan 15, 2022, 4:52:14 PM
    Author     : OSAMA
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Farm.Consumed"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%        if (request.getSession(true).getAttribute("supplier") != null) {
%>
<%@include file="supplierheader.jsp" %>
<%            }else{
%>
<jsp:forward page="login.jsp"></jsp:forward>
<%            }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consumption</title>
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
            
            .btn-group button {
                background-color: #04AA6D; /* Green background */
                border: 1px solid green; /* Green border */
                color: white; /* White text */
                padding: 10px 24px; /* Some padding */
                cursor: pointer; /* Pointer/hand icon */
                float: left; /* Float the buttons side by side */
              }

              /* Clear floats (clearfix hack) */
              .btn-group:after {
                content: "";
                clear: both;
                display: table;
              }

              .btn-group button:not(:last-child) {
                border-right: none; /* Prevent double borders */
              }

              /* Add a background color on hover */
              .btn-group button:hover {
                background-color: #3e8e41;
              }

        </style>
    </head>
    <body>
        <h1 align="center">Consumed Items</h1>
        <table class="table" border="1">
            <tr class="thead-dark">
                <th>ID</th>
                <th>Item Name</th>
                <th>Item Type</th>
                <th>Quantity</th>
                <th>Price per One</th>
                <th>Total Price</th>
            </tr>
            <%    int index = 1;
                String submit = (request.getParameter("submit") != null)? request.getParameter("submit"): "";
                Consumed c = new Consumed();
                LinkedList<Consumed> items = (submit.equals(""))?c.uniqueInfo((String) session.getAttribute("supplier")): (submit.equals("today"))? c.uniqueTodayInfo((String) session.getAttribute("supplier")): (submit.equals("yesterday"))? c.uniqueYesterdayInfo((String) session.getAttribute("supplier")): (submit.equals("lastWeek"))? c.uniqueLastInfo((String) session.getAttribute("supplier")):new LinkedList();
                for(Consumed item: items){
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=item.getItem() %></td>
                <td><%=item.getType() %></td>
                <td><%=item.getConsumedQuantities() %></td>
                <td><%=item.getPrice()+"RM" %></td>
                <td><%=item.getTotalPrice()+"RM" %></td>
            </tr>
            <%}%>
        </table>
        <div class="btn-group">
            <form method='post' action='#'>
                <button type="submit" name=submit value="today">Today</button>
                <button type="submit" name=submit value="yesterday">Yesterday</button>
                <button type="submit" name=submit value="lastWeek">last week</button>
                <button type="submit" name=submit value="">All</button>
            </form>
          </div>
        
        <div style="margin-top: 100px">
            <%@ include file="footer.jsp"%>
        </div>
    </body>
</html>
