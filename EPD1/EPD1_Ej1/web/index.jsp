<%-- 
    Document   : index
    Created on : 05-feb-2024, 16:30:14
    Author     : eps
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Calendar calendario = Calendar.getInstance();
        int hora = calendario.get(Calendar.HOUR_OF_DAY);
        int dia = calendario.get(Calendar.DAY_OF_MONTH);
        int mes = calendario.get(Calendar.MONTH);
        int year = calendario.get(Calendar.YEAR);
        
        String mensaje = "Buenas noches";
        
        if (hora >= 5 && hora <= 11){
            mensaje = "Buenas tardes";
        }else if (hora )
        %>
    </body>
</html>
