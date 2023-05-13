<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddFisioterapeutaServlet" %>
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
    <title>Delete-physio</title>
</head>
<body>
    <p>¿Está seguro de querer eliminar al fisioterapeuta?</p>
    <form action="delete-fisio" method="post">
           <input type="hidden" id="physioId" name="physioId" value="<%= physioId %>">
           <input type="submit" value="Eliminar">
    </form>
</body>
</html>