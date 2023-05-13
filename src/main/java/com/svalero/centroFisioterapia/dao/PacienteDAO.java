package com.svalero.centroFisioterapia.dao;

import com.svalero.centroFisioterapia.paciente.Paciente;
import com.svalero.centroFisioterapia.tratamientos.Tratamiento;
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
        String sql = "INSERT INTO PACIENTES (ID_PACIENTE, NOMBRE, APELLIDO, FECHA_DE_NACIMIENTO, TELEFONO) VALUES(?, ?, ?, ?, ?)";
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

    public Paciente getPacientePorId(String idPaciente) throws SQLException {
        String sql = "SELECT ID_PACIENTE, NOMBRE, APELLIDO, FECHA_DE_NACIMIENTO, TELEFONO FROM PACIENTES WHERE ID_PACIENTE = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, idPaciente);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            Paciente paciente = new Paciente(result.getString("ID_PACIENTE"),
                    result.getString("NOMBRE"),
                    result.getString("APELLIDO"),
                    DateUtils.toLocalDate(result.getDate("FECHA_DE_NACIMIENTO")),
                    result.getInt("TELEFONO"));

            paciente.setId(result.getString("ID_PACIENTE"));
            paciente.setNombre(result.getString("NOMBRE"));
            paciente.setApellidos(result.getString("APELLIDO"));
            paciente.setFechaNacimiento(DateUtils.toLocalDate(result.getDate("FECHA_DE_NACIMIENTO")));
            paciente.setTelefono(result.getInt("TELEFONO"));
            return paciente;
        } else {
            return null;
        }
    }

    public Paciente getPacientePorNombre(String nombreBuscado, String apellidoBuscado) throws SQLException {
        String sql = "SELECT ID_PACIENTE, NOMBRE, APELLIDO, FECHA_DE_NACIMIENTO, TELEFONO FROM PACIENTES WHERE NOMBRE = ? AND APELLIDO = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombreBuscado);
        statement.setString(2, apellidoBuscado);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            Paciente paciente = new Paciente(result.getString("ID_PACIENTE"),
                    result.getString("NOMBRE"),
                    result.getString("APELLIDO"),
                    DateUtils.toLocalDate(result.getDate("FECHA_DE_NACIMIENTO")),
                    result.getInt("TELEFONO"));

            paciente.setId(result.getString("ID_PACIENTE"));
            paciente.setNombre(result.getString("NOMBRE"));
            paciente.setApellidos(result.getString("APELLIDO"));
            paciente.setFechaNacimiento(DateUtils.toLocalDate(result.getDate("FECHA_DE_NACIMIENTO")));
            paciente.setTelefono(result.getInt("TELEFONO"));
            return paciente;
        } else {
            return null;
        }
    }

    public Paciente getIdPacientePorNombre(String nombreBuscado, String apellidoBuscado) throws SQLException {
        String sql = "SELECT ID_PACIENTE FROM PACIENTES WHERE NOMBRE = ? AND APELLIDO = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombreBuscado);
        statement.setString(2, apellidoBuscado);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            Paciente paciente = new Paciente(result.getString("ID_PACIENTE"));

            paciente.setId(result.getString("ID_PACIENTE"));
            return paciente;
        } else {
            return null;
        }
    }


    public boolean editarPaciente(int nuevoTelefono, String nuevoNombre, String nuevoApellido, String patientId) throws SQLException {
        String sql = "UPDATE PACIENTES SET TELEFONO = ?, NOMBRE = ?, APELLIDO = ? WHERE ID_PACIENTE = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, nuevoTelefono);
        statement.setString(2, nuevoNombre);
        statement.setString(3, nuevoApellido);
        statement.setString(4, patientId);
        return statement.executeUpdate() != 0;
    }


    public List<Paciente> verTodosPacientes() throws SQLException {
        String sql = "SELECT * FROM PACIENTES";

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        return getList(resultSet);
    }


    public boolean borrarPaciente(String nombre) throws SQLException {
        String sql = "DELETE FROM PACIENTES WHERE NOMBRE = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombre);
        return statement.executeUpdate() != 0;
    }

    public boolean borrarPacientePorId(String patientId) throws SQLException {
        String sql = "DELETE FROM PACIENTES WHERE ID_PACIENTE = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, patientId);
        return statement.executeUpdate() != 0;
    }

    public List<Paciente> getList(ResultSet resultSet) throws SQLException {
        List<Paciente> pacientes = new ArrayList<>();

        while (resultSet.next()) {
            String id = resultSet.getString("ID_PACIENTE");
            String nombre = resultSet.getString("NOMBRE");
            String apellido = resultSet.getString("APELLIDO");
            LocalDate fechaNacimiento = resultSet.getDate("FECHA_DE_NACIMIENTO").toLocalDate();
            int telefono = resultSet.getInt("TELEFONO");

            Paciente paciente = new Paciente(id, nombre, apellido, fechaNacimiento, telefono);
            pacientes.add(paciente);
        }

        return pacientes;
    }

}
