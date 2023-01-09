<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 1/8/2023
  Time: 6:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> Contract </title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body>
<h1 class="d-flex justify-content-center">Contract</h1>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>Dịch vụ</th>
        <th>Khách hàng</th>
        <th>Ngày bắt đầu</th>
        <th>Ngày kết thúc</th>
        <th>Tiền đặt cọc</th>
        <th>Tổng tiền</th>
        <th>Các dịch vụ đi kèm</th>
    </tr>
    <c:forEach var="contract" items="${contractList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${contract.name_service}</td>
            <td>${contract.name_customer}</td>
            <td>${contract.start_day}</td>
            <td>${contract.end_day}</td>
            <td>${contract.deposits}</td>
            <td>${contract.total}</td>
            <td>
                <button type="submit" class="btn btn-outline-success" data-bs-toggle="modal"
                        data-bs-target="#exampleModalAdd"
                        data-bs-whatever="@mdo">Thêm mới hợp đồng
                </button>
                <button class="btn btn-outline-success" type="submit">Danh sách các dịch vụ đi kèm</button>
            </td>
        </tr>
    </c:forEach>
</table>

<%--Modal--%>
<div class="modal fade" id="exampleModalAdd" tabindex="-1" aria-labelledby="exampleModalLabelAdd" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="justify-content-center modal-title fs-5" id="exampleModalLabelAdd"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <fieldset>
                    <legend>Add Employee</legend>
                    Tên dịch vụ: <input type="text" name="name_service" placeholder="Tên dịch vụ"/><br/>
                    Tên khách hàng: <input type="text" name="name_customer" placeholder="Tên khách hàng"/><br/>
                    Ngày bắt đầu: <input type="date" name="start_day" placeholder="Ngày bắt đầu"/><br/>
                    Ngày kết thúc: <input type="date" name="end_day" placeholder="Ngày kết thúc"/><br/>
                    Tiền đặt cọc: <input type="text" name="deposits" placeholder="Tiền đặt cọc"/><br/>
                    Tổng tiền: <input type="text" name="total" placeholder="Tổng tiền"/><br/>
                    Dịch vụ đi kèm: <button class="btn btn-outline-success" type="submit">Thêm dịch vụ đi kèm</button>
                </fieldset>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="submit" class="btn btn-primary">Thêm hợp đồng</button>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous">

</script>
</html>
