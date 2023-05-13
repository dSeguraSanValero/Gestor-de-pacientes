package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.TratamientoDAO;
import com.svalero.centroFisioterapia.tratamientos.Tratamiento;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/add-treatment")

public class AddTratamientoServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String motivoHTML = request.getParameter("motivo");
        String IdFisioterapeutaHTML = request.getParameter("physioId");
        LocalDate fechaTratamiento = LocalDate.parse(request.getParameter("fechaTratamiento"));
        String Id_paciente = request.getParameter("IdPaciente");

        database = new Database();
        connection = database.getConnection();

        Tratamiento tratamiento = new Tratamiento(IdFisioterapeutaHTML, Id_paciente, fechaTratamiento, motivoHTML);
        System.out.println(tratamiento);

        try {
            TratamientoDAO tratamientoDAO = new TratamientoDAO(connection);
            tratamientoDAO.registrarTratamiento(tratamiento);
            out.println("Tratamiento registrado correctamente");
        } catch (SQLException sqle) {
            out.println("Fallo de conexión con la base de datos. No se ha podido buscar el paciente.");
            sqle.printStackTrace();
        } finally {
            database.closeConnection(connection);
        }
    }

}