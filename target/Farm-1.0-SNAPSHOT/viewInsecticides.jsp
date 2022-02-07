<%-- 
    Document   : viewInsecticides
    Created on : Jan 1, 2022, 1:31:13 PM
    Author     : OSAMA
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@include file="userheader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insecticides</title>
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
        <h1 align="center">Insecticides</h1>
            <div style="color: red; font-style: inherit;" align="center">
                <strong><%=(request.getAttribute("err") == null) ? "" : request.getAttribute("err")%></strong>
            </div>
            <div style="color: green; font-style: inherit;"  align="center">
                <strong><%=(request.getAttribute("msg") == null) ? "" : request.getAttribute("msg")%></strong>
            </div>
        <%          int index = 1;
                    Connection con = DBConnect.getConn();
                    Statement st = con.createStatement();
                    String sql = "SELECT * FROM Insecticide where enabled='on'";
                    ResultSet rs = st.executeQuery(sql);
                    while (rs.next()) {%>
        <div class="container" align="center">
            <div>
                <div align="center" style='width:80%'>
                    <div class="card">
                        <div class="card-header text-center">
                            <br>
                            <h3>Insecticide <%=index++ %></h3>
                        </div>
                        <div class="card-body">
                            <form action="RequestCtrl" method="post">
                                <div class="form-group">
                                    <p>Insecticide Name: <%=rs.getString("name") %></p> 
                                    <br>
                                    <div class="form-group form-inline"> 
                                        <p><%=rs.getString("name") %> can kill different <%=rs.getString("insect") %> types </p>
                                    </div>
                                    <br>
                                    <div class="form-group form-inline"> 
                                        <p><%=rs.getString("name") %> range is <%=rs.getString("insecRange") %>m<sup>2</sup> </p>
                                    </div>
                                    <br>
                                    <div class="form-group form-inline"> 
                                        <p>We provide a financial support for insecticide, for each one it costs <%=rs.getDouble("price") %>RM and you can request no lower than 5. </p>
                                    </div>
                                    <br>
                                </div><br>
                                <img src="images/<%=rs.getString("image") %>" alt="<%=rs.getString("image") %> image is not available" width="200" height="300">
                                <br>
                                <div class="form-group">
                                    <label for="exampleInputPassword1"><%=rs.getString("name") %> Description</label> 
                                    <p><%=rs.getString("describ") %></p>
                                </div>
                                <br>
                                <textarea rows="3" cols="3" name="desc" class="form-control" placeholder="enter your case describtion to be more prior" required></textarea><br>
                                Quantity needed: <input type="number" name="quantity" min="5" placeholder="Please enter number of needed Kgs" required><br>
                                
                                <input type="hidden" name="cname" value="<%=rs.getString("name") %>">
                                <input type="hidden" name="type" value="Insecticide">
                                <input type="hidden" name="price" value="<%=rs.getDouble("price") %>">
                                <button type="submit" class="btn btn-primary" name="Action" value="Request">Request <%=rs.getString("name") %></button>
                                &nbsp;&nbsp;&nbsp;
                                <button type="reset" class="btn btn-primary">Reset Request</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>  <br> <br>
            <% 
                }
            %>                        
    </body>
    
    <div style="margin: 150px">
        <%@ include file="footer.jsp"%>
    </div>    
</html>