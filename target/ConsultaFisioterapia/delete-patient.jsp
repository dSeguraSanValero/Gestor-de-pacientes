<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddPacienteServlet" %>
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
    <title>Delete-patient</title>
</head>
<body>
    <p>¿Está seguro de querer eliminar el paciente?</p>
    <form action="delete-paciente" method="post">
           <input type="hidden" id="patientId" name="patientId" value="<%= patientId %>">
           <input type="submit" value="Eliminar">
    </form>
</body>
</html>