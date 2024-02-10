<%-- 
    Document   : index
    Created on : 05-feb-2024, 16:30:14
    Author     : eps
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!private static String obtenerNombreMes(int mes) {
    String[] nombresMeses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
    return nombresMeses[mes - 1];
}%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fecha y Saludo Personalizado</title>
</head>
<body>
    <%
        Calendar calendario = Calendar.getInstance();
        int hora = calendario.get(Calendar.HOUR_OF_DAY);
        int dia = calendario.get(Calendar.DAY_OF_MONTH);
        int mes = calendario.get(Calendar.MONTH) + 1; // Los meses van de 0 a 11
        int año = calendario.get(Calendar.YEAR);

        String saludo = "";
        if (hora >= 5 && hora <= 11) {
            saludo = "Buenos días";
        } else if (hora >= 12 && hora <= 20) {
            saludo = "Buenas tardes";
        } else {
            saludo = "Buenas noches";
        }

        String fecha = String.format("%d de %s de %d", dia, obtenerNombreMes(mes), año);
    %>

    <h1>¡<%= saludo %>!</h1>
    <p>Hoy es <strong><%= fecha %></strong>.</p>
</body>
</html>
