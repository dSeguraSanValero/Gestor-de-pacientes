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
    <form action="/consultaFisioterapia/patient-searched.jsp" method="post">
       <label for="nombre">Introduzca el nombre del paciente a buscar:</label>
       <input type="text" id="nombreBuscado" name="nombreBuscado"><br>
       <label for="apellido">Introduzca el apellido del paciente a buscar:</label>
       <input type="text" id="apellidoBuscado" name="apellidoBuscado"><br>
       <input type="submit" value="Buscar">
    </form>
</body>
</html>