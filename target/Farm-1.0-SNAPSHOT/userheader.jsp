<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

        <%
            if(session.getAttribute("user")==null)
            {
        %>
            <jsp:forward page="login.jsp"></jsp:forward>
        <% 
            }
        %>
    </head>
        
    <body>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #8bc34a;">
          <a class="navbar-brand" href="#">Smart Farm Support System</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
              <li class="nav-item active">
                <a class="nav-link" href="userhome.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="viewCrops.jsp">Crops</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="viewEquipments.jsp">Equipments</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="viewInsecticides.jsp">Insecticides</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="viewFertilizers.jsp">Fertilizers</a>
              </li>
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Requests
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="viewCurrReqF.jsp">Current Requests</a>
                        <a class="dropdown-item" href="viewFinishedReqF.jsp">Request History</a>
                    </div>
                </li>

              <li class="nav-item dropdown active" >

                <a  class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Welcome
                        <%=session.getAttribute("user")%>
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="userhome.jsp">My Profile</a>
                  <a class="dropdown-item" href="ChangeUser.jsp">Change User Information</a>
                  <a class="dropdown-item" href="UserCtrl?Action=Logout">Logout</a>
                </div>
              </li>
            </ul>
          </div>
        </nav>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>