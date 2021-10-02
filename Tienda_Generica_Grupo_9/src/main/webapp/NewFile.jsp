<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Busqueda de Cliente</title>
	
  <!-- Estilos Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	 crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	 crossorigin="anonymous">
	</script>
	

	<!--- estilos --->
	<link href="insertarstyle.css" rel="stylesheet" type="text/css" />
	<!--- CDN --->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	 crossorigin="anonymous" referrerpolicy="no-referrer">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  

  
</head>

<body>
	
	<!-- Titulo -->
	<h2>
		<div class="sticky-lg-top">Tienda de Prodcutos</div>
	</h2>

	<!-- Barra de Navegacion -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<span class="navbar-brand" href="#">
				<h3>Módulos</h3>
			</span>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="listausuarios.jsp"><h3>Usuarios</h3></a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="listaclientes.jsp"><h3>Clientes</h3></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><h3>Proveedores</h3></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><h3>Productos</h3></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><h3>Ventas</h3></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><h3>Reportes</h3></a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Zona de ingreso de ingreso de informacio -->
<div class="full-form">
  <center>
  <div id="error" class="alert alert-danger visually-hidden"
					role="alert">Error en busqueda de cliente, el usuario no existe</div>
					
			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Cliente encontrado con exito</div>
				
  <form class="row g-3" id="flex-parent-element" type="" method="">
    <div class="row">
       <div class="column">
       <div id="flex-child-element1">
       
      
        <div class="form-floating">      
        <input type="number" class="form-control" class="input-field" id="cedula_cliente" id="form-floating " placeholder=" Cedula" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg"  required>
        <label for="form-floating">&nbsp&nbsp<i class="fas fa-id-card"></i>&nbsp&nbspCedula</label>
      </div>
      
      <br/>
      <br/>

      <div class="form-floating">
        <input type="text" class="form-control"  id="nombre_cliente" id="form-floating " placeholder="Nombre Cliente" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="Nombre Cliente" disabled="disabled" required>
        <label for="form-floating">&nbsp&nbsp<i class="fas fa-user"></i>&nbsp&nbspNombre Cliente</label>
      </div>

     

    <div class="col-12" >
      <div class="form-floating">
        <input type="text" class="form-control" id="direccion_cliente" id="form-floating " placeholder="Dirección de Cliente" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="Dirección de Cliente" disabled="disabled" required>
        <label for="form-floating">&nbsp&nbsp<i class="fas fa-house-user"></i>&nbsp&nbspDirección de Cliente</label>
      </div>
    </div>

    <div class="col-12" >
      <div class="form-floating">
        <input type="text" class="form-control" id="telefono_cliente" id="form-floating " placeholder="Telefono Cliente" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="Telefono Cliente" disabled="disabled" required >
        <label for="form-floating">&nbsp&nbsp<i class="fas fa-mobile-alt"></i>&nbsp&nbspTelefono Cliente</label>
      </div>
    </div>

    <div class="col-12" >
      <div class="form-floating">
        <input type="email" class="form-control" id="email_cliente" id="form-floating " placeholder="Correo Electronico" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" name="correo" disabled="disabled" required >
        <label for="form-floating">&nbsp&nbsp<i class="fas fa-at"></i>&nbsp&nbspCorreo Electronico</label>
      </div>
    </div>
    </div>
  </div>
  <div class="column">
     <div id="flex-child-element">
      <button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='/insertarclientes.jsp'">Crear Nuevo Cliente</button>
      <button type="button" class="btn btn-info btn-lg" onclick="enviar()">Consultar Cliente</button>
      <button type="button" class="btn btn-warning btn-lg" onclick="window.location.href='/actualizarcliente.jsp'">Actualizar Cliente</button>
      <button type="button" class="btn btn-danger btn-lg" onclick= "window.location.href='/eliminarcliente.jsp'">Borrar Cliente</button>
      <button type="button" class="btn btn-info btn-lg" onclick="window.location.href='/listaclientes.jsp'">Lista de Clientes</button>
    </div>
  </div>
</div>


  </form>
</center>

</div>

<script>
function enviar() {

	
	var req = new XMLHttpRequest();
	var coincidencia = false;
	var cedula=   document.getElementById("cedula_cliente").value;
	req.open('GET', 'http://localhost:8080/consultarcliente?cedula_cliente='+cedula, false);
	req.send(null);
	var cliente = null;
	if (req.status == 200)
		cliente = JSON.parse(req.responseText);
	console.log(JSON.parse(req.responseText));
	


	var element = document.getElementById("error");
	element.classList.add("visually-hidden");
	var element2 = document.getElementById("correcto");
	element2.classList.remove("visually-hidden");
	
	console.log(cliente.toString());
	
if (cliente.toString()!=""){

	document.getElementById("nombre_cliente").value = cliente[0].nombre_cliente;
	document.getElementById("direccion_cliente").value = cliente[0].direccion_cliente;
	document.getElementById("telefono_cliente").value = cliente[0].telefono_cliente;
	document.getElementById("email_cliente").value = cliente[0].email_cliente;
	
	document.getElementById("cedula_cliente").value = "";


} else {
	var element = document.getElementById("error");
	element.classList.remove("visually-hidden");
	var element2 = document.getElementById("correcto");
	element2.classList.add("visually-hidden");
	document.getElementById("cedula_cliente").value = "";
	document.getElementById("nombre_cliente").value = "";
	document.getElementById("direccion_cliente").value = "";
	document.getElementById("telefono_cliente").value = "";
	document.getElementById("email_cliente").value = "";
}
}
	</script>  
</body>

</html>