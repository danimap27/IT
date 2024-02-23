<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD2 Ex1</title>
    </head>
    <body>
        <%
            String fallo = (String) session.getAttribute("fallo");
            if (fallo != null) {
                session.removeAttribute("fallo");
        %>
        Nombre de usuario o clave incorrectos.
        <%
            }
        %>
        <h1>Introduzca su nombre de usuario y clave:</h1>
        <form action="comprobacion.jsp" method="post">
            <table border="1" cellspacing="2" cellpadding="2">
                <tr> <td>Usuario</td> <td><input type="text" name="usuario"></td> </tr>
                <tr> <td>Clave</td> <td><input type="password" name="clave"></td> </tr>
                <tr><td><input type="submit" value="Enviar" size="2"></td></tr>
            </table> </form>
    </body>
</html>
