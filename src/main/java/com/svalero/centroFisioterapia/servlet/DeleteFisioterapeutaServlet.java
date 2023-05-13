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


@WebServlet("/delete-fisio")
public class DeleteFisioterapeutaServlet extends HttpServlet {

    private Database database;
    private Connection connection;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String idHTML = request.getParameter("physioId");

        database = new Database();
        connection = database.getConnection();


        FisioterapeutaDAO fisioterapeutaDAO = new FisioterapeutaDAO(connection);

        try {
            fisioterapeutaDAO.borrarFisioPorId(idHTML);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        out.println("Fisioterapeuta eliminado con éxito");

    }
}