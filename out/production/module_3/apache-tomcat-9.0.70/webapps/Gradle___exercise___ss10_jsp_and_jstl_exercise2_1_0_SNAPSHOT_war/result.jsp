<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/30/2022
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h3>Result</h3>
<c:choose>
    <c:when test="${param.operator == '+'}">
        <h4>${firstOperand} + ${secondOperand} = ${addition}</h4>
    </c:when>
    <c:when test="${param.operator == '-'}">
        <h4>${param.num1} - ${param.num2} = ${subtraction}</h4>
    </c:when>
    <c:when test="${param.operator == '*'}">
        <h4>${param.num1} * ${param.num2} = ${subtraction}</h4>
    </c:when>
    <c:when test="${param.operator == '/'}">
        <c:if test="${param.num2 == 0}">
            <h4>cannot be divided by zero</h4>
        </c:if>
        <c:if test="${param.num1 != 0}">
            <h4>${param.num1} / ${param.num2} = ${division}</h4>
        </c:if>
    </c:when>
</c:choose>
</body>
</html>
