<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.Aplicacion" %>
<%@ page import = "com.svalero.centroFisioterapia.Menu" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddFisioterapeutaServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search-physio</title>
</head>
<body>
    <form action="/consultaFisioterapia/physio-searched.jsp" method="post">
       <label for="nombre">Introduzca el nombre del fisioterapeuta a buscar:</label>
       <input type="text" id="nombreBuscado" name="nombreBuscado"><br>
       <label for="apellido">Introduzca el apellido del fisioterapeuta a buscar:</label>
       <input type="text" id="apellidoBuscado" name="apellidoBuscado"><br>
       <input type="submit" value="Buscar">
    </form>
</body>
</html>