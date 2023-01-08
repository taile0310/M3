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

<body>

<h1 class="d-flex justify-content-center">Employee</h1>

<tr>
    <div>
        <div>
            <nav class="navbar bg-body-tertiary">
                <div class="container-fluid">
                    <a href="view/furama.jsp" class="navbar-brand">Home</a>
                    <form action="/employee?action=find" method="post" class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </nav>
        </div>
        <button type="submit" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModalAdd"
                data-bs-whatever="@mdo">Add
        </button>
    </div>
</tr>

<p style="color: limegreen">${mess}</p>

<table class="table table-bordered table-striped">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Day of Birth</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Salary</th>
        <th>Position</th>
        <th>Education Degree</th>
        <th>Division</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="employee" items="${employeeList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td>${employee.date_of_birth}</td>
            <td>${employee.id_card}</td>
            <td>${employee.phone}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.salary}</td>
            <td>${employee.position_id}</td>
            <td>${employee.education_degree_id}</td>
            <td>${employee.division_id}</td>
            <td>
                <button onclick="updateEmployee(${employee.id})" type="submit" class="btn btn-outline-secondary"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModalUpdate"
                        data-bs-whatever="@mdo">Update
                </button>
            </td>
            <td>
                <button onclick="deleteEmployee('${employee.id}','${employee.name}')" type="button"
                        class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#exampleModalDelete"
                        data-bs-whatever="@mdo">Delete
                </button>
            </td>

        </tr>
    </c:forEach>
</table>

<%--Modal ADD--%>
<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelAdd"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/employee?action=add" method="post">
                    <fieldset>
                        <legend>Add Employee</legend>
                        Name: <input type="text" name="name" placeholder="Name"/><br/>
                        Date of Birth: <input type="date" name="date_of_birth" placeholder="Date of Birth"/><br/>
                        ID Card: <input type="text" name="id_card" placeholder="ID Card"/><br/>
                        Phone: <input type="text" name="phone" placeholder="Phone"/><br/>
                        Email: <input type="text" name="email" placeholder="Email"/><br/>
                        Address: <input type="text" name="address" placeholder="Address"/><br/>
                        Salary: <input type="number" name="salary" placeholder="Salary"/><br/>
                        Position: <input type="number" name="position_id" placeholder="Position"/><br/>
                        Education degree: <input type="number" name="education_degree_id"
                                                 placeholder="Education degree"/><br/>
                        Division: <input type="number" name="division_id" placeholder="Division"/><br/>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Employee</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--MODAL DELETE--%>
<div class="modal fade" id="exampleModalDelete" tabindex="-1" aria-labelledby="exampleModalLabelDelete"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelDelete">Delete Employee</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="id">
                    <span>You want delete user</span>
                    <span style="color:red;" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--MODAL UPDATE--%>
<div class="modal fade" id="exampleModalUpdate" tabindex="-1" aria-labelledby="exampleModalLabelUpdate"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelUpdate"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/employee?action=update" method="post">
                    <fieldset>
                        <legend>Update Employee</legend>
                        ID: <input type="number" name="id" id="updateId" value="${id}" readonly>
                        Name: <input type="text" name="name" placeholder="Name"/><br/>
                        Date of Birth: <input type="date" name="date_of_birth" placeholder="Date of Birth"/><br/>
                        ID Card: <input type="text" name="id_card" placeholder="ID Card"/><br/>
                        Phone: <input type="text" name="phone" placeholder="Phone"/><br/>
                        Email: <input type="text" name="email" placeholder="Email"/><br/>
                        Address: <input type="text" name="address" placeholder="Address"/><br/>
                        Salary: <input type="number" name="salary" placeholder="Salary"/><br/>
                        Position: <input type="number" name="position_id" placeholder="Position"/><br/>
                        Education degree: <input type="number" name="education_degree_id"
                                                 placeholder="Education degree"/><br/>
                        Division: <input type="number" name="division_id" placeholder="Division"/><br/>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Employee</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteEmployee(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function updateEmployee(id) {
        document.getElementById("updateId").value = id;
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">

</script>
</html>
