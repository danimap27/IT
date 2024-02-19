<%-- 
    Document   : index
    Created on : 19-feb-2024, 9:49:22
    Author     : danit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>EPD2 P2</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Elija la página de referencia a objetos implícitos que desee visualizar:</h1>
    <form action="redirectAction.jsp" method="post">
        <select name="option">
            <option value="request">request</option>
            <option value="out">out</option>
            <option value="response">response</option>
            <option value="config">config</option>
            <option value="application">application</option>
            <option value="session">session</option>
        </select>
        <input type="submit" value="Redirigir">
    </form>
</body>
</html>

