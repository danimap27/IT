<%-- 
    Document   : resultado
    Created on : 12-feb-2024, 16:44:18
    Author     : Dani
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Collections"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Resultado del formulario</title>
    </head>
    <body>
        <h1>Resultado del formulario</h1>
        <h2>Datos del usuario</h2>
        <table border="1">
            <tr>
                <th>Campo</th>
                <th>Valor</th>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= request.getParameter("email")%></td>
            </tr>
            <tr>
                <td>Nombre de usuario</td>
                <td><%= request.getParameter("nombre")%></td>
            </tr>
            <tr>
                <td>Contraseña</td>
                <td><%= request.getParameter("contrasena")%></td>
            </tr>
        </table>
        <h2>Métodos del objeto request</h2>
        <table border="1">
            <tr>
                <th>Método</th>
                <th>Descripción</th>
                <th>Valor</th>
            </tr>
            <tr>
                <td>getRequestedSessionId()</td>
                <td>Devuelve el identificador de la sesión del cliente</td>
                <td><%= request.getRequestedSessionId()%></td>
            </tr>
            <tr>
                <td>getRemoteAddr()</td>
                <td>Devuelve la dirección IP del cliente</td>
                <td><%= request.getRemoteAddr()%></td>
            </tr>
            <tr>
                <td>getRemoteHost()</td>
                <td>Devuelve el nombre del host del cliente</td>
                <td><%= request.getRemoteHost()%></td>
            </tr>
            <tr>
                <td>getRemotePort()</td>
                <td>Devuelve el puerto del cliente</td>
                <td><%= request.getRemotePort()%></td>
            </tr>
            <tr>
                <td>getProtocol()</td>
                <td>Devuelve el protocolo utilizado por el cliente</td>
                <td><%= request.getProtocol()%></td>
            </tr>
            <tr>
                <td>getMethod()</td>
                <td>Devuelve el método HTTP utilizado (GET, POST, etc.)</td>
                <td><%= request.getMethod()%></td>
            </tr>
            <tr>
                <td>getContextPath()</td>
                <td>Devuelve la ruta de contexto de la aplicación</td>
                <td><%= request.getContextPath()%></td>
            </tr>
            <tr>
                <td>getServletPath()</td>
                <td>Devuelve la ruta del servlet que se está ejecutando</td>
                <td><%= request.getServletPath()%></td>
            </tr>
            <tr>
                <td>getQueryString()</td>
                <td>Devuelve la cadena de consulta de la URL</td>
                <td><%= request.getQueryString()%></td>
            </tr>
            <tr>
                <td>getHeader(String name)</td>
                <td>Devuelve el valor de la cabecera HTTP especificada</td>
                <td>
                    <ul>
                        <%
                            List<String> headers = Collections.list(request.getHeaderNames());
                            for (String header : headers) {
                        %>
                        <li><%= header%>: <%= request.getHeader(header)%></li>
                            <% }%>
                    </ul>
                </td>
            </tr>
        </table>
    </body>
</html>

