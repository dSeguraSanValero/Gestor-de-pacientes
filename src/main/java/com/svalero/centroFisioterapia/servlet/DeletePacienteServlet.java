package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.PacienteDAO;
import com.svalero.centroFisioterapia.paciente.Paciente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.SneakyThrows;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.UUID;

@WebServlet("/delete-paciente")
public class DeletePacienteServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String idHTML = request.getParameter("patientId");

        database = new Database();
        connection = database.getConnection();


        PacienteDAO pacienteDAO = new PacienteDAO(connection);

        try {
            pacienteDAO.borrarPacientePorId(idHTML);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        out.println("Paciente eliminado con éxito");

    }
}

