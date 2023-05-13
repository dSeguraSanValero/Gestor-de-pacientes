package com.svalero.centroFisioterapia.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {

    private Connection connection;


    public Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "DSEGURA", "1234");
            System.out.println("Conectado!");
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
            System.out.println("Driver no encontrado");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            System.out.println("Fallo no encontrado");
        }
        return connection;
    }

    public void closeConnection() {
        try {
           connection.close();
            System.out.println("Desconectado!");
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            System.out.println("Fallo de conexión!");
        }
    }
}
