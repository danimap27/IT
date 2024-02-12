<%-- 
    Document   : procesar_formulario
    Created on : 09-feb-2024, 21:40:49
    Author     : danit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!int NOTA_MIN = 4;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            table {
                width: 60%;
                border: 1px solid #ddd;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: center;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:nth-child(even) {
                background-color: #f9f9f9;
            }
        </style>             

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Resultado formulario</h1>
        <%
            // Imprimir los resultados
            out.write("<p>Nombre: " + request.getParameter("nombre") + "</p>");
            out.write("<p>Apellido: " + request.getParameter("apellido") + "</p>");
            out.write("<p>Email: " + request.getParameter("email") + "</p>");
            out.write("<p>Ha estudiado antes IT?: " + request.getParameter("it_previo") + "</p>");
            // Comparar si ha respondido que si o que no
            if (request.getParameter("it_previo").equals("si")) {
                out.write("<p>En caso afirmativo, indicar el o los bloques que encontró más difíciles: " + request.getParameter("it_previo_si") + "</p>");
            } else {
                out.write("<p>En caso negativo, indicar qué nota espera obtener en la asignatura: " + request.getParameter("it_previo_no") + "</p>");
            }
            float sobre10 = (Float.parseFloat(request.getParameter("b1")) + Float.parseFloat(request.getParameter("b2")) + Float.parseFloat(request.getParameter("b3"))) / 3;
            float b1 = Float.parseFloat(request.getParameter("b1")) ;
            float b2 = Float.parseFloat(request.getParameter("b2"));
            float b3 = Float.parseFloat(request.getParameter("b3"));
            float sobre8 = b1* (float) 0.3 + b2 * (float) 0.3 + b3 * (float) 0.2;
            float trabajo = Float.parseFloat(request.getParameter("trabajo")) * (float) 0.2;
            float notaFinal = sobre8 + trabajo;
            
            // Inicializar el string el cual mandaremos como carta
            String carta = "Hola " + request.getParameter("nombre");
            
            // Vector para los bloques que hay que recuperar
            int [] v = new int[4];
            v[0] = 0;
            v[1] = 0;
            v[2] = 0;
            v[3] = 0;
            boolean minimo = true;
            if (NOTA_MIN < b1){
                v[0] = 1;
                minimo = false;
            }
            if (NOTA_MIN < b2){
                v[1] = 1; 
                minimo = false;
            }            
            if (NOTA_MIN < b3){
                v[2] = 1;
                minimo = false;
            }
            if (NOTA_MIN < sobre8){
                v[3] = 1;
                minimo = false;
            }
            if (minimo && notaFinal >= 5){
                carta += " has aprobado la asignatura Integracion de tecnologias con un "+ notaFinal+ ". Enhorabuena!!";
            }else if (minimo){
                carta += " has suspendido la asignatura Integracion de tecnologias con un " + notaFinal + " aunque no hay ningun bloque que tengas menos del minimo";
                
            }else {
                carta += " has suspendido la asignatura Integracion de tecnologias ya que no has llegado al minimo en:";
                for(int i = 0; i < 3; i++){
                    if(v[i] == 1)
                        carta += " Bloque " + i;
                }
                if(v[3] == 1){
                    carta += " Minimo 4 sobre 8 en los bloques";
                }
            }
            
        %>
        <h2>Tabla de cuanto vale cada parte</h2>
        <table>
            <caption></caption>
            <thead>
                <tr>
                    <th>Pesos de cada apartado</th>
                    <th>Rendimiento individual</th>
                    <th>Rendimiento grupal</th>
                </tr>
                <tr>
                    <th>Bloques</th>
                    <th>Pruebas EPD</th>
                    <th>Proyecto</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>B1</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>B2</td>
                    <td>3</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>B3</td>
                    <td>2</td>
                </tr>
                <tr>
                    <th>Total</th>
                    <th>8</th>
                    <th>2</th>
                </tr>
            </tbody>
        </table>
        <h2>Tabla con tus notas</h2>
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>Rendimiento individua</th>
                    <th>Rendimiento grupa</th>
                    <th></th>
                </tr>
                <tr>
                    <th>Bloques</th>
                    <th>Pruebas EPD (sobre 10)</th>
                    <th>Proyecto (sobre 10)</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>B1</td>
                    <td><%=request.getParameter("b1")%></td>
                    <td></td>
                    <th></th>
                </tr>
                <tr>
                    <td>B2</td>
                    <td><%=request.getParameter("b2")%></td>
                    <td><%=request.getParameter("trabajo")%></td>
                    <th>Nota final</th>
                </tr>
                <tr>
                    <td>B3</td>
                    <td><%=request.getParameter("b3")%></td>
                    <td></td>
                    <th></th>
                </tr>
                <tr>
                    <td></td>
                    <th>Nota total sobre 8</th>
                    <th>Nota total sobre 2</th>
                    <th></th>
                </tr>
                <tr>
                    <td></td>
                    <td><%=sobre8%></td>
                    <td><%=trabajo%></td>
                    <td><%=notaFinal%></td>
                </tr>
                <tr>
                    <td></td>
                    <th>Nota sobre 10</th>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><%=sobre10%></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <h2>Generar carta</h2>
        <form action="carta.jsp" method="post">
            <input type="hidden" name="carta" value=<%carta;%>>
            <input type="submit" value="Crear">
        </form>
    </body>
</html>
