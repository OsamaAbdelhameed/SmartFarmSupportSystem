<%-- 
    Document   : editView
    Created on : Dec 31, 2021, 3:33:31 PM
    Author     : OSAMA
--%>


<%@page import="Farm.Model.FertilizerDB"%>
<%@page import="Farm.Model.InsecticideDB"%>
<%@page import="Farm.Model.EquipmentDB"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Farm.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="Farm.Model.CropDB"%>
<%@include file="adminheader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Update Supplies</title>
        <style>
            body {
                background-image: url(images/Lost-crop.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <h1 align="center" style="margin: 50px;">Update Supplies</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="editView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose The Type</label> 
                            <span style="color: #00e676; font-style: inherit;"><br><%=(session.getAttribute("msg") == null) ? "" : session.getAttribute("msg")%><% if(session.getAttribute("msg") != null) session.removeAttribute("msg"); %></span>                             <span style="color: #00e676; font-style: inherit;"><br><%=(session.getAttribute("msg") == null) ? "" : session.getAttribute("msg")%><% if(session.getAttribute("msg") != null) session.removeAttribute("msg"); %></span>
            <div style="color: red; font-style: inherit;" align="center">
                <strong><%=(session.getAttribute("err") == null) ? "" : session.getAttribute("err")%></strong>
            </div><% if(session.getAttribute("err") != null) session.removeAttribute("err"); %>

                                <select name="choice" class="form-control">
                                    <option value="Crop">Crop</option>
                                    <option value="Equipment">Equipment</option>
                                    <option value="Insecticide">Insecticide</option>
                                    <option value="Fertilizer">Fertilizer</option>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <%                if (request.getParameter("Action") != null) {
                if (request.getParameter("choice").equals("Crop")) {
                    CropDB c = new CropDB();
                    LinkedList<String> names = c.showNames();
                     
        %>
        <h1 align="center" style="margin: 50px;">Choose Crop to Update</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="editCropView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose The Crop</label>
                                <select name="choice" class="form-control">
                                    <%
                                        for(String cropName: names){
                                    %>
                                    <option value='<%=cropName  %>' ><%=cropName  %></option>
                                    <%
                                        }
                                    %>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <% 
        } else if (request.getParameter("choice").equals("Equipment")) {
                    EquipmentDB e = new EquipmentDB();
                    LinkedList<String> names = e.showNames();
        %>
        <h1 align="center" style="margin: 50px;">Choose Equipment to Update</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="editEquipView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose The Equipment</label>
                                <select name="choice" class="form-control">
                                    <%
                                        for(String equipName: names){
                                    %>
                                    <option value='<%=equipName  %>' ><%=equipName  %></option>
                                    <%
                                        }
                                    %>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <%
        } else if (request.getParameter("choice").equals("Insecticide")) {
                InsecticideDB i = new InsecticideDB();
                LinkedList<String> names = i.showNames();
        %>
        <h1 align="center" style="margin: 50px;">Choose Insecticide to Update</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="editInsectView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose The Insecticide</label>
                                <select name="choice" class="form-control">
                                    <%
                                        for(String insecName: names){
                                    %>
                                    <option value='<%=insecName  %>' ><%=insecName  %></option>
                                    <%
                                        }
                                    %>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <%
        } else if (request.getParameter("choice").equals("Fertilizer")) {
                FertilizerDB f = new FertilizerDB();
                LinkedList<String> names = f.showNames();
            
        %>
        <h1 align="center" style="margin: 50px;">Choose Fertilizer to Update</h1>
        <div  align="center" class="container"  style="margin-top: 50px; margin-bottom: 100px; margin-left: 500px; text-align: center; width:30%;">
            <div class="row">
                <div class="col-md-8 offset-md-1">
                    <div class="card">
                        <form method="post" action="editFertView.jsp">
                            <div class="form-group form-inline"> 
                                <label for="exampleInputPassword1">Choose The Fertilizer</label>
                                <select name="choice" class="form-control">
                                    <%
                                        for(String fertName: names){
                                    %>
                                    <option value='<%=fertName  %>' ><%=fertName  %></option>
                                    <%
                                        }
                                    %>
                                </select> &nbsp &nbsp &nbsp &nbsp
                            </div>
                            <button type="submit" class="btn btn-primary" name="Action" value="Choose">Choose</button>
                        </form>
                    </div>
                </div>
            </div> 
        </div>
        <%
                }
            }
        %>


    <div style="margin: 150px">
        <%@ include file="footer.jsp"%>
    </div>
    </body>
</html>
