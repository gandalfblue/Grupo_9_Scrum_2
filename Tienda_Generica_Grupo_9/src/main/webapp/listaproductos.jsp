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


<script>
	var baseurl = "http://localhost:8080/listarproductos";
	function loadproductos() {
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.open("GET", baseurl, true);
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				var productos = JSON.parse(xmlhttp.responseText);
				var tbltop = "<table class='table table-hover table-light' id='tabla' align='center';><tr><th>Codigo del producto</th><th>Iva de compra</th><th>Nit proveedor</th><th>Nombre del producto</th><th>Precio de compra</th><th>Precio de venta</th></tr>";
				
				var main = "";
				for (i = 0; i < productos.length; i++) {
					main += "<tr><td>" + productos[i].codigo_producto
							+ "</td><td>" + productos[i].iva_compra
							+ "</td><td>" + productos[i].nit_proveedor
							+ "</td><td>" + productos[i].nombre_producto
							+ "</td><td>" + productos[i].precio_compra
							+ "</td><td>" + productos[i].precio_venta + "</td></tr>";
				}
				var tblbottom = "</table>";
				var tbl = tbltop + main + tblbottom;
				document.getElementById("productosinfo").innerHTML = tbl;
			}
		};
		xmlhttp.send();
	}
	window.onload = function() {
		loadproductos();
	}
</script>

</head>


<body>
	<nav class="navbar navbar-dark bg-dark">
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
	
				<div class="container p-3">
				<div class="col text-center">
				<img src="https://image.freepik.com/free-vector/grocery-bags-set-plastic-paper-packages-supermarket-basket-with-food-packs-cans-bread-milk-products-flat-vector-illustrations-shopping-food-delivery-charity-concept_74855-10074.jpg"  height="225px" alt="logo" id="listaproveedores"/>
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='/insertarproductos.jsp'">
					<i class="fas fa-plus-circle"></i> Agregar producto</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarproductos.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar producto</button>
					<button type="button" class="btn btn-dark"
						onclick="window.location.href='/buscarproductos.jsp'">
					<i class="fas fa-search"></i> Buscar un producto</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listaproductos.jsp'">
					<i class="fas fa-search"></i> Lista de productos</button>
					
				</div>
		<br>
		<br>		
			</div>
			<div class="header">
				<h1 style="color:green;" >
					<i class="fas fa-stream"></i> Lista de productos
				</h1>		
			</div>			
	<!-- contenido  -->
	

			<div class="container" style="height: 75%; overflow: auto">
				<div class="table-wrapper-scroll-y my-custom-scrollbar">
					<div class="row">
						<!--  Aqui es donde se autogenera la tabla basado en el script -->
						<div class="col align-self-center " id="productosinfo">					
						</div>	
					</div>	
				</div>		
			</div>


	<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Dise�ado y programado por Carol Mart�nez, Claudia Gonz�lez, David Mu�oz, Andr�s Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>


</body>
</html>