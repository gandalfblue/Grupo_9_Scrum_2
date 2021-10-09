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
<title>Lista de usuarios</title>
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

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />


<script>

	window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki
	let table=null;
    if (datatablesusers) {
        table=new simpleDatatables.DataTable("#datatablesusers", {
            searchable: true,
            labels: {
                placeholder: "Buscar...",
                perPage: "{select} registros por pagina",
                noRows: "No hay registros",
                info: "Mostrando {start} a {end} de {rows} registros",
            }
        });
    }
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "http://localhost:8080/listarusuarios", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var usuarios = JSON.parse(xmlhttp.responseText);
				
				for (i = 0; i < usuarios.length; i++) {
					let fila = [
						usuarios[i].cedula_usuario.toString(), 
						usuarios[i].email_usuario, 
						usuarios[i].nombre_usuario, 
						usuarios[i].password, 
						usuarios[i].usuario
					];

				    table.rows().add(fila);
				}
			}
		};
		
		xmlhttp.send();
});
</script>

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
	</nav>	
	
	<!-- contenido  -->		
			<div class="container p-4">
				<div class="col text-center">
				  	<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarusuario.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar usuario</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarusuario.jsp'">
					<i class="fas fa-trash"></i> Eliminar usuario</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarusuario.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar usuario</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='/buscarusuario.jsp'">
					<i class="fas fa-search"></i> Buscar un usuario</button>
									
				</div>
			</div>
  
		<div class="row">
					<div class="col-xl-12">
						<div class="card mb-4">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Tabla de usuarios
							</div>
							<div class="card-body">
								<table id="datatablesusers">
									<thead>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Cedula</th>
											<th>Email</th>
											<th>Nombre</th>
											<th>Password</th>
											<th>Usuario</th>
										</tr>
									</tfoot>
									<tbody id="usuariosinfo">

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
	
	<nav class="navbar2 fixed-bottom" id="titulo">
			<div class="row justify-content-between">
				<div class="col-4">
					<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada
					<i class="fas fa-cogs"></i></a>
				</div>
			</div>
		</nav>
		
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
crossorigin="anonymous"></script>

</body>
</html>