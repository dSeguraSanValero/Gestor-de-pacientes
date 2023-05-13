<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.tratamientos.Tratamiento" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.TratamientoDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.util.DateUtils" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import="java.util.List" %>
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
    <title>view-physio</title>
</head>
<body>

      <%
          Database db = new Database();
          FisioterapeutaDAO dao = new FisioterapeutaDAO(db.getConnection());
          Fisioterapeuta fisioterapeuta = dao.getFisioterapeutaPorId(physioId);
          List<Tratamiento> tratamientos = dao.getTratamientosPorIdFisioterapeuta(physioId);
      %>


      <h5><%= fisioterapeuta.getNombre() %> <%= fisioterapeuta.getApellidos() %></h5>
      <p>Identificador de Fisioterapeuta: <%= fisioterapeuta.getId() %></p>
      <p>Identificador de consulta en la que trabaja: <%= fisioterapeuta.getIdConsulta() %></p>


      <% for (Tratamiento tratamiento : tratamientos) { %>
        <p><%= tratamiento.getId_paciente() %> <%= tratamiento.getFechaTratamiento() %> <%= tratamiento.getMotivo() %></p>
      <% } %>


</body>
</html>