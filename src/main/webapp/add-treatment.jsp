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

        label {

            font-size: 16px;
            color: #666;
            margin: 10px 0;
            margin-left: 25px
        }

    </style>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">

</head>
<body>
    <form action="add-treatment" method="post">
       <br>
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