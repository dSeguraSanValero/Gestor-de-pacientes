<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.Aplicacion" %>
<%@ page import = "com.svalero.centroFisioterapia.Menu" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddPacienteServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add-patient</title>
</head>
<body>
    <form action="add-paciente" method="post">
       <label for="nombre">Introduzca el nombre del paciente:</label>
       <input type="text" id="nombre" name="nombre"><br>
       <label for="apellido">Introduzca el apellido:</label>
       <input type="text" id="apellido" name="apellido"><br>
       <label for="fechaNacimiento">Introduzca la fecha de nacimiento del paciente (dd.MM.yyyy):</label>
       <input type="date" id="fechaNacimiento" name="fechaNacimiento"><br>
       <label for="telefono">Introduzca el numero de telefono del paciente:</label>
       <input type="text" id="telefono" name="telefono"><br>
       <input type="submit" value="Registrar">
    </form>
</body>
</html>