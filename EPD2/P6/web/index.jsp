<%-- 
    Document   : index
    Created on : 21-feb-2024, 8:44:41
    Author     : danit
--%>

<%@ page import="java.net.URLEncoder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
    <head>
        <title>EPD2 P6</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            Nombre: <input type="text" name="nombre"><br>
            Apellidos: <input type="text" name="apellidos"><br>
            Sexo:
            <input type="radio" name="sexo" value="hombre"> Hombre
            <input type="radio" name="sexo" value="mujer"> Mujer<br>
            <input type="submit" value="Registrar">
        </form>
        <%
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String sexo = request.getParameter("sexo");

            if (nombre != null && apellidos != null && sexo != null) {
                HttpSession s = request.getSession();
                s.setAttribute("nombre", nombre);
                s.setAttribute("apellidos", apellidos);
                s.setAttribute("sexo", sexo);
                if (sexo.equals("hombre")) {
                    response.sendRedirect("hombre.jsp");
                } else {
                    response.sendRedirect("mujer.jsp");
                }
            }
        %>
    </body>
</html>

