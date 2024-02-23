<%-- 
    Document   : Amazen
    Created on : 23-feb-2024, 8:14:53
    Author     : danit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amazen</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            .product {
                border: 1px solid #ccc;
                padding: 10px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <h1>Welcome to Amazen</h1>
        <div class="product-list">
            <% String[] productos = {"libroTroll.html", "comidaTortuga.html", "movilXiaomi.html"}; %>
            <% for (String producto : productos) { %>
                <div class="product">
                    <jsp:include page="<%=producto%>" />
                </div>
            <% } %>
        </div>
    </body>
</html>
