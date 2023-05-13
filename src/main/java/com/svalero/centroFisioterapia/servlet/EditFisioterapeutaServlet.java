package com.svalero.centroFisioterapia.servlet;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.FisioterapeutaDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;


@WebServlet("/edit-fisioterapeuta")
public class EditFisioterapeutaServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String nuevoNombre = request.getParameter("nuevoNombre");
        String nuevoApellido = request.getParameter("nuevoApellido");
        String physioId = request.getParameter("physioId");

        database = new Database();
        connection = database.getConnection();

        FisioterapeutaDAO FisioterapeutaDAO = new FisioterapeutaDAO(connection);

        try {
            FisioterapeutaDAO.editarFisioterapeuta(nuevoNombre, nuevoApellido, physioId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        out.println("Fisioterapeuta modificado con éxito");

    }
}