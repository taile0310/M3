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
    <div>
        <button type="submit" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal"
                data-bs-whatever="@mdo">Add
        </button>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabel">Add new base</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <fieldset>
                                <legend>Add Facility</legend>
                                Name: <input type="text" size="30"/><br/>
                                Area: <input type="text" size="7"/><br/>
                                Cost: <input type="text" size="7"/><br/>
                                Max people: <input type="text" size="7"/><br/>
                                Rent type: <input type="text" size="7"/><br/>
                                Standard room: <input type="text" size="7"/><br/>
                                Des other convenience: <input type="text" size="7"/>
                                Pool area: <input type="text" size="7"/>
                                Number floors: <input type="text" size="7"/>
                                Facility free: <input type="text" size="7"/>
                            </fieldset>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save Facility</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</tr>
<form action="/facility" method="get"></form>
<table class="table table-bordered table-hover table-striped">
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
