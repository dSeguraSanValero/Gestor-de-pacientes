<%@ page import = "com.svalero.centroFisioterapia.dao.Database" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.PacienteDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.dao.FisioterapeutaDAO" %>
<%@ page import = "com.svalero.centroFisioterapia.paciente.Paciente" %>
<%@ page import = "com.svalero.centroFisioterapia.fisioterapeuta.Fisioterapeuta" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="UTF-8" %>


<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="../assets/js/color-modes.js"></script>

    <meta http.equiv="Content-Type">
    <meta content="text/html">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.111.3">
    <title>Consulta de fisioterapia</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">



    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }

      .btn-bd-primary {
        --bd-violet-bg: #712cf9;
        --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

        --bs-btn-font-weight: 600;
        --bs-btn-color: var(--bs-white);
        --bs-btn-bg: var(--bd-violet-bg);
        --bs-btn-border-color: var(--bd-violet-bg);
        --bs-btn-hover-color: var(--bs-white);
        --bs-btn-hover-bg: #6528e0;
        --bs-btn-hover-border-color: #6528e0;
        --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
        --bs-btn-active-color: var(--bs-btn-hover-color);
        --bs-btn-active-bg: #5a23c8;
        --bs-btn-active-border-color: #5a23c8;
      }
      .bd-mode-toggle {
        z-index: 1500;
      }
      .título-seccion {
        text-align: center;
      }
    </style>


  </head>
  <body>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
      <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
      </symbol>
      <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
      </symbol>
      <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
      </symbol>
      <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
      </symbol>
    </svg>


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

    <main>

      <section class="py-5 text-center container">
        <div class="row py-lg-5">
          <div class="col-lg-6 col-md-8 mx-auto">
            <h1 class="fw-light">Bienvenido a la aplicación web de gestión de pacientes</h1>
            <p class="lead text-body-secondary">Introduce, modifica, elimina registros sobre tus pacientes y sus tratamientos, para tu consulta de fisioterapia</p>
            <p>
              <a href="/consultaFisioterapia/add-patient.jsp" class="btn btn-primary my-2">Añadir a un paciente</a>
              <a href="/consultaFisioterapia/search-patient.jsp" class="btn btn-primary my-2">Buscar a un paciente</a>
              <a href="/consultaFisioterapia/add-physio.jsp" class="btn btn-secondary my-2">Añadir a un fisioterapeuta</a>
            </p>
          </div>
        </div>
      </section>

      <h2 class="título-seccion">Fisioterapeutas</h2>

      <div class="album py-5 bg-body-tertiary">
        <div class="container">
          <% Database db = new Database();
             FisioterapeutaDAO daoF = new FisioterapeutaDAO(db.getConnection());
             List<Fisioterapeuta> fisioterapeutas = daoF.verTodosFisios();
          %>
            <div class="col-md-9">
              <div class="row row-cols-1 row-cols-md-3 g-4">
                <% for (Fisioterapeuta fisioterapeuta : fisioterapeutas) { %>
                <div class="col">
                  <div class="card h-100">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                    <div class="card-body">
                      <h5 class="card-title"><%= fisioterapeuta.getNombre() %> <%= fisioterapeuta.getApellidos() %></h5>
                      <p class="card-text">
                        <p>Identificador de la consulta en la que trabaja: <%= fisioterapeuta.getIdConsulta() %></p>
                      </p>
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <form method="POST" action="/consultaFisioterapia/view-physio.jsp">
                                <input type="hidden" name="physioId" value="<%= fisioterapeuta.getId() %>">
                                <button type="submit" class="btn btn-sm btn-outline-secondary">Ver datos</button>
                            </form>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                            <form method="POST" action="/consultaFisioterapia/delete-physio.jsp">
                                <input type="hidden" name="physioId" value="<%= fisioterapeuta.getId() %>">
                                <button type="submit" class="btn btn-sm btn-outline-secondary">Borrar</button>
                            </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <% } %>
              </div>
            </div>
          </div>
        </div>
      </div>



      <h2 class="título-seccion">Pacientes</h2>

      <div class="album py-5 bg-body-tertiary">
        <div class="container">
          <% PacienteDAO dao = new PacienteDAO(db.getConnection());
             List<Paciente> pacientes = dao.verTodosPacientes();
          %>
            <div class="col-md-9">
              <div class="row row-cols-1 row-cols-md-3 g-4">
                <% for (Paciente paciente : pacientes) { %>
                <div class="col">
                  <div class="card h-100">
                    <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                    <div class="card-body">
                      <h5 class="card-title"><%= paciente.getNombre() %> <%= paciente.getApellidos() %></h5>
                      <p class="card-text">
                      </p>
                      <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                          <form method="POST" action="/consultaFisioterapia/view-patient.jsp">
                            <input type="hidden" name="patientId" value="<%= paciente.getId() %>">
                            <button type="submit" class="btn btn-sm btn-outline-secondary">Ver datos</button>
                          </form>
                          <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                          <form method="POST" action="/consultaFisioterapia/delete-patient.jsp">
                            <input type="hidden" name="patientId" value="<%= paciente.getId() %>">
                            <button type="submit" class="btn btn-sm btn-outline-secondary">Borrar</button>
                          </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <% } %>
              </div>
            </div>
          </div>
        </div>
      </div>



    </main>

    <footer class="text-body-secondary py-5">
      <div class="container">
        <p class="float-end mb-1">
          <a href="#">Back to top</a>
        </p>
        <p class="mb-1">Proyecto de aplicación web, de Daniel Segura Caro, para la asignatura programción.</p>
      </div>
    </footer>


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>


  </body>
</html>
