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
    <%--Phân trang--%>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>

<h1 class="d-flex justify-content-center">Customer</h1>

<tr>
    <div>
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a href="http://localhost:8080" class="navbar-brand btn btn-outline-success">Home</a>
                <form action="/customer?action=find" method="post" class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <div>
        <button type="submit" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModalAdd"
                data-bs-whatever="@mdo">Add
        </button>
    </div>
</tr>

<p>${mess}</p>

<table class="table table-bordered table-striped container" id="tableCustomer">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Day of Birth</th>
        <th>Gender</th>
        <th>Id card</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer type</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.date_of_birth}</td>
            <c:if test="${customer.gender == 0}">
                <td> Nam</td>
            </c:if>
            <c:if test="${customer.gender == 1}">
                <td> Nữ</td>
            </c:if>
            <td>${customer.id_card}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <c:forEach var="customerTypeList" items="${customerTypeList}">
                <c:if test="${customer.customer_type == customerTypeList.id}">
                    <td> ${customerTypeList.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <button onclick="updateCustomer(${customer.id})" type="submit" class="btn btn-outline-secondary"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModalUpdate"
                        data-bs-whatever="@mdo">Update
                </button>
            </td>
            <td>
                <button onclick="deleteCustomer('${customer.id}','${customer.name}')" type="button"
                        class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#exampleModalDelete"
                        data-bs-whatever="@mdo">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<%--Modal Add Customer--%>
<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelAdd"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/customer?action=add" method="post">
                    <fieldset>
                        <legend>Add Customer</legend>
                        Name: <input type="text" name="name" placeholder="Name"/><br/>
                        Date of Birth: <input type="text" name="date_of_birth"
                                              placeholder="Date of Birth"/><br/>
                        Gender:
                        <select name="gender">
                            <option value="0">
                                Nam
                            </option>
                            <option value="1">
                                Nữ
                            </option>
                        </select>
                        ID Card: <input type="text" name="id_card" placeholder="ID Card"/><br/>
                        Phone: <input type="text" name="phone_number" placeholder="Phone"/><br/>
                        Email: <input type="text" name="email" placeholder="Email"/><br/>
                        Address: <input type="text" name="address" placeholder="Address"/><br/>
                        Customer Type:
                        <select name="customer_type_id">
                            <c:forEach var="customerTypeList" items="${customerTypeList}">
                                <option value="${customerTypeList.id}">${customerTypeList.name}</option>
                            </c:forEach>
                        </select>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Customer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--MODAL DELETE CUSTOMER--%>
<div class="modal fade" id="exampleModalDelete" tabindex="-1" aria-labelledby="exampleModalLabelDelete"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelDelete">Delete Customer</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="id">
                    <span>You want delete Customer</span>
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
                <form action="/customer?action=update" method="post">
                    <fieldset>
                        <legend>Update Customer</legend>
                        ID: <input type="number" name="id" id="updateId" value="${id}" readonly>
                        Name: <input type="text" name="name" placeholder="Name"/><br/>
                        Date of Birth: <input type="date" name="date_of_birth" placeholder="Date of Birth"/><br/>
                        Gender: Gender: <select name="gender">
                        <option value="0">
                            Nam
                        </option>
                        <option value="1">
                            Nữ
                        </option>
                    </select>
                        ID Card: <input type="text" name="id_card" placeholder="ID Card"/><br/>
                        Phone: <input type="text" name="phone" placeholder="Phone"/><br/>
                        Email: <input type="text" name="email" placeholder="Email"/><br/>
                        Address: <input type="text" name="address" placeholder="Address"/><br/>
                        <select name="customer_type_id">
                            <c:forEach var="customerTypeList" items="${customerTypeList}">
                                <option value="${customerTypeList.id}">${customerTypeList.name}</option>
                            </c:forEach>
                        </select>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Customer</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteCustomer(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function updateCustomer(id) {
        document.getElementById("updateId").value = id;
    }
</script>
<%--Phân trang--%>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 8
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">
</script>
</body>
</html>
