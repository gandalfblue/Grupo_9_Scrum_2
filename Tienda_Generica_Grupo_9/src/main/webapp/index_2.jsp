<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tamaño de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaña -->
<title>Tienda Generica</title>
<!-- bootstrap-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- font awesome -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">

<!-- Cargando mi hoja de estilo -->
<link href="style.css" rel="stylesheet" type="text/css" />

</head>


<body>
	
	<!-- Navbar-->	
   	<nav class="navbar" id ="titulo_2">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
			<a class="navbar-brand links" href="listausuarios.jsp">
			<i class="fas fa-users"></i> Usuarios</a> 
			<a class="navbar-brand links" href="listaclientes.jsp">
			<i class="fas fa-address-book"></i> Clientes</a>
			<a class="navbar-brand links" href="listaproveedores.jsp">
			<i class="fas fa-truck"></i> Proveedores</a>
			<a class="navbar-brand links" href="listaproductos.jsp">
			<i class="fas fa-apple-alt"></i> Productos</a>
			<a class="navbar-brand links" href="listaventas.jsp">
			<i class="fas fa-money-check-alt"></i> Ventas</a>
			<a class="navbar-brand links" href="listareportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
<<<<<<< Updated upstream:Tienda_Generica_Grupo_9/src/main/webapp/index_2.jsp
	</nav>	
	
	<header id=titulo_3> Pagina principal de Usuarios 
	</header>
	
	<nav class="navbar2 fixed-bottom" id="titulo">
			<div class="row justify-content-between">
				<div class="col-4">
					<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada
					<i class="fas fa-cogs"></i></a>
				</div>
			</div>
		</nav>
=======
	</nav>
	<br>
	<br>
	<div class="header">
				<h2 style="color:purpol;"><i class="navbar-brand links"></i> Reportes</h2>
			</div>
	
			<div class="container p-4">
				<div class="col text-left">
				<br>
				<br>
				  	<button type="button" class="btn btn-primary btn-lg" 
				  		onclick="window.location.href='/reporteusuario.jsp'">
					<i class="fas fa-users"></i> Lstado de usuarios</button>
					<br>
					<br>
					<button type="button" class="btn btn-secondary btn-lg"
						onclick="window.location.href='/reporteclientes.jsp'">
					<i class="fas fa-address-book"></i> Listado de clientes</button>
					<br>
					<br>
					<button type="button" class="btn btn-info btn-lg"
						onclick="window.location.href='/reporteventas.jsp'">
					<i class="fas fa-money-check-alt"></i> Ventas por cliente</button>
								
				</div>
			</div>
  	 	<br>
				
<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>	

>>>>>>> Stashed changes:Tienda_Generica_Grupo_9/src/main/webapp/reportes.jsp
</body>
</html>