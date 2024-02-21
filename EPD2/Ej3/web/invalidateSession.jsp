<%-- 
    Document   : invalidateSession
    Created on : 21-feb-2024, 17:04:59
    Author     : Dani
--%>

<%@ page import="javax.servlet.http.HttpSession" %>

<%
    session = request.getSession();
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

