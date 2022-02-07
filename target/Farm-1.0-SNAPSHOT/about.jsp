<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>About</title>
    <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
      margin: 0;
    }

    html {
      box-sizing: border-box;
    }

    *, *:before, *:after {
      box-sizing: inherit;
    }

    .column {
      float: left;
      width: 33.3%;
      margin-bottom: 16px;
      padding: 0 8px;
    }

    .card {
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
      margin: 8px;
    }

    .about-section {
      padding: 50px;
      text-align: center;
      background-color: #474e5d;
      color: white;
    }

    .container {
      padding: 0 16px;
    }

    .container::after, .row::after {
      content: "";
      clear: both;
      display: table;
    }

    .title {
      color: grey;
    }

    .button {
      border: none;
      outline: 0;
      display: inline-block;
      padding: 8px;
      color: white;
      background-color: #000;
      text-align: center;
      cursor: pointer;
      width: 100%;
    }

    .button:hover {
      background-color: #555;
    }

    @media screen and (max-width: 650px) {
      .column {
        width: 100%;
        display: block;
      }
    }
    </style>
    </head>
    <body>
        <div class="about-section">
          <h1>Smart Farm Support System</h1>
          <p>We Provide information of all kinds of Crops,Equipment, Pesticides and Fertilizers<p>
          <p>Just <a href="login.jsp">Login<a/> and see the Available Info</p>
        </a><p>Contact here +60-1160-8995</p>
        </div>

    <h2 style="text-align:center">Our Products</h2>
    <div class="row">
      <div class="column">
        <div class="card">
          <img src="images/Sorghum.jpeg" alt="Jane" style="width:100%; ">
          <div class="container">
            <h2>Crops</h2>
            <p class="title"></p>
            <p>Information of crops available</p>
            <p></p>
            <!-- <p><button class="button">Contact</button></p> -->
          </div>
        </div>
      </div>

      <div class="column">
        <div class="card">
          <img src="images/equipment.jpg" alt="Mike" style="width:99%;">
          <div class="container">
            <h2>Equipment</h2>
            <p class="title"></p>
            <p>Information of  Machinery available</p>
            <p></p>
          <!--   <p><button class="button">Contact</button></p> -->
          </div>
        </div>
      </div>

      <div class="column">
        <div class="card">
          <img src="images/pesticide.jpg" alt="John" style="width:99%">
          <div class="container">
            <h2>Pesticide</h2>
            <p class="title"></p>
            <p>Information of Pesticides available</p>
            <p></p>
            <!-- <p><button class="button">Contact</button></p> -->
          </div>
        </div>
      </div>
    </div>
    <%@ include file="footer.jsp"%>
    </body>
</html>