<%-- 
    Document   : procesar_formulario
    Created on : 09-feb-2024, 21:40:49
    Author     : danit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Resultado formulario</h1>
        <%
            out.write("<p>Nombre: " + request.getParameter("nombre") + "</p>");
            out.write("<p>Apellido: " + request.getParameter("apellido") + "</p>");
            out.write("<p>Email: " + request.getParameter("email") + "</p>");
            out.write("<p>Ha estudiado antes IT?: " + request.getParameter("it_previo") + "</p>");
            if(request.getParameter("it_previo").equals("si")){
                out.write("<p>En caso afirmativo, indicar el o los bloques que encontró más difíciles: "+request.getParameter("it_previo_si")+"</p>");
            }else{
                out.write("<p>En caso negativo, indicar qué nota espera obtener en la asignatura: "+request.getParameter("it_previo_no")+"</p>");
            }
        %>
    </body>
</html>
