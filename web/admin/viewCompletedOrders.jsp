<%@ page isELIgnored="false" language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../resources/css/adminorders.css">
</head>

<body>

<%
    String username = String.valueOf(session.getAttribute("username"));
    String password = String.valueOf(session.getAttribute("password"));
%>
<% if (!username.equals("root") && !password.equals("root")) {
    response.sendRedirect("../");
}
%>

<header>
    <nav class="navbar navbar-dark bg-dark">
        <a id="logo" href="./dashboard" class="navbar-brand">Logo</a>
        <form class="form-inine" action="/" method="post">
            <a id="logout-btn" href="../logoutFunction" class="btn btn-outline-secondary" type="submit">Logout</a>
        </form>
    </nav>
</header>

<main class="container">
    <h1 class="mb-5 mt-5 text-center">Completed Orders</h1>

    <div id="head" class="row">
        <div class="col-2 d-none">
            <p class="h5 font-weight-bold">ID</p>
        </div>
        <div class="col-3 d-flex align-items-center">
            <p class="h5 font-weight-bold">Date</p>
        </div>
        <div class="col-3 d-flex align-items-center">
            <p class="h5 font-weight-bold">Products</p>
        </div>
        <div class="col-4 d-flex align-items-center">
            <p class="h5 font-weight-bold">Customer</p>
        </div>
        <div class="col-2 d-flex align-items-center">
            <p class="h5 font-weight-bold">Price</p>
        </div>
    </div>
    <div id="content">
        <c:forEach items="${completedOrders}" var="completedOrder">

            <div class="row">
                <div class="cols col-2 d-none">
                    <p class="id font-weight-bold">${completedOrder.key.getId()}</p>
                </div>
                <div class="cols col-3 d-flex align-items-center">
                    <p items=${DATE_TIME_FORMATTER} var="DATE_TIME_FORMATTER">${DATE_TIME_FORMATTER.format(completedOrder.key.getDate())}</p>
                </div>
                <div class="cols products col-3">
                    <ul class="list-unstyled">
                        <c:forEach items="${completedOrder.key.getProductsOfOrder()}" var="product">
                            <li>${product}</li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="cols col-4 d-flex align-items-center">
                    <p>${completedOrder.value.getFname()} ${completedOrder.value.getLname()}</p>
                </div>
                <div class="cols col-2 d-flex align-items-center">
                    <p items="${DECIMAL_FORMAT}" var="DECIMAL_FORMAT">${DECIMAL_FORMAT.format(completedOrder.key.getTotalPrice())}&euro;</p>
                </div>
            </div>

        </c:forEach>
    </div>
</main>

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>
