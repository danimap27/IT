<%-- 
    Document   : index
    Created on : 24-feb-2024, 14:09:11
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EPD2 P5</title>
    </head>
    <body>
        <%
            String userAgent = request.getHeader("User-Agent");
            String language = request.getHeader("Accept-Language");
            if (userAgent.contains("Chrome")) {
        %>
        <jsp:forward page="chrome.jsp"/>
        <%} else if (userAgent.contains("Firefox")) {%>
        <jsp:forward page="Firefox.jsp"/>
        <%} else {
            if (language != null && language.contains("en")) {
        %>
        <h1>The language is in English</h1>
        <%
        } else if (language != null && language.contains("es")) {
        %>
        <h1>El idioma esta en Español</h1>
        <%
        }
    }
        %>
    </body>
</html>
