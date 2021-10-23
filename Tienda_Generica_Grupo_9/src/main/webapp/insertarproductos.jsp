<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<!-- paquete de caracteres -->
<meta charset="utf-8">
<!-- TamaÃ±o de la pantalla -->
<meta name="viewport" content="width=device-width">
<!-- titulo de la pestaÃ±a -->
<title>Insertando Producto</title>
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
		<br>
		<div class="header">
				<h1 style="color:green;" >
					<i class="fas fa-plus-circle"></i> Insertar Producto
				</h1>		
			</div>
			<br>			
	
	<div style="padding-left: 5px">
		<div class="container">
		<br>
		<br>
		<br>


			<div id="error" class="alert alert-danger visually-hidden"

				role="alert">Archivo vacio, extensión no valida o datos corruptos (El separador debe ser coma ",")</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Productos importados desde CSV con exito</div>

			<form id="form1" class="preselection">
				<div>
					<label for="formFileLg" class="form-label">Seleccionar
						archivo CSV con el inventario de productos</label> <input
						class="form-control form-control-lg" id="archivo" type="file"
						placeholder="Inserte el archivo aqui" accept=".csv,.txt">
						<br>
					<button type="button" class="btn btn-success"
						onclick="subirArchivo()">Insertar Producto</button>
				</div>

			</form>

		</div>

	</div>
	
			
<nav class="navbar fixed-bottom navbar-dark bg-dark">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fab fa-battle-net"></i>
					Diseñado y programado por Carol Martínez, Claudia González, David Muñoz, Andrés Lozada
					<i class="fas fa-cogs"></i></a>
			</div>
		</div>
	</nav>
	
	<script>
	
	function subirArchivo() {
		
		//var baseUrl ='http://localhost:8080'
		var getUrl = window.location;
		var baseUrl = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
		
		try {

			var csvFile = document.getElementById("archivo");

			var input = csvFile.files[0];
			var reader = new FileReader();

			reader.onload = function(e) {

				var text = e.target.result;

				var arrayLineas = text.split("\n");

				var xhr = new XMLHttpRequest();
				xhr.open("DELETE",baseUrl+"/eliminar_tablaproductos",true);
				xhr.send();

				for (var i = 0; i < arrayLineas.length; i += 1) {
					var arraydatos = arrayLineas[i].split(",");

					if (arrayLineas[i] == "") {
						continue;
					}

					for (var j = 0; j < arraydatos.length; j += 1) {
						console.log(i + " " + j + "->" + arraydatos[j]);
					}

					var formData = new FormData();
					formData.append("codigo_producto", arraydatos[0]);
					formData.append("nombre_producto", arraydatos[1]);
					formData.append("nit_proveedor", arraydatos[2]);
					formData.append("precio_compra", arraydatos[3]);
					formData.append("iva_compra", arraydatos[4]);
					formData.append("precio_venta", arraydatos[5]);
					var xhr = new XMLHttpRequest();
					xhr.open("POST",baseUrl+"/registrarproductos");

					xhr.send(formData);
				}

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");

				document.getElementById("archivo").value = "";

			};

			reader.readAsText(input);
		} catch (error) {
			var element = document.getElementById("error");
			element.classList.remove("visually-hidden");
			var element2 = document.getElementById("correcto");
			element2.classList.add("visually-hidden");

			document.getElementById("archivo").value = "";
		}
	}
	</script>

</body>
</html>