package com.svalero.centroFisioterapia.tratamientos;

import java.time.LocalDate;

public class Tratamiento {


    private String id_fisioterapeuta;

    private String id_paciente;

    private String motivo;

    private LocalDate fechaTratamiento;


    public Tratamiento(String id_paciente, String motivo, LocalDate fechaTratamiento) {
        this.id_paciente = id_paciente;
        this.motivo = motivo;
        this.fechaTratamiento = fechaTratamiento;
    }

    public Tratamiento(String IdFisioterapeutaHTML, String IdPacienteHTML, LocalDate fechaTratamiento, String motivoHTML) {
        this.id_fisioterapeuta = IdFisioterapeutaHTML;
        this.id_paciente = IdPacienteHTML;
        this.fechaTratamiento = fechaTratamiento;
        this.motivo = motivoHTML;
    }

    public Tratamiento(String id_paciente, LocalDate fechaTratamiento, String motivo) {
        this.id_paciente = id_paciente;
        this.fechaTratamiento = fechaTratamiento;
        this.motivo = motivo;
    }


    public String getId_fisioterapeuta() {
        return id_fisioterapeuta;
    }

    public void setId_fisioterapeuta(String id_fisioterapeuta) {
        this.id_fisioterapeuta = id_fisioterapeuta;
    }

    public String getId_paciente() {
        return id_paciente;
    }

    public void setId_paciente(String id_paciente) {
        this.id_paciente = id_paciente;
    }


    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public LocalDate getFechaTratamiento() {
        return fechaTratamiento;
    }

    public void setFechaTratamiento(LocalDate fechaTratamiento) {
        this.fechaTratamiento = fechaTratamiento;
    }
}
