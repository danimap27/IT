<%-- 
    Document   : index
    Created on : 24-feb-2024, 21:13:42
    Author     : Dani
--%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="parking.Parking" %>
<%@ page import="parking.Coche" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EPD3 Ej1</title>
</head>
<body>
    <h2>Lista de Vehículos Registrados</h2>
    <table border="1">
        <tr>
            <th>Matrícula</th>
            <th>Modelo</th>
            <th>Hora de Entrada</th>
            <th>Hora de Salida</th>
            <th>Tiempo Permitido</th>
        </tr>
        <%
            List<Coche> coches = Parking.obtenerCoches();
            SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

            for (Coche coche : coches) {
        %>
                <tr>
                    <td><%= coche.getMatricula() %></td>
                    <td><%= coche.getModelo() %></td>
                    <td><%= dateFormat.format(coche.getHoraEntrada()) %></td>
                    <td><%= (coche.getHoraSalida() != null) ? dateFormat.format(coche.getHoraSalida()) : "--" %></td>
                    <td><%= coche.getTiempoPermitido() %></td>
                </tr>
        <%
            }
        %>
    </table>
</body>
</html>
