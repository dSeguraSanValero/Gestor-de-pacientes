<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
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
    <title>add-treatment</title>
</head>
<body>
    <form action="add-treatment" method="post">
       <label for="fechaTratamiento">Introduzca la fecha de tratamiento:</label>
       <input type="date" id="fechaTratamiento" name="fechaTratamiento"><br>
       <label for="motivo">Introduzca el motivo:</label>
       <input type="text" id="motivo" name="motivo"><br>
       <label for="IdIntroducido">Introduzca el ID del paciente:</label>
       <input type="text" id="IdPaciente" name="IdPaciente"><br>
       <input type="hidden" name="physioId" value="<%= physioId %>">
       <input type="submit" value="Registrar">
    </form>

</body>
</html>