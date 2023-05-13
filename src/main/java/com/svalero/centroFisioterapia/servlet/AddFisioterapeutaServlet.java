package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.FisioterapeutaDAO;
import com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/add-physio")

public class AddFisioterapeutaServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String idConsultaHTML = request.getParameter("idConsulta");
        String nombreHTML = request.getParameter("nombre");
        String apellidoHTML = request.getParameter("apellido");

        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();


        database = new Database();
        connection = database.getConnection();

        Fisioterapeuta fisioterapeuta = new Fisioterapeuta(id, idConsultaHTML, nombreHTML, apellidoHTML);
        try {
            FisioterapeutaDAO fisioterapeutaDAO = new FisioterapeutaDAO(connection);
            fisioterapeutaDAO.registrarFisio(fisioterapeuta);
        } catch (SQLException sqle) {
            out.println("Fallo de conexión con la base de datos. No se ha ");
            sqle.printStackTrace();
        }
        out.println("Registrado correctamente");

    }

}
