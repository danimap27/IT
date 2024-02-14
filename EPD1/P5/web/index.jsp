<%-- 
    Document   : index
    Created on : 11-feb-2024, 16:24:03
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD1 P5</title>
    </head>
    <body>
        <%
            String nombre = " ";
            nombre = request.getParameter("nombre");
            String sede_social = request.getParameter("sede_social");
            String telefono = request.getParameter("telefono");


        %>
        <h1>Alta de una empresa</h1>
        <form action="procesar_alta.jsp" method="post">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" value="<%=nombre%>" required>
            <br>
            <label for="sede_social">Sede social:</label>
            <input type="text" id="sede_social" name="sede_social" value="<%=sede_social%>" required>
            <br>
            <label for="telefono">Teléfono:</label>
            <input type="tel" name="telefono" value="<%=telefono%>" required>
            <br>
            <form action="index.jsp" method="post">
                <input type="submit" name="capital_extranjero" value="si" checked>
                <label for="capital_extranjero_si">Sí</label>
                <br>
                <input type="submit" name="capital_extranjero" value="no" >
                <label for="capital_extranjero_no">No</label>
            </form>
            <br>
            <br>        

            <label for="pais">País:</label>
            <input type="text" id="pais" name="pais">
            <br>
            <label for="aportacion_extranjero">Aportación en %:</label>
            <input type="number" id="aportacion_extranjero" name="aportacion_extranjero">
            <br>
            <label for="banco_extranjero">Banco en el extranjero:</label>
            <input type="text" id="banco_extranjero" name="banco_extranjero">
            <br>

            <label for="socio_principal">Socio principal:</label>
            <input type="text" id="socio_principal" name="socio_principal">
            <br>
            <label for="epd">EPD:</label>
            <input type="text" id="epd" name="epd">
            <br>
            <label for="aportacion_socio_principal">Aportación socio principal:</label>
            <input type="number" id="aportacion_socio_principal" name="aportacion_socio_principal">
            <br>
            <label for="avalista">Avalista:</label>
            <input type="text" id="avalista" name="avalista">
            <br>

            <br>
            <input type="submit" value="Enviar">
        </form>
    </body>
</html>
