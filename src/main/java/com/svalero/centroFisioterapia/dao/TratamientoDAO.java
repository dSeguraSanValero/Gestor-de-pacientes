package com.svalero.centroFisioterapia.dao;

import com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta;
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

public class TratamientoDAO {
    private Connection connection;

    public TratamientoDAO(Connection connection) {
        this.connection = connection;
    }

    public void registrarTratamiento(Tratamiento tratamiento) throws SQLException {
        String sql = "INSERT INTO TRATAMIENTOS (ID_FISIOTERAPEUTA, ID_PACIENTE, FECHA_DE_TRATAMIENTO, MOTIVO) VALUES(?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, tratamiento.getId_fisioterapeuta());
        statement.setString(2, tratamiento.getId_paciente());
        statement.setDate(3, DateUtils.toDate(tratamiento.getFechaTratamiento()));
        statement.setString(4, tratamiento.getMotivo());
        statement.executeUpdate();
    }


}