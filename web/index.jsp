<%@page import="com.webappcafe.model.Customer"%>
<%@ page isELIgnored="false" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Web Cafe</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="./resources/css/userheaderfooter.css">
  <link rel="stylesheet" type="text/css" href="./resources/css/userlanding.css">
</head>

<% Customer customer = (Customer) session.getAttribute("loggedInCustomer");%>
<% if (customer == null) {
    response.sendRedirect("./");
}%>

<body ng-app="myApp" class="d-flex flex-column">
  <header ng-include="'./userheader.jsp'" class="fixed-top"></header>

  <main class="carousel flex-grow-1">
    <div class="main-1"></div>
    <div class="main-2"></div>
    <div class="main-3"></div>
  </main>

  <div id="banner" class="jumbotron float-right d-flex flex-column justify-content-between">
    <div class="ml-2 mt-2 mr-2">
      <p>What mood are you in? For coffee or tea?</p>
      <p>View our products and order now one of our specialty blends!</p>
    </div>
    <div class="mb-2 mr-2">
      <a id="order-now" href="./products" class="btn btn-outline-secondary float-right">Place order</a>
    </div>
  </div>

  <footer ng-include="'./userfooter.jsp'" class="fixed-bottom d-flex justify-content-between align-items-center"></footer>

  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <script type="text/javascript" src="./resources/js/userlanding.js"></script>
</body>
</html>
