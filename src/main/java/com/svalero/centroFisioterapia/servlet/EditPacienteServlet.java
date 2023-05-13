package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.PacienteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/edit-paciente")
public class EditPacienteServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int nuevoTelefono = Integer.parseInt(request.getParameter("nuevoTelefono"));
        String patientId = request.getParameter("patientId");

        database = new Database();
        connection = database.getConnection();

        PacienteDAO pacienteDAO = new PacienteDAO(connection);

        try {
            pacienteDAO.editarTelefonoPaciente(nuevoTelefono, patientId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        out.println("Teléfono del paciente modificado con éxito");

    }
}