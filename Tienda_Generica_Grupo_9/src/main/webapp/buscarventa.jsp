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
<title>Buscar venta</title>
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
	<nav class="navbar navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand links" href="index.html"><i
				class="fas fa-fish"></i>Tienda Generica</a>
		</div>
	</nav>

	<!-- Navbar modulos-->
	<nav class="navbar navbar-dark bg-primary">
		<div class="container">
			<a class="navbar-brand links" href="listausuarios.jsp"> <i
				class="fas fa-users"></i> Usuarios
			</a> <a class="navbar-brand links" href="listaclientes.jsp"> <i
				class="fas fa-address-book"></i> Clientes
			</a> <a class="navbar-brand links" href="listaproveedores.jsp"> <i
				class="fas fa-truck"></i> Proveedores
			</a> <a class="navbar-brand links" href="listaproductos.jsp"> <i
				class="fas fa-apple-alt"></i> Productos
			</a> <a class="navbar-brand links" href="listaventas.jsp"> <i
				class="fas fa-money-check-alt"></i> Ventas
			</a> <a class="navbar-brand links" href="listareportes.jsp"> <i
				class="fas fa-clipboard-list"></i> Reportes
			</a>
		</div>
	</nav>

	<div style="padding-left: 5px">
		<h2>
			<i class="fas fa-search"></i> Buscando una venta
		</h2>
		<div class="container">


			<div id="error" class="alert alert-danger visually-hidden"
				role="alert">Error al buscar la venta, la venta no existe</div>

			<div id="correcto" class="alert alert-success visually-hidden"
				role="alert">venta encontrada con exito</div>

			<form id="form1">
			
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">venta a buscar</span> <input
						type="text" class="form-control"
						placeholder="Inserte username aqui..."
						aria-describedby="basic-addon4" required id="codigo_venta" >
				</div>
				<br>
				<br>
				<br>
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Codigo Venta</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon1" required id="codigo_venta" disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon2">Cedula Usuario</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon2" required id="cedula_usuario" disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon3">Cedula Cliente</span>
					<input type="text" class="form-control"
						aria-describedby="basic-addon3" required id="cedula_cliente"  disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon4">Iva Venta</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon4" required id="iva_venta"  disabled="disabled">
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Total Venta</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon5" required id="total_venta"  disabled="disabled">
				</div>
				
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon5">Valor Venta</span> <input
						type="text" class="form-control"
						aria-describedby="basic-addon5" required id="valor_venta"  disabled="disabled">
				</div>
			</form>

			<button type="button" class="btn btn-primary" onclick="enviar()">
				<i class="fas fa-search"></i> Buscar venta
			</button>
			
			<br>
			<br>
			<br>
			<br>
			<br>

			<h1>
				<i class="fas fa-cogs"></i> Operaciones
			</h1>
			<div class="container">
				<div class="row">
					<button type="button" class="btn btn-success"
						onclick="window.location.href='/registrarventa.jsp'">
						<i class="fas fa-plus-circle"></i> Agregar venta
					</button>
					<button type="button" class="btn btn-danger"
						onclick="window.location.href='/eliminarventa.jsp'">
						<i class="fas fa-trash"></i> Eliminar venta
					</button>
					<button type="button" class="btn btn-warning"
						onclick="window.location.href='/actualizarventas.jsp'">
						<i class="fas fa-pen-alt"></i> Actualizar venta
					</button>
					<button type="button" class="btn btn-primary"
						onclick="window.location.href='/listarventa.jsp'">
						<i class="fas fa-search"></i> Lista de ventas
					</button>
				</div>
			</div>
		</div>

	</div>
	
	<nav class="navbar2 fixed-bottom">
		<div class="row justify-content-between">
			<div class="col-4">
				<a class="navbar-brand links" href="#"><i class="fas fa-code"></i>
					Dise�ado y programado por Carol Mart�nez, Claudia Gonz�lez, David Mu�oz, Andr�s Lozada <i
					class="fas fa-code-branch"></i></a>
			</div>
		</div>
	</nav>
	
	<script>
		function enviar() {
				
				var req = new XMLHttpRequest();
				var coincidencia = false;
				var user=   document.getElementById("codigo_venta").value;
				req.open('GET', 'http://localhost:8080/consultarventa?venta='+user, false);
				req.send(null);
				var venta = null;
				if (req.status == 200)
					venta = JSON.parse(req.responseText);
				console.log(JSON.parse(req.responseText));				

				var element = document.getElementById("error");
				element.classList.add("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.remove("visually-hidden");
				
				console.log(venta.toString());
				
			if (venta.toString()!=""){

				document.getElementById("codigo_venta").value = venta[0].codigo_venta;
				document.getElementById("cedula_usuario").value = venta[0].cedula_usuario;
				document.getElementById("cedula_cliente").value = venta[0].cedula_cliente;
				document.getElementById("iva_venta").value = venta[0].iva_venta;
				document.getElementById("total_venta").value = venta[0].total_venta;
				document.getElementById("valor_venta").value = venta[0].valor_venta;
				
				document.getElementById("codigo_venta").value = "";			

			} else {
				var element = document.getElementById("error");
				element.classList.remove("visually-hidden");
				var element2 = document.getElementById("correcto");
				element2.classList.add("visually-hidden");
				document.getElementById("codigo_venta").value = "";
				document.getElementById("cedula_usuario").value = "";
				document.getElementById("cedula_cliente").value = "";
				document.getElementById("iva_venta").value = "";
				document.getElementById("total_venta").value = "";
				document.getElementById("valor_venta").value = "";
			}
		}
	</script>

</body>
</html>