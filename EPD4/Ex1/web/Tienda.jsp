<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="libreria.Almacen" %>
<%@page import="libreria.Libro" %>

<%
    List<Libro> listaLibros = null;
    try {
        listaLibros = Almacen.consultaLibrosDisponibles();
    } catch (Exception ex) {
        out.print(ex.getMessage());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Tienda Electrónica de Libros</h1>
        <form name="formularioTienda" action="LibreriaServlet" method="post">
            <b>Libros</b>
            <select name="seleccionLibros">
                <% for (int i = 0; i < listaLibros.size(); i++) {
                        Libro libro = listaLibros.get(i);
                        String txtLibro = libro.getTitulo() + "; "
                                + libro.getAutor() + "; " + libro.getPrecio();
                %>
                <option value="<%=String.valueOf(libro.getIsbn())%>"><%=txtLibro%></option>
                <% }%>
            </select>
            <input type="hidden" name="Accion" value="agregar">
            <input type="submit" name="Agregar" value="Agregar Libro">
        </form>
        <hr>
        <jsp:include page="CarroCompra.jsp" flush="true"/>
    </body>
</html>
