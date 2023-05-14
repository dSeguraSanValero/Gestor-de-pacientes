package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.PacienteDAO;
import com.svalero.centroFisioterapia.paciente.Paciente;
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
import java.util.UUID;

@WebServlet("/add-paciente")

public class AddPacienteServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String nombreHTML = request.getParameter("nombre");
        String apellidoHTML = request.getParameter("apellido");
        LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));
        int telefonoHTML = Integer.parseInt(request.getParameter("telefono"));

        System.out.println(fechaNacimiento);

        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();


        database = new Database();
        connection = database.getConnection();

        Paciente paciente = new Paciente(id, nombreHTML, apellidoHTML, fechaNacimiento, telefonoHTML);
        try {
            PacienteDAO pacienteDAO = new PacienteDAO(connection);
            pacienteDAO.registrarPaciente(paciente);
        } catch (SQLException sqle) {
            out.println("Fallo de conexión con la base de datos. No se ha ");
            sqle.printStackTrace();
        }
        out.println("Registrado correctamente");

        }
    }




