<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/3/2023
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới sản phẩm </title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">
<body>
<h1>ADD NEW PRODUCT</h1>
<a class="btn btn-outline-primary" href="/product">Back to lLst</a>
<form action="/product?action=create" method="post">
    <fieldset>
        Input ID: <input name="id" placeholder="Input ID"><br>
        Input Name: <input name="name" placeholder="Input Name"><br>
        Input Price: <input name="price" placeholder="Input Price"><br>
        Input Describe: <input name="describe" placeholder="Input Describe"><br>
        Input Producer: <input name="producer" placeholder="Input Producer"><br>
        <button class="btn btn-outline-success" type="submit">Create</button>
    </fieldset>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
