<%-- 
    Document   : logout
    Created on : 21-feb-2024, 12:24:05
    Author     : danit
--%>
<%@ page import="javax.servlet.http.Cookie" %>
<%

    Cookie[] cookies = request.getCookies();
    for (Cookie cookie : cookies) {
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }

    response.sendRedirect("index.jsp");
%>