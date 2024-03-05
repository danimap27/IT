<%-- 
    Document   : index
    Created on : 24-feb-2024, 21:13:42
    Author     : Dani
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<html>
    <head>
        <title>EPD3 P1</title>
    </head>
    <body>
        <h2>Lista de Vehículos Registrados</h2>
        <table border="1">
            <tr>
                <th>Matrícula</th>
                <th>Modelo</th>
                <th>Hora de entrada</th>
                <th>Hora de salida</th>
                <th>Tiempo permitido</th>
            </tr>
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
                SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm");

                List<Coche> listaCoches = new ArrayList<>();
                listaCoches.add(new Coche("12784HIH", "BMW", dateFormat.parse("10:05"), null, 30));
                listaCoches.add(new Coche("76234AAC", "Toyota", dateFormat.parse("10:07"), dateFormat.parse("10:35"), 30));
                listaCoches.add(new Coche("32162BAQ", "Audi", dateFormat.parse("10:45"), null, 90));
                listaCoches.add(new Coche("87823CDA", "Mercedes", dateFormat.parse("10:46"), dateFormat.parse("11:05"), 15));

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
        </table>
    </body>
</html>

