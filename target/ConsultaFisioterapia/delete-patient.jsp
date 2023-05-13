<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.Aplicacion" %>
<%@ page import = "com.svalero.centroFisioterapia.Menu" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddPacienteServlet" %>

<%
    String patientId = request.getParameter("patientId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
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