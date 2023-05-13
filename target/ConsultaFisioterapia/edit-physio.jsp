<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.EditPacienteServlet" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>

<%
    String physioId = request.getParameter("physioId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http.equiv="Content-Type">
    <meta content="text/html">
    <meta charset="UTF-8">
    <title>Edit-fisioterapeuta</title>
</head>
<body>
    <form action="edit-fisioterapeuta" method="post">
        <label for="nuevoNombre">Nuevo nombre del paciente:</label>
        <input type="text" id="nuevoNombre" name="nuevoNombre"><br>
        <label for="nuevoApellido">Nuevo nombre del paciente:</label>
        <input type="text" id="nuevoApellido" name="nuevoApellido"><br>
        <input type="hidden" id="physioId" name="physioId" value="<%= physioId %>">
        <input type="submit" value="Registrar">
    </form>
</body>
</html>