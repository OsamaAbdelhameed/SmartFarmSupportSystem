<%-- 
    Document   : footer
    Created on : Dec 27, 2021, 12:32:27 PM
    Author     : OSAMA
--%>

<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <body>
        <%! private int accessCount = 0;
            private Date accessDate = new Date();
            private String accessHost = "<i>no previous access</i>";
        %>
        <footer class="footer" style="background-color: #8bc34a; text-align: center; bottom: 0px; position: fixed; left: 0px; width: 100%;">
           <hr> <div style=" padding-bottom: 10px;">All rights preserved to Agriculture group &copy;
           <a href="http://localhost:8080/SmartFarmManagementSystem/index.jsp">SmartFarmManagementSystem.com</a>.
           Last accessed from 
            <%= accessHost %> at <%= accessDate %>.           
            <% accessHost = request.getRemoteHost(); accessDate = new Date(); %></div>
        </footer>
    </body>
</html>
