<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Calculator" %>
</h1>
<br/>
<a href="display-discount">Calculator</a>
<form action="/display-discount" method="post">
    <p>Please enter price</p>
    <input name="prices">
    <p>Please enter discount</p>
    <input name="discount">
    <button type="submit">Submit</button>
</form>
</body>
</html>