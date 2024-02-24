<%-- 
    Document   : mujer
    Created on : 21-feb-2024, 9:02:37
    Author     : danit
--%>

<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
    <head>
        <title>Bienvenido Mujer</title>
    </head>
    <body>
        <h1>Bienvenido Mujer</h1>
        <%
            HttpSession s = request.getSession();
            String nombre = "";
            String apellidos = "";
            String sexo = "";
            if (s != null) {
                nombre = s.getAttribute("nombre").toString();
                apellidos = s.getAttribute("apellidos").toString();
                sexo = s.getAttribute("sexo").toString();
            }
        %>
        <p>Nombre: <%=nombre%></p>
        <p>Apellidos: <%=apellidos%></p>
        <p>Sexo: <%=sexo%></p>
        <form action="logout.jsp" method="post">
            <input name="cerrarSesion" hidden value="true">
            <input type="submit" value="Cerrar Sesión">
        </form>
    </body>
</html>

