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
    <%--Phân trang--%>
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h1 class="d-flex justify-content-center">Facility</h1>
<tr>
    <div>
        <nav class="navbar bg-body-tertiary">
            <div class="container-fluid">
                <a href="http://localhost:8080" class="navbar-brand">Home</a>
                <form action="/facility?action=find" method="post" class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
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
<table class="container-fluid table table-bordered table-striped " id="tableFacility">
    <thead>
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Standard Room</th>
        <th>Description Other Convenience</th>
        <th>Pool area</th>
        <th>Number floors</th>
        <th>Facility free</th>
        <th>Rent type</th>
        <th>Facility Type</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facilityList" items="${facilityList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${facilityList.id}</td>
            <td>${facilityList.name}</td>
            <td>${facilityList.area}</td>
            <td>${facilityList.cost}</td>
            <td>${facilityList.max_people}</td>
            <td>${facilityList.standard_room}</td>
            <td>${facilityList.description_other_convenience}</td>
            <td>${facilityList.pool_area}</td>
            <td>${facilityList.number_of_floors}</td>
            <td>${facilityList.facility_free}</td>
            <c:forEach var="rentTypeList" items="${rentTypeList}">
                <c:if test="${facilityList.rent_type == rentTypeList.id}">
                   <td> ${rentTypeList.name}</td>
                </c:if>
            </c:forEach>
            <c:forEach var="facilityTypeList" items="${facilityTypeList}">
                <c:if test="${facilityList.facility_type == facilityTypeList.id}">
                    <td>${facilityTypeList.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <button onclick="updateFacility(${facilityList.id})" type="submit" class="btn btn-outline-secondary"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModalUpdate"
                        data-bs-whatever="@mdo">Update
                </button>
            </td>
            <td>
                <button onclick="deleteFacility('${facilityList.id}','${facilityList.name}')" type="button"
                        class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#exampleModalDelete"
                        data-bs-whatever="@mdo">Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<%--Modal add facility--%>
<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelAdd"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-center">
                    <input hidden type="text" name="facilityTypeId" id="facilityTypeId">
                    <button type="button" class="btn btn-outline-success" onclick="addVilla()">Villa</button>
                    <button type="button" class="btn btn-outline-success" onclick="addHouse()">House</button>
                    <button type="button" class="btn btn-outline-success" onclick="addRoom()">Room</button>
                </div>
                <form action="/facility?action=add" method="post">
                    <fieldset>
                        <legend>Add Facility</legend>
                        Name: <input type="text" name="name" placeholder="Name"/><br>
                        Area : <input type="number" name="area" placeholder="Area"/><br>
                        Cost: <input type="number" name="cost" placeholder="Cost"/><br>
                        Max People: <input type="number" name="max_people" placeholder="Max People"/><br>
                        Standard Room: <input id="standardRoom" type="text" name="standard_room"
                                              placeholder="Standard Room"/><br>
                        Description Other Convenience: <input id="description" type="text"
                                                              name="description_other_convenience"
                                                              placeholder="Description Other Convenience"/><br>
                        Pool Area: <input value="0.0" id="poolArea" type="number" name="pool_area"
                                          placeholder="Pool Area"/><br>
                        Num Of Floors: <input value="0" id="numberOfFloors" type="number" name="number_of_floors"
                                              placeholder="Num Of Floors"/><br>
                        Facility Free: <input id="facilityFree" type="text" name="facility_free"
                                              placeholder="Facility Free"/><br>
                        Rent Type:
                        <select name="rent_type">
                            <c:forEach var="rentTypeList" items="${rentTypeList}">
                                <option value="${rentTypeList.id}">
                                        ${rentTypeList.name}
                                </option>
                            </c:forEach>
                        </select>
                        Facility Type:
                        <select name="facility_type">
                            <c:forEach var="facilityTypeList" items="${facilityTypeList}">
                                <option value="${facilityTypeList.id}">
                                        ${facilityTypeList.name}
                                </option>
                            </c:forEach>
                        </select>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Facility</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%--MODAL DELETE FACILITY--%>
<div class="modal fade" id="exampleModalDelete" tabindex="-1" aria-labelledby="exampleModalLabelDelete"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabelDelete">Delete Facility</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/facility?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="id">
                    <span>You want delete Facility</span>
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


<%--Modal update facility--%>
<div class="modal fade" id="exampleModalUpdate" tabindex="-1" aria-labelledby="exampleModalLabelUpdate" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelUpdate"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex justify-content-center">
                    <input hidden type="text" name="updateFacilityTypeId" id="updateFacilityTypeId">
                    <button type="button" class="btn btn-outline-success" onclick="updateVilla()">Villa</button>
                    <button type="button" class="btn btn-outline-success" onclick="updateHouse()">House</button>
                    <button type="button" class="btn btn-outline-success" onclick="updateRoom()">Room</button>
                </div>
                <form action="/facility?action=update" method="post">
                    <fieldset>
                        <legend>Update Facility</legend>
                        ID: <input type="number" name="id" id="updateId" value="${id}" readonly>
                        Name: <input type="text" name="name" placeholder="Name"/><br>
                        Area : <input type="number" name="area" placeholder="Area"/><br>
                        Cost: <input type="number" name="cost" placeholder="Cost"/><br>
                        Max People: <input type="number" name="max_people" placeholder="Max People"/><br>
                        Standard Room: <input id="updateStandardRoom" type="text" name="standard_room"
                                              placeholder="Standard Room"/><br>
                        Description Other Convenience: <input id="updateDescription" type="text"
                                                              name="description_other_convenience"
                                                              placeholder="Description Other Convenience"/><br>
                        Pool Area: <input value="0.0" id="updatePoolArea" type="number" name="pool_area"
                                          placeholder="Pool Area"/><br>
                        Num Of Floors: <input value="0" id="updateNumberOfFloors" type="number" name="number_of_floors"
                                              placeholder="Num Of Floors"/><br>
                        Facility Free: <input id="updateFacilityFree" type="text" name="facility_free"
                                              placeholder="Facility Free"/><br>
                        Rent Type:
                        <select name="rent_type">
                            <c:forEach var="rentTypeList" items="${rentTypeList}">
                                <option value="${rentTypeList.id}">
                                        ${rentTypeList.name}
                                </option>
                            </c:forEach>
                        </select>
                        Facility Type:
                        <select name="facility_type">
                            <c:forEach var="facilityTypeList" items="${facilityTypeList}">
                                <option value="${facilityTypeList.id}">
                                        ${facilityTypeList.name}
                                </option>
                            </c:forEach>
                        </select>
                    </fieldset>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update Facility</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function deleteFacility(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function updateFacility(id){
        document.getElementById("updateId").value = id;

    }

    function addVilla() {
        document.getElementById("facilityTypeId").value = 1;
        document.getElementById("standardRoom").style.display = 'block';
        document.getElementById("description").style.display = 'block';
        document.getElementById("poolArea").style.display = 'block';
        document.getElementById("numberOfFloors").style.display = 'block';
        document.getElementById("facilityFree").style.display = 'block';
    }

    function addHouse() {
        document.getElementById("facilityTypeId").value = 2;
        document.getElementById("standardRoom").style.display = 'block';
        document.getElementById("description").style.display = 'block';
        document.getElementById("poolArea").style.display = 'block';
        document.getElementById("numberOfFloors").style.display = 'block';
        document.getElementById("facilityFree").style.display = 'block';
    }

    function addRoom() {
        document.getElementById("facilityTypeId").value = 3;
        document.getElementById("standardRoom").style.display = 'block';
        document.getElementById("description").style.display = 'block';
        document.getElementById("poolArea").style.display = 'none';
        document.getElementById("numberOfFloors").style.display = 'none';
        document.getElementById("facilityFree").style.display = 'block';
    }

    function updateVilla() {
        document.getElementById("updateFacilityTypeId").value = 1;
        document.getElementById("updateStandardRoom").style.display = 'block';
        document.getElementById("updateDescription").style.display = 'block';
        document.getElementById("updatePoolArea").style.display = 'block';
        document.getElementById("updateNumberOfFloors").style.display = 'block';
        document.getElementById("updateFacilityFree").style.display = 'block';
    }

    function updateHouse() {
        document.getElementById("updateFacilityTypeId").value = 2;
        document.getElementById("updateStandardRoom").style.display = 'block';
        document.getElementById("updateDescription").style.display = 'block';
        document.getElementById("updatePoolArea").style.display = 'block';
        document.getElementById("updateNumberOfFloors").style.display = 'block';
        document.getElementById("updateFacilityFree").style.display = 'block';
    }

    function updateRoom() {
        document.getElementById("updateFacilityTypeId").value = 3;
        document.getElementById("updateStandardRoom").style.display = 'block';
        document.getElementById("updateDescription").style.display = 'block';
        document.getElementById("updatePoolArea").style.display = 'none';
        document.getElementById("updateNumberOfFloors").style.display = 'none';
        document.getElementById("updateFacilityFree").style.display = 'block';
    }
</script>
</body>

<%--Phân trang--%>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">

</script>
</html>
