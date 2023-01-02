<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/2/2023
  Time: 1:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách khách hàng</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body style="background-color: beige">
<h1 class="d-flex justify-content-center">Customer</h1>
<tr><button class="btn btn-outline-success" type="submit">Add</button></tr>
<form action="/customer" method="get"></form>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Day of Birth</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Customer type</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer.name}</td>
            <td>${customer.date_of_birth}</td>
            <td>${customer.id_card}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.customer_type}</td>
            <td>${customer.address}</td>
            <td><button class="btn btn-outline-secondary" type="submit">Edit</button></td>
            <td><button class="btn btn-outline-warning" type="submit">Delete</button></td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
