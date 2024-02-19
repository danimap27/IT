<%-- 
    Document   : redirectAction
    Created on : 19-feb-2024, 9:51:53
    Author     : danit
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Redirect Action</title>
    </head>
    <body>
        <%
            String option = request.getParameter("option");
            String redirectPage = "redirectedPage.jsp";
            request.setAttribute("option", option);
            response.sendRedirect(redirectPage);
        %>
    </body>
</html>


