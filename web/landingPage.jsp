<%@ page import="com.webappcafe.model.Customer"%>
<%@ page isELIgnored="false" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>The Cafe</title>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
  <script type="text/javascript">
    var app = angular.module('myApp', []);
  </script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="./front/resources/css/userheaderfooter.css">
  <link rel="stylesheet" type="text/css" href="./resources/css/landing.css">
</head>

<body ng-app="myApp" class="d-flex flex-column">
  <header ng-include="'./userheader.jsp'" class="fixed-top"></header>

  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="login-modal-title">Login</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="login-form" action="loginFunction" method="post" novalidate>
          <div class="modal-body">
            <div class="form-group">
              <label for="username-login">Username</label>
              <input name="username" type="text" class="form-control" id="username-login" placeholder="Enter username" maxlength="45" required>
              <div class="invalid-feedback">Please enter your username</div>
            </div>
            <div class="form-group">
              <label for="pswd-login">Password</label>
              <input name="password" type="password" class="form-control" id="pswd-login" placeholder="Password" required>
              <div class="invalid-feedback">Please enter your password</div>
            </div>
            <p id="login-fail"></p>
          </div>
          <div class="modal-footer">
            <button id="login-close" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="login-submit" type="submit" class="btn btn-primary">Login</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="register-modal-title" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="register-modal-title">Register</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="register-form" method="post" novalidate>
          <div class="modal-body">
            <div class="form-group">
              <label for="username-register">Username</label>
              <input name="username" type="text" class="form-control" id="username-register" placeholder="Enter username" maxlength="45" required>
              <div id="uname-val-feed" class="invalid-feedback"></div>
              <p id="register-fail"></p>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="fname-register">First Name</label>
                <input name="fname" type="text" class="form-control" id="fname-register" placeholder="Enter your First Name" maxlength="45" required>
                <div id="fname-val-feed" class="invalid-feedback">Please enter your name</div>
              </div>
              <div class="form-group col-md-6">
                <label for="lname-register">Last Name</label>
                <input name="lname" type="text" class="form-control" id="lname-register" placeholder="Enter your Last Name" maxlength="45" required>
                <div id="lname-val-feed" class="invalid-feedback">Please enter your last name</div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="pswd1-register">Password</label>

                <input name="pswd" type="password" class="form-control" id="pswd1-register" placeholder="Password" maxlength="70" required>

                <div id="pass-val-feed" class="invalid-feedback">

                </div>
                <small id="passwordHelp" class="form-text text-muted">
                  Your password must be 8-70 characters long, contain one capital and one lowercase letter and a number
                </small>
              </div>
              <div class="form-group col-md-6">
                <label for="pswd2-register">&nbsp;</label>
                <input type="password" class="form-control" id="pswd2-register" placeholder="Re-enter Password" required>
                <div id="pass2-val-feed" class="invalid-feedback"></div>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button id="register-close" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button id="register-submit" type="submit" class="btn btn-primary">Register</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <main id="main" class="carousel flex-grow-1">
    <div class="main-1"></div>
    <div class="main-2"></div>
    <div class="main-3"></div>
    <!-- <div class="main-2"></div> -->
  </main>

  <section>
    <div id="banner" class="jumbotron">
      <h1>The Cafe</h1>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis
        aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
  </section>

  <footer ng-include="'./userfooter.jsp'" class="fixed-bottom d-flex justify-content-between align-items-center"></footer>

  <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
  <script type="text/javascript" src="./resources/js/landing.js"></script>
</body>

</html>
