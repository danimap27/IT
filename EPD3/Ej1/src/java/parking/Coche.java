/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parking;

import java.util.Date;

/**
 *
 * @author Dani
 */
public class Coche {
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

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Date getHoraEntrada() {
        return horaEntrada;
    }

    public void setHoraEntrada(Date horaEntrada) {
        this.horaEntrada = horaEntrada;
    }

    public Date getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(Date horaSalida) {
        this.horaSalida = horaSalida;
    }

    public int getTiempoPermitido() {
        return tiempoPermitido;
    }

    public void setTiempoPermitido(int tiempoPermitido) {
        this.tiempoPermitido = tiempoPermitido;
    }

    @Override
    public String toString() {
        return "coche{" + "matricula=" + matricula + ", modelo=" + modelo + ", horaEntrada=" + horaEntrada + ", horaSalida=" + horaSalida + ", tiempoPermitido=" + tiempoPermitido + '}';
    }
    

}
