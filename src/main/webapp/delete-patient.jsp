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
    <title>search-physio</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
        }

        h5 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-top: 30px;
            margin-bottom: 15px;
            margin-left: 25px
        }

        p {
            font-size: 16px;
            color: #666;
            margin: 10px 0;
            margin-left: 25px
        }

    </style>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

</head>
<body>
    <p>¿Está seguro de querer eliminar el paciente?</p>
    <form action="delete-paciente" method="post">
           <input type="hidden" id="patientId" name="patientId" value="<%= patientId %>">
           <input type="submit" value="Eliminar">
    </form>
</body>
</html>