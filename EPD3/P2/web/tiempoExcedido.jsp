<%-- 
    Document   : tiempoExcedido
    Created on : 24-feb-2024, 21:40:02
    Author     : Dani
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="" method="post">
            <input type="submit" name="mostrarTodos" value="Mostrar Todos"> 
            <input type="submit" name="mostrarExcedidos" value="Mostrar Excedidos">
        </form>
         <%
            class Coche {

                private String matricula;
                private String modelo;
                private Date horaEntrada;
                private Date horaSalida;
                private int tiempoPermitido;

                public Coche(String matricula, String modelo, Date horaEntrada, Date horaSalida, int tiempoPermitido) {
                    this.matricula = matricula;
                    this.modelo = modelo;
                    this.horaEntrada = horaEntrada;
                    this.horaSalida = horaSalida;
                    this.tiempoPermitido = tiempoPermitido;
                }

                public String getMatricula() {
                    return matricula;
                }

                public String getModelo() {
                    return modelo;
                }

                public Date getHoraEntrada() {
                    return horaEntrada;
                }

                public Date getHoraSalida() {
                    return horaSalida;
                }

                public int getTiempoPermitido() {
                    return tiempoPermitido;
                }

            }
            List<Coche>  listaCoches = null;
            if(request.getParameter("mostrarExcedidos") != null){
                listaCoches = (list<Coche>)request.getParameter("Exedidos");
            }else{
                listaCoches = (list<Coche>)request.getParameter("NoExedidos");
            }
         %>
        <table border="1">
            <tr>
                <th>Matrícula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>
            </tr>
            <%
                for (Coche coche : listaCoches) {
            %>
            <tr>
                <td><%= coche.getMatricula()%></td>
                <td><%= coche.getModelo()%></td>
                <td><%= coche.getHoraEntrada()%></td>
                <td><%= coche.getHoraSalida() != null ? coche.getHoraSalida() : "--"%></td>
                <td><%= coche.getTiempoPermitido()%></td>
            </tr>
            <%
                }
            %>
    </body>
</html>
