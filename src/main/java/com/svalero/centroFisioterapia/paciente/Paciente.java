package com.svalero.centroFisioterapia.paciente;

import java.time.LocalDate;




public class Paciente {

    private String id;

    private String nombre;

    private String apellido;

    private LocalDate fechaNacimiento;

    private int telefono;

    public Paciente(String id, String nombre, String apellido, LocalDate fechaNacimiento, int telefono) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaNacimiento = fechaNacimiento;
        this.telefono = telefono;
    }

    public Paciente(int id, String nombre, String apellido, int telefono) {

    }

    public Paciente(String id, String nombreHTML, String apellidoHTML, String fechaStringHTML, int telefonoHTML) {
    }

    public Paciente(String id, String nombre) {

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getNombreApellidos() {
        return nombre + " " + apellido;
    }

    @Override
    public String toString() {
        return "Nombre: " + nombre + ", Apellido: " + apellido + ", Teléfono: " + telefono + ", Fecha de nacimiento: " + fechaNacimiento;
    }

}

