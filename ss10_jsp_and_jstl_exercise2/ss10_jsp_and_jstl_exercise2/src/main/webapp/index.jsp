<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<br/>
<form action="/calculator" method="post">
    <p>First operand</p>
    <input name="num1" type="text" placeholder="input firt operand">
    <p>Operator</p>
    <select name="operator">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <p>Second operator</p>
    <input name="num2" type="text" placeholder="input second operand">
    <input type="submit" value="Result">
</form>
</body>
</html>