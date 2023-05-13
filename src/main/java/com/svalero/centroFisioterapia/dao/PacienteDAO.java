package com.svalero.centroFisioterapia.dao;

import com.svalero.centroFisioterapia.paciente.Paciente;
import com.svalero.centroFisioterapia.util.DateUtils;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class PacienteDAO {
    private Connection connection;

    public PacienteDAO(Connection connection) {
        this.connection = connection;
    }

    public void registrarPaciente(Paciente paciente) throws SQLException {
        String sql = "INSERT INTO PACIENTES (id, nombre, apellido, fechaNacimiento, telefono) VALUES(?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, paciente.getId());
        statement.setString(2, paciente.getNombre());
        statement.setString(3, paciente.getApellidos());
        statement.setDate(4, DateUtils.toDate(paciente.getFechaNacimiento()));
        statement.setInt(5, paciente.getTelefono());
        statement.executeUpdate();
    }


    public void modificarPaciente(Paciente paciente) throws SQLException {

    }

    public List<Paciente> verTodosPacientes() throws SQLException {
        String sql = "SELECT * FROM PACIENTES";

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        return getList(resultSet);
    }

    public boolean borrarPaciente(String nombre) throws SQLException {
        String sql = "DELETE FROM PACIENTES WHERE nombre = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombre);
        return statement.executeUpdate() != 0;
    }

    public List<Paciente> getList(ResultSet resultSet) throws SQLException {
        List<Paciente> pacientes = new ArrayList<>();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String nombre = resultSet.getString("nombre");
            String apellido = resultSet.getString("apellido");
            LocalDate fechaNacimiento = resultSet.getDate("fechaNacimiento").toLocalDate();
            int telefono = resultSet.getInt("telefono");

            Paciente paciente = new Paciente(id, nombre, apellido, fechaNacimiento, telefono);
            pacientes.add(paciente);
        }

        return pacientes;
    }



}
