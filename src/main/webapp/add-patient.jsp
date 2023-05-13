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
    <form action="add-paciente" method="post">
       <br>
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