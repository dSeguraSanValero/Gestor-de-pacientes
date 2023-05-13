package com.svalero.centroFisioterapia.dao;


import com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta;
import com.svalero.centroFisioterapia.paciente.Paciente;
import com.svalero.centroFisioterapia.util.DateUtils;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FisioterapeutaDAO {
    private Connection connection;

    public FisioterapeutaDAO(Connection connection) {
        this.connection = connection;
    }

    public void registrarFisio(Fisioterapeuta fisioterapeuta) throws SQLException {
        String sql = "INSERT INTO FISIOTERAPEUTAS (ID_FISIOTERAPEUTA, ID_CONSULTA, NOMBRE, APELLIDO) VALUES(?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, fisioterapeuta.getId());
        statement.setString(2, fisioterapeuta.getIdConsulta());
        statement.setString(3, fisioterapeuta.getNombre());
        statement.setString(4, fisioterapeuta.getApellidos());
        statement.executeUpdate();
    }


    public void modificarFisio(Fisioterapeuta fisioterapeuta) throws SQLException {
    }

    public Fisioterapeuta getFisioterapeutaPorId(String idFisioterapeuta) throws SQLException {
        String sql = "SELECT ID_FISIOTERAPEUTA, ID_CONSULTA, NOMBRE, APELLIDO FROM FISIOTERAPEUTAS WHERE ID_FISIOTERAPEUTA = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, idFisioterapeuta);
        ResultSet result = statement.executeQuery();

        if (result.next()) {
            Fisioterapeuta fisioterapeuta = new Fisioterapeuta(result.getString("ID_FISIOTERAPEUTA"),
                    result.getString("ID_CONSULTA"),
                    result.getString("NOMBRE"),
                    result.getString("APELLIDO"));

            fisioterapeuta.setId(result.getString("ID_FISIOTERAPEUTA"));
            fisioterapeuta.setIdConsulta(result.getString("ID_CONSULTA"));
            fisioterapeuta.setNombre(result.getString("NOMBRE"));
            fisioterapeuta.setApellidos(result.getString("APELLIDO"));
            return fisioterapeuta;
        } else {
            return null;
        }
    }

    public List<Fisioterapeuta> verTodosFisios() throws SQLException {
        String sql = "SELECT * FROM FISIOTERAPEUTAS";

        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        return getList(resultSet);
    }

    public boolean borrarFisio(String nombre) throws SQLException {
        String sql = "DELETE FROM FISIOTERAPEUTAS WHERE NOMBRE = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombre);
        return statement.executeUpdate() != 0;
    }

    public boolean borrarFisioPorId(String physioId) throws SQLException {
        String sql = "DELETE FROM FISIOTERAPEUTAS WHERE ID_FISIOTERAPEUTA = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, physioId);
        return statement.executeUpdate() != 0;
    }

    public List<Fisioterapeuta> getList(ResultSet resultSet) throws SQLException {
        List<Fisioterapeuta> fisioterapeutas = new ArrayList<>();

        while (resultSet.next()) {
            String id = resultSet.getString("ID_FISIOTERAPEUTA");
            String idConsulta = resultSet.getString("ID_CONSULTA");
            String nombre = resultSet.getString("NOMBRE");
            String apellido = resultSet.getString("APELLIDO");

            Fisioterapeuta fisioterapeuta = new Fisioterapeuta(id, idConsulta, nombre, apellido);
            fisioterapeutas.add(fisioterapeuta);
        }

        return fisioterapeutas;
    }

}