<%@ page import="java.util.Date" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Información de Sesión</title>
</head>
<body>
    <h2>Información de Sesión</h2>

    <% 
        session = request.getSession();
        String sessionId = session.getId();
        Date creationTime = new Date(session.getCreationTime());
        Date now = new Date();
        long duration = now.getTime() - creationTime.getTime();

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        String formattedCreationTime = dateFormat.format(creationTime);

        long durationInSeconds = duration / 1000;
        out.println("<p>ID de la Sesión: " + sessionId + "</p>");
        out.println("<p>Fecha de Creación: " + formattedCreationTime + "</p>");
        out.println("<p>Duración de la Sesión: " + durationInSeconds + " segundos</p>");
    %>

    <form action="invalidateSession.jsp" method="post">
        <input type="submit" value="Invalidar Sesión">
    </form>
</body>
</html>

