package com.svalero.centroFisioterapia.fisioterapeuta;


public class Fisioterapeuta {

    private String id;

    private String nombre;

    private String idConsulta;

    private String apellido;

    public Fisioterapeuta(String id, String idConsulta, String nombre, String apellido) {
        this.id = id;
        this.idConsulta = idConsulta;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdConsulta() {
        return idConsulta;
    }

    public void setIdConsulta(String idConsulta) {
        this.idConsulta = idConsulta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellido;
    }

    public void setApellidos(String apellido) {
        this.apellido = apellido;
    }



    @Override
    public String toString() {
        return "Nombre: " + nombre + ", Apellido: " + apellido + ", ID Consulta: " + idConsulta;
    }

}