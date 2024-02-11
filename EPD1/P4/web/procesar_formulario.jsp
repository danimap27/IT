<%-- 
    Document   : procesar_formulario
    Created on : 11-feb-2024, 11:41:10
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String trabaja = request.getParameter("trabaja");
            String eCivil = request.getParameter("eCivil");
            float ingresos = Float.parseFloat(request.getParameter("ingresos"));
            float gastos = Float.parseFloat(request.getParameter("gastos"));

            boolean datosOK = true;
            if (nombre.isEmpty() || apellidos.isEmpty() || trabaja.isEmpty() || eCivil.isEmpty()) {
                datosOK = false;
            }
            boolean credito = false;
            if ((ingresos * 2 >= gastos && eCivil.equals("casado") && trabaja.equals("si")) || (ingresos >= gastos && !eCivil.equals("casado") && trabaja.equals("si"))) {
                credito = true;
            }

            if (datosOK) {
                if (credito) {
        %>         
        <h1>Campos del formulario completos</h1>
        <p>Nombre:<%=nombre%></p>
        <p>Apellidos:<%=apellidos%></p>
        <p>Estado civil:<%=eCivil%></p>
        <p>¿Trabaja?<%=trabaja%></p>
        <p>Ingresos:<%=ingresos%></p>
        <p>Gastos:<%=gastos%></p>
        <%
                    out.write("<p>Felicidades!!! Te damos el credito de 4.7$ pra que te compres una cocacola y dos doritos.</p>");
                } else {
                    out.write("<p color='red'>No cumples las condiciones para dar el credito, lo siento.</p>");
                }
            } else {
                out.write("<p color='red'>Error al introducir los datos.</p>");
            }
        %>
        <form action="index.html" method="post">
            <input type="submit" value="Volver al inicio">
        </form>
    </body>
</html>
