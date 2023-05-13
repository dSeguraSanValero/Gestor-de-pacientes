<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.EditPacienteServlet" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>

<%
    String patientId = request.getParameter("patientId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http.equiv="Content-Type">
    <meta content="text/html">
    <meta charset="UTF-8">
    <title>Edit-paciente</title>
</head>
<body>
    <form action="edit-paciente" method="post">
        <label for="nuevoTelefono">Nuevo numero de telefono del paciente:</label>
        <input type="text" id="nuevoTelefono" name="nuevoTelefono"><br>
        <label for="nuevoNombre">Nuevo nombre del paciente:</label>
        <input type="text" id="nuevoNombre" name="nuevoNombre"><br>
        <label for="nuevoApellido">Nuevo nombre del paciente:</label>
        <input type="text" id="nuevoApellido" name="nuevoApellido"><br>
        <input type="hidden" id="patientId" name="patientId" value="<%= patientId %>">
        <input type="submit" value="Registrar">
    </form>
</body>
</html>