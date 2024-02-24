<%-- 
    Document   : logout
    Created on : 21-feb-2024, 12:24:05
    Author     : danit
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%

    HttpSession s = request.getSession();
    s.invalidate();
    response.sendRedirect("index.jsp");
%>