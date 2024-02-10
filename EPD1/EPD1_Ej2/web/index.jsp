<%-- 
    Document   : index
    Created on : 05-feb-2024, 16:43:21
    Author     : eps
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int[] razon = new int[3];
            razon[0] = 2;
            razon[1] = 3;
            razon[2] = 5;
            for (int r = 0; r < razon.length; r++) {
        %>
        <table border="1">
            <th>Razon <%=razon[r]%></th>
            <tr>
                <td>valor</td>
                <td>diferencia</td>
            </tr>
            <%
            int i = 1;
            int j;
            int d = 0;
            while(i < 100){
               %>
               <tr>
                   <td><%=i%></td>
                   <td><%=d%></td>
               </tr>
          <%
                j = i;
                i *= razon[r];
                d = i-j;
                
            }
            
            
            %>
        </table>
        <%}%>
    </body>
</html>
