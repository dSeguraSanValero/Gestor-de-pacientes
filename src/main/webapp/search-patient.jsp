<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.Aplicacion" %>
<%@ page import = "com.svalero.centroFisioterapia.Menu" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddPacienteServlet" %>

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
    <form action="/consultaFisioterapia/patient-searched.jsp" method="post">
       <br>
       <label for="nombre">Introduzca el nombre del paciente a buscar:</label>
       <input type="text" id="nombreBuscado" name="nombreBuscado"><br>
       <label for="apellido">Introduzca el apellido del paciente a buscar:</label>
       <input type="text" id="apellidoBuscado" name="apellidoBuscado"><br>
       <input type="submit" value="Buscar">
    </form>
</body>
</html>