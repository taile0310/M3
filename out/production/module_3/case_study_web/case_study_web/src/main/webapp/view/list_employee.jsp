<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/2/2023
  Time: 10:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách nhân viên</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body style="background-color: beige">
<h1 class="d-flex justify-content-center">Employee</h1>
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
                                <legend>Add Employee</legend>
                                Name: <input type="text" name="name" placeholder="Name"/><br/>
                                Date of Birth: <input type="text" name="date_of_birth"placeholder="Date of Birth"/><br/>
                                ID Card: <input type="text" name="id_card" placeholder="ID Card"/><br/>
                                Phone: <input type="text" name="phone" placeholder="Phone"/><br/>
                                Email: <input type="text" name="email" placeholder="Email"/><br/>
                                Education degree: <input type="text" name="education_degree_id" placeholder="Education degree"/><br/>
                                Position: <input type="text" name="position_id" placeholder="Position"/><br/>
                                Salary: <input type="text" name="salary" placeholder="Salary"/>
                            </fieldset>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save Employee</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</tr>
<form action="/employee" method="get"></form>
<table class="table table-bordered table-view">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Day of Birth</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Education Degree</th>
        <th>Position</th>
        <th>Salary</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${employee.name}</td>
            <td>${employee.date_of_birth}</td>
            <td>${employee.id_card}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.education_degree_id}</td>
            <td>${employee.position_id}</td>
            <td>${employee.salary}</td>
            <td>
                <button class="btn btn-outline-secondary" type="submit">Update</button>
            </td>
            <td>
                <button class="btn btn-outline-warning" type="submit">Delete</button>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
