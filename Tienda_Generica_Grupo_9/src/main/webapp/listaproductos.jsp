<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tama�o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pesta�a -->
<title>Lista de productos</title>
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
	let table=null;
    if (datatablesusers) {
        table=new simpleDatatables.DataTable("#datatablesusers", {
            searchable: true,
            labels: {
                placeholder: "Buscar...",
                perPage: "{select} Registros por pagina",
                noRows: "No hay registros",
                info: "Mostrando {start} a {end} de {rows} registros",
            }
        });
    }
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", "http://localhost:8080/listarproductos", true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var productos = JSON.parse(xmlhttp.responseText);
				
				for (i = 0; i < productos.length; i++) {
					let fila = [
						productos[i].codigo_producto.toString(), 
						productos[i].iva_compra, 
						productos[i].nit_proveedor, 
						productos[i].nombre_producto,
						productos[i].precio_compra,
						productos[i].precio_venta
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
	<br>
	<br>	
	<br>
		
			<div class="row">
					<div class="col-xl-8">
						<div class="card m-3">
							<div class="card-header text-white bg-dark">
								<i class="fas fa-table"></i> Tabla de productos
							</div>
							<div class="card-body">
								<table id="datatablesusers">
									<thead>
										<tr>
											<th>Codigo del producto</th>
											<th>Iva de compra</th>
											<th>Nit del proveedor</th>
											<th>Nombre del producto</th>
											<th>Precio de compra</th>
											<th>Precio de venta</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>Codigo del producto</th>
											<th>Iva de compra</th>
											<th>Nit del proveedor</th>
											<th>Nombre del producto</th>
											<th>Precio de compra</th>
											<th>Precio de venta</th>
										</tr>
									</tfoot>
									<tbody id="productosinfo">

									</tbody>
								</table>
							</div>
						</div>
					</div>
					
				<div class="col-xl">
					<div class="container p-3">
						<div class="col text-center">
							<img src="https://image.freepik.com/free-vector/grocery-bags-set-plastic-paper-packages-supermarket-basket-with-food-packs-cans-bread-milk-products-flat-vector-illustrations-shopping-food-delivery-charity-concept_74855-10074.jpg"
							  height="225px" alt="logo" id="listaproductos"/>
								<ul class="list-group" style="list-style-type:none;">
									<li><button type="button" class="btn btn-success m-2" 
								  		onclick="window.location.href='/insertarproductos.jsp'">
										<i class="fas fa-plus-circle"></i> Agregar producto</button></li>
									<li><button type="button" class="btn btn-danger m-2"
										onclick="window.location.href='/eliminarproductos.jsp'">
										<i class="fas fa-trash"></i> Eliminar producto</button></li>
									<li><button type="button" class="btn btn-warning m-2"
										onclick="window.location.href='/actualizarproductos.jsp'">
										<i class="fas fa-pen-alt"></i> Actualizar producto</button>
									<li><button type="button" class="btn btn-dark m-2"
										onclick="window.location.href='/buscarproductos.jsp'">
									<i class="fas fa-search"></i> Buscar un producto</button></li>	
								</ul>				
						</div>
					</div>
				</div>
			</div>

	<nav class="navbar fixed-bottom" id="titulo">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Dise�ado y programado por Carol Mart�nez, Claudia Gonz�lez, David Mu�oz, Andr�s Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
crossorigin="anonymous"></script>

</body>
</html>