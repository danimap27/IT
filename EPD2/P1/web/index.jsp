<%-- 
    Document   : index
    Created on : 19-feb-2024, 8:55:33
    Author     : danit
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Files, java.nio.file.Paths, java.nio.charset.StandardCharsets" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>EPD2 P1</title>
</head>
<body>

    <h1>Noticias</h1>

    <form action="index.jsp" method="post">
        <%--Pedir tutoria--%>
        <% 
            String[] noticias = {"noticia1.txt", "noticia2.txt", "noticia3.txt"};
            for (int i = 0; i < noticias.length; i++) {
                String noticia = noticias[i];
                String mostrarOcultarParam = "ocultarMostrar" + (i + 1);
                String mostrarOcultarValue = (request.getParameter(mostrarOcultarParam) != null) ? request.getParameter(mostrarOcultarParam) : "mostrar";

        %>
                <div>
                    <h2>Noticia <%= (i + 1) %></h2>
                    <p>
                        <jsp:include page="<%=noticia%>"/>
                    </p>
                    <input type="radio" name="<%= mostrarOcultarParam %>" value="mostrar" <%= mostrarOcultarValue.equals("mostrar") ? "checked" : "" %>> Mostrar
                    <input type="radio" name="<%= mostrarOcultarParam %>" value="ocultar" <%= mostrarOcultarValue.equals("ocultar") ? "checked" : "" %>> Ocultar
                    <br>
                    <br>
                    <hr>
                </div>
        <%
            }
        %>
        <input type="submit" value="Actualizar">
    </form>

    <%
        for (int i = 0; i < noticias.length; i++) {
            String mostrarOcultarParam = "ocultarMostrar" + (i + 1);
            if (request.getParameter(mostrarOcultarParam) != null && request.getParameter(mostrarOcultarParam).equals("ocultar")) {
    %>
                <p>Información no mostrada para la Noticia <%= (i + 1) %></p>
    <%
            }
        }
    %>

</body>
</html>
