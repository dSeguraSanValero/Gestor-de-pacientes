<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>

<%
    String nombreBuscado = request.getParameter("nombreBuscado");
    String apellidoBuscado = request.getParameter("apellidoBuscado");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http.equiv="Content-Type">
    <meta content="text/html">
    <meta charset="UTF-8">
    <title>view-patient</title>
</head>
<body>

      <%
          Database db = new Database();
          FisioterapeutaDAO dao = new FisioterapeutaDAO(db.getConnection());
          Fisioterapeuta fisioterapeuta = dao.getFisioterapeutaPorNombre(nombreBuscado, apellidoBuscado);
      %>


      <h5><%= fisioterapeuta.getNombre() %> <%= fisioterapeuta.getApellidos() %></h5>
      <p>Consulta: <%= fisioterapeuta.getIdConsulta() %></p>
      <p>Identificador de fisioterapeuta: <%= fisioterapeuta.getId() %></p>


</body>
</html>