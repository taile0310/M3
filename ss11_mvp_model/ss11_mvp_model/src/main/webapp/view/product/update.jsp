<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/3/2023
  Time: 8:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UPDATE PRODUCT</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">
<body>
<a class="btn btn-outline-primary" href="/product">Back to List</a>
<div>
    <form method="post" action="/product?action=update&id=${product.id}">
        <h4>Product</h4>
        ID: <input type="number" name="id" value="${product.id}" disabled>
        Name: <input type="text" name="name" placeholder="${product.name}">
        Price: <input type="text" name="price" placeholder="${product.price}">
        Describe: <input type="text" name="describe" placeholder="${product.describe}">
        Producer: <input type="text" name="producer" placeholder="${producer}">
        <button class="btn btn-outline-secondary" type="submit">Update</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
