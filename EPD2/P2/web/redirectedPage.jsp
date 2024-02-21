<%-- 
    Document   : redirectedPage
    Created on : 19-feb-2024, 9:52:23
    Author     : danit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Redirected Page</title>
    </head>
    <body>
        <%
            String option = (String) request.getParameter("option");
            String url = "";
            if (option != null) {
                switch (option) {
                    case "request":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpServletRequest.html";
                        break;
                    case "out":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/jsp/JspWriter.html";
                        break;
                    case "response":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpServletResponse.html";
                        break;
                    case "config":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/ServletConfig.html";
                        break;
                    case "application":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/ServletContext.html";
                        break;
                    case "session":
                        url = "https://docs.oracle.com/javaee/5/api/javax/servlet/http/HttpSession.html";
                        break;
                }
                response.sendRedirect(url);
            } else {
        %>
        <p>Error: opción no válida</p>
        <%
            }
        %>
    </body>
</html>

