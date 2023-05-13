package com.svalero.centroFisioterapia;

import com.svalero.centroFisioterapia.dao.Database;
import com.svalero.centroFisioterapia.dao.PacienteDAO;
import com.svalero.centroFisioterapia.paciente.Paciente;

import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.UUID;

public class Menu {
    private Scanner teclado;
    private Database database;
    private Connection connection;
    private boolean salir;

    private ArrayList<Paciente> pacientes;


    public Menu() {
        teclado = new Scanner(System.in);
        salir = false;
        database = new Database();
        connection = database.getConnection();

    }

    public void mostrarMenu() {
        do {
            System.out.println("Menú");
            System.out.println("");
            System.out.println("Pulse 1 para registrar un paciente");
            System.out.println("Pulse 2 para buscar un paciente por su nombre y apellido");
            System.out.println("Pulse 3 para listar todos los pacientes");
            System.out.println("Pulse 4 para borrar un paciente");
            System.out.println("Pulse X para salir del menú");
            String opcion = teclado.nextLine();

            switch (opcion) {
                case "1":
                    registrarPaciente();
                    break;
                case "2":

                case "3":
                    verTodosPacientes();
                    break;
                case "4":
                    borrarPaciente();
                    break;
                case "x":
                    salir();
                    database.closeConnection();
                    break;
                default:
                    System.out.println("Error");
            }
        } while (!salir);
    }

    private void registrarPaciente() {
        System.out.println("Introduzca el nombre del paciente");
        String nombre = teclado.nextLine();
        System.out.println("Introduzca el apellido");
        String apellido = teclado.nextLine();
        System.out.print("Introduzca la fecha de nacimiento del paciente (dd.MM.yyyy): ");
        String fechaString = teclado.nextLine();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");
        LocalDate fechaNacimiento = LocalDate.parse(fechaString, formatter);
        System.out.println("Introduzca el número de teléfono del paciente");
        int telefono = Integer.parseInt(teclado.nextLine());

        UUID uuid = UUID.randomUUID();
        String id = uuid.toString();

        Paciente paciente = new Paciente(id, nombre, apellido, fechaNacimiento, telefono);
        try {
            PacienteDAO pacienteDAO = new PacienteDAO(connection);
            pacienteDAO.registrarPaciente(paciente);
        } catch (SQLException sqle) {
            System.out.println("Fallo de conexión con la base de datos");
            sqle.printStackTrace();
        }
        System.out.println("Cliente registrado correctamente");
    }



    private void borrarPaciente() {
        System.out.print("Nombre del paciente que deseas borrar: ");
        String nombre = teclado.nextLine();

        PacienteDAO pacienteDAO = new PacienteDAO(connection);
        try {
            boolean deleted = pacienteDAO.borrarPaciente(nombre);
            if (deleted)
                System.out.println("Paciente dado de baja correctamente");
            else
                System.out.println("Paciente no encontrado");
        } catch (SQLException sqle) {
            System.out.println("Fallo de conexión con la base de datos");
            sqle.printStackTrace();
        }
    }

    private void verTodosPacientes() {
        PacienteDAO pacienteDAO = new PacienteDAO(connection);
        try {
            List<Paciente> pacienteList = pacienteDAO.verTodosPacientes();
            pacienteList.forEach(System.out::println);
        } catch (SQLException sqle) {
            System.out.println("Fallo de conexión con la base de datos");
            sqle.printStackTrace();
        }
    }


    private void salir() {
        salir = true;
    }


}
