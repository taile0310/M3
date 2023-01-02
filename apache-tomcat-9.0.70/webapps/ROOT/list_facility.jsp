<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/2/2023
  Time: 12:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Facility</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body style="background-color: beige">
<h1 class="d-flex justify-content-center">Facility</h1>
<tr>
    <button class="btn btn-outline-success" type="submit">Add</button>
</tr>
<form action="/facility" method="get"></form>
<table class="table table-striped ">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Rent type</th>
        <th>Standard room</th>
        <th>Des other convenience</th>
        <th>Pool area</th>
        <th>Number floors</th>
        <th>Facility free</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="villa" items="${villaList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${villa.name}</td>
            <td>${villa.area}</td>
            <td>${villa.cost}</td>
            <td>${villa.max_people}</td>
            <td>${villa.rent_type}</td>
            <td>${villa.standard_room}</td>
            <td>${villa.description_other_convenience}</td>
            <td>${villa.pool_area}</td>
            <td>${villa.num_of_floors}</td>
            <td>-</td>
            <td>
                <button class="btn btn-outline-warning" type="submit">Edit</button>
            </td>
            <td>
                <button class="btn btn-outline-danger" type="submit">Delete</button>
            </td>
        </tr>
    </c:forEach>

    <c:forEach var="house" items="${houseList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${house.name}</td>
            <td>${house.area}</td>
            <td>${house.cost}</td>
            <td>${house.max_people}</td>
            <td>${house.rent_type}</td>
            <td>${house.standard_room}</td>
            <td>${house.description_other_convenience}</td>
            <td>-</td>
            <td>${house.num_of_floors}</td>
            <td>-</td>
            <td>
                <button class="btn btn-outline-warning" type="submit">Edit</button>
            </td>
            <td>
                <button class="btn btn-outline-danger" type="submit">Delete</button>
            </td>

        </tr>
    </c:forEach>

    <c:forEach var="room" items="${roomList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${room.name}</td>
            <td>${room.area}</td>
            <td>${room.cost}</td>
            <td>${room.max_people}</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>-</td>
            <td>${room.facility_free}</td>
            <td>
                <button class="btn btn-outline-warning" type="submit">Edit</button>
            </td>
            <td>
                <button class="btn btn-outline-danger" type="submit">Delete</button>
            </td>

        </tr>
    </c:forEach>

</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
