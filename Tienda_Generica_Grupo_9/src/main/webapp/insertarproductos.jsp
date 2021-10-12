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
<title>Insertando producto</title>
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
					<i class="fas fa-plus-circle"></i> Insertar producto</button>
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
					<i class="fas fa-plus-circle"></i> Insertar producto
				</h1>		
			</div>
			<br>			
	
	<div style="padding-left: 5px">
		<div class="container">
		<br>
		<br>
		<br>


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Archivo vacio, extensi�n no valida o datos corruptos (El separador debe ser coma ",")</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">Productos importados desde CSV con exito</div>

			<form id="form1">
				<div>
					<label for="formFileLg" class="form-label">Seleccionar
						archivo CSV con el inventario de productos</label> <input
						class="form-control form-control-lg" id="archivo" type="file"
						placeholder="Inserte el archivo aqui" accept=".csv,.txt">
						<br>
					<button type="button" class="btn btn-success"
						onclick="subirArchivo()">Insertar producto</button>
				</div>

			</form>

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
	
	<script>
	
	function subirArchivo() {

		try {

			var csvFile = document.getElementById("archivo");

			var input = csvFile.files[0];
			var reader = new FileReader();

			reader.onload = function(e) {

				var text = e.target.result;

				var arrayLineas = text.split("\n");

				var xhr = new XMLHttpRequest();
				xhr.open("DELETE",
						"http://localhost:8080/eliminar_tablaproductos",true);
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
					xhr.open("POST",
							"http://localhost:8080/registrarproductos");

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