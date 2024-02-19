<%-- 
    Document   : Compra
    Created on : 19-feb-2024, 16:54:15
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page session="true" import="java.util.*, libreria.*" %>
<%
    List<String> listaIsbns
            = (List<String>) session.getAttribute("tienda.carro");
    List<Libro> listaCompra = Almacen.consultaListaLibrosSolicitados(listaIsbns);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>LIBROS COMPRADOS:</h1>
    <center>
        <table border=1 cellspacing=1 cellpadding=2 width="100%" bgcolor="#FFFFFF">
            <tr>
                <td><b>Titulo</b></td>
                <td><b>Autor</b></td>
                <td><b>Precio</b></td>
                <td><b>Cantidad</b></td>
                <td><b>Subtotal</b></td>
                <td></td>
            </tr>
            <%
                if (listaCompra != null) {
                    double suma = 0.;
                    for (int idx = 0; idx < listaCompra.size(); idx++) {
                        Libro libro = listaCompra.get(idx);
                        double subtotal = libro.getPrecio() * libro.getCantidad();
                        suma += subtotal;
            %>
            <tr> <td><b><%= libro.getTitulo()%></b></td>
                <td><b><%= libro.getAutor()%></b></td>
                <td><b><%= libro.getPrecio()%></b></td>
                <td><b><%= libro.getCantidad()%></b></td>
                <td><b><%= subtotal%></b></td>
            </tr>
            <%
                }
            %>
            <br>
            <tr> <td><b>TOTAL</b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b></b></td>
                <td><b><%= suma%></b></td>
            </tr>
            <%
} else {%>
            <tr>
                <td><b>TOTAL</b></td>
                <td><b></b></td> <td><b></b></td>
                <td><b>0</b></td>
                <td></td>
            </tr>
            <% }
            %>
        </table>
    </center>
</body>
</html>