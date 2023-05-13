<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddFisioterapeutaServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add-patient</title>
</head>
<body>
    <form action="add-physio" method="post">
       <label for="nombre">Introduzca el nombre del fisioterapeuta:</label>
       <input type="text" id="nombre" name="nombre"><br>
       <label for="apellido">Introduzca el apellido:</label>
       <input type="text" id="apellido" name="apellido"><br>
       <label for="idConsulta">Introduzca el ID de la consulta en la que trabaja (Cada fisio solo puede trabajar en una consulta de las 5 existentes):</label>
       <input type="text" id="idConsulta" name="idConsulta"><br>
       <input type="submit" value="Registrar">
    </form>
</body>
</html>