<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import = "com.svalero.centroFisioterapia.servlet.AddFisioterapeutaServlet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http.equiv="Content-Type">
    <meta content="text/html">
    <meta charset="UTF-8">
    <title>search-physio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
    <header data-bs-theme="dark">
      <div class="collapse text-bg-dark" id="navbarHeader">
        <div class="container">
          <div class="row">
            <div class="col-sm-8 col-md-7 py-4">
              <h4>DAW</h4>
              <p class="text-body-secondary">Aplicación web de gestión de pacientes</p>
            </div>
            <div class="col-sm-4 offset-md-1 py-4">
              <h4>Autoría</h4>
              <ul class="list-unstyled">
                <li><p>Daniel Segura Caro</p></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
          <a href="#" class="navbar-brand d-flex align-items-center">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" aria-hidden="true" class="me-2" viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3h6l2 3h4a2 2 0 0 1 2 2z"/><circle cx="12" cy="13" r="4"/></svg>
            <strong>Barra de navegación</strong>
          </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        </div>
      </div>
    </header>
    <form action="add-physio" method="post">
       <br>
       <label for="nombre">Introduzca el nombre del fisioterapeuta:</label>
       <input type="text" id="nombre" name="nombre"><br>
       <label for="apellido">Introduzca el apellido:</label>
       <input type="text" id="apellido" name="apellido"><br>
       <label for="idConsulta">Introduzca el ID de la consulta en la que trabaja (Cada fisio solo puede trabajar en una consulta de las 5 existentes):</label>
       <input type="text" id="idConsulta" name="idConsulta"><br>
       <input type="submit" value="Registrar">
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>