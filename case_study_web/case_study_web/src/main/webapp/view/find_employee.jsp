<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/7/2023
  Time: 8:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Employee</title>
</head>
<body>
<table class="table table-bordered table-striped">
  <tr>
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
  <c:forEach var="employee" items="${employeeList}">
    <tr>
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
</body>
</html>
