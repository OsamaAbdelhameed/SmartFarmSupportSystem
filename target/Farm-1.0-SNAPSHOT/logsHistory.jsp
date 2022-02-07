<%-- 
    Document   : logsHistory
    Created on : Jan 4, 2022, 10:06:40 PM
    Author     : OSAMA
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
        <title>Customer Logs History</title>
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
        <h1 align="center">Logs History</h1>
        <table class="table" border="1">
            <tr class="thead-dark">
                <th>ID</th>
                <th>Time</th>
                <th>Day</th>
                <th>Month, Day</th>
                <th>Year</th>
                <th>Username</th>
            </tr>
            <%    int index = 1;
                Connection con = DBConnect.getConn();
                Statement st = con.createStatement();
                String str = "SELECT * FROM logs";
                String submit = (request.getParameter("submit") != null) ? request.getParameter("submit") : "";
                Calendar cal = Calendar.getInstance();
                cal.add(Calendar.DATE, -1);
                Date today = cal.getTime();
                cal.add(Calendar.DATE, -1);
                Date yesterday = cal.getTime();
                cal.add(Calendar.DATE, -5);
                Date last = cal.getTime();
                ResultSet rs = st.executeQuery(str);
                String time, day, month, year, all;
                Date to = new Date();
                while (rs.next()) {
                    all = rs.getString("time");
                    day = all.substring(0, 3);
                    month = all.substring(3, 7) + ", " + all.substring(8, 10);
                    time = all.substring(10, 23);
                    year = all.substring(23);
                    /*to.setTime(time);
                to.setDate(date);
                to.setHours(hours);
                to.setMinutes(minutes);
                     */
                    if (submit.equals("")) {
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=time%></td>
                <td><%=day%></td>
                <td><%=month%></td>
                <td><%=year%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%
            } else if (submit.equals("today") && ((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(all)).after(today))) {
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=time%></td>
                <td><%=day%></td>
                <td><%=month%></td>
                <td><%=year%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%
            } else if (submit.equals("yesterday") && ((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(all)).after(yesterday))) {
            %>
            <tr>
                <td><%=index++%></td>
                <td><%=time%></td>
                <td><%=day%></td>
                <td><%=month%></td>
                <td><%=year%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%
                } else if (submit.equals("lastWeek") && ((new SimpleDateFormat("EE MMM dd HH:mm:ss z yyyy").parse(all)).after(last))) {
                %>
            <tr>
                <td><%=index++%></td>
                <td><%=time%></td>
                <td><%=day%></td>
                <td><%=month%></td>
                <td><%=year%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%
                    }
                }%>
        </table>
        <div class="btn-group">
            <form method='get' action='#'>
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