<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- Tama?o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pesta?a -->
<title>Buscar Producto</title>
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


<body id="body_productos">
	<!-- Navbar-->
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html">
			<i class="fas fa-shopping-basket"></i> Tienda Generica</a>
			<a class="navbar-brand links" href="index_usuarios.jsp">
			<i class="fas fa-users"></i> Usuarios</a> 
			<a class="navbar-brand links" href="index_clientes.jsp">
			<i class="fas fa-address-book"></i> Clientes</a>
			<a class="navbar-brand links" href="index_proveedores.jsp">
			<i class="fas fa-truck"></i> Proveedores</a>
			<a class="navbar-brand links" href="index_productos.jsp">
			<i class="fas fa-apple-alt"></i> Productos</a>
			<a class="navbar-brand links" href="listaventas.jsp">
			<i class="fas fa-money-check-alt"></i> Ventas</a>
			<a class="navbar-brand links" href="reportes.jsp">
			<i class="fas fa-clipboard-list"></i> Reportes</a>
		</div>
	</nav>
	<br>
	
				<div class="container p-4">
				<div class="col text-center">
					<button type="button" class="btn btn-success" 
				  		onclick="window.location.href='<%=request.getContextPath()%>/insertarproductos.jsp'">
					<i class="fas fa-plus-circle"></i> Insertar Productos</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='<%=request.getContextPath()%>/eliminarproductos.jsp'">
					<i class="fas fa-trash"></i> Eliminar Productos</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='<%=request.getContextPath()%>/actualizarproductos.jsp'">
					<i class="fas fa-pen-alt"></i> Actualizar Productos</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href='<%=request.getContextPath()%>/buscarproductos.jsp'">
					<i class="fas fa-search"></i> Buscar Productos</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='<%=request.getContextPath()%>/listaproductos.jsp'">
					<i class="fas fa-list-ol"></i> Lista Productos</button>
					
				</div>
			</div>
			<br>

	<div style="padding-left: 5px">
		<h1 style="color:gray">
			<i class="fas fa-search" ></i> Buscar Producto
		</h1>
		<br>
		<br>
		
		<div class="container">


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al buscar el producto, el producto no existe</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Producto encontrado con exito</div>

			<form id="form1" class="preselection">
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">C?digo del Producto a Buscar</span> <input
						type="text" class="form-control"
						placeholder="Ingresar el codigo aqui..."
						aria-describedby="basic-addon1" required id="codigo_producto">
				</div>				
				<br>
				
				<button type="button" class="btn btn-secondary" onclick="enviar()">
				<i class="fas fa-search"></i> Buscar Producto
				</button>			
				<br>
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Iva de Compra</span>
					<input type="text" class="form-control"
						aria-describedby="basic-addon3" required id="iva_compra"  disabled="disabled">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Nit del Proveedor</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon2" required id="nit_proveedor" disabled="disabled">
				</div>				

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Nombre del Producto</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon4" required id="nombre_producto"  disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Precio de Compra</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon5" required id="precio_compra"  disabled="disabled">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Precio de Venta</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon5" required id="precio_venta"  disabled="disabled">
				</div>
			</form>

			
			<br>
			<br>
			<br>
			<br>

		</div>

	</div>
	
<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Dise?ado y programado por Carol Mart?nez, Claudia Gonz?lez, David Mu?oz, Andr?s Lozada
					<i class="fas fa-cogs"></i></a>
			</div>
		</div>
	</nav>
	
	<script>
		function enviar() {
				
				//var baseUrl ='http://localhost:8080'
				var getUrl = window.location;
				var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var user=   document.getElementById("codigo_producto").value;
				req.open('GET',baseUrl+'/consultarproductos?codigo_producto='+user, false);
				req.send(null);
				var productos = null;
				if (req.status == 200)
					productos = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));				

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				console.log(productos.toString());
				
			if (productos.toString()!=""){

				document.getElementById("iva_compra").value = productos[0].iva_compra;
				document.getElementById("nit_proveedor").value = productos[0].nit_proveedor;
				document.getElementById("nombre_producto").value = productos[0].nombre_producto;
				document.getElementById("precio_compra").value = productos[0].precio_compra;
				document.getElementById("precio_venta").value = productos[0].precio_venta;
				
				document.getElementById("codigo_producto").value = "";			

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("iva_compra").value = "";
				document.getElementById("nit_proveedor").value = "";
				document.getElementById("nombre_producto").value = "";
				document.getElementById("precio_compra").value = "";
				document.getElementById("precio_venta").value = "";
			}
		}
	</script>

</body>
</html>