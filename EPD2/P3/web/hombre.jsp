<%-- 
    Document   : hombre
    Created on : 21-feb-2024, 9:02:54
    Author     : danit
--%>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.Cookie" %>
<html>
    <head>
        <title>Bienvenido Hombre</title>
    </head>
    <body>
        <h1>Bienvenido Hombre</h1>
        <%
            Cookie[] cookies = request.getCookies();               
                String nombre = "";
                String apellidos = "";
                String sexo = "";
            if (cookies != null) {


                int i = 0;
                while (i < cookies.length) {
                    if (cookies[i].getName().equals("nombre")) {
                        nombre = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("apellidos")) {
                        apellidos = cookies[i].getValue();
                    }
                    if (cookies[i].getName().equals("sexo")) {
                        sexo = cookies[i].getValue();
                    }
                    i++;
                }
            }

        %>
        <p>Nombre: <%=nombre%></p>
        <p>Apellidos: <%=apellidos%></p>
        <p>Sexo: <%=sexo%></p>
        <form action="" method="post">
            <input type="submit" value="Cerrar Sesión">
        </form>
    </body>
</html>

