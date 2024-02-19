<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Información de la sesión</title>
</head>
<body>
    <h1>Información de la sesión actual</h1>
    <ul>
        <li>ID de la sesión: <%= sessionId %></li>
        <li>Fecha de creación: <%= formattedDate %></li>
        <li>Duración de la sesión: <%= duration %> segundos</li>
    </ul>
    <br>
    <form action="index.jsp" method="post">
        <button type="submit">Invalidar sesión</button>
    </form>
</body>
</html>
