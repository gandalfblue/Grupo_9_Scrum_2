package com.roca12.misiontic2022.tiendalostiburones.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.roca12.misiontic2022.tiendalostiburones.DAO.ProveedoresDAO;
import com.roca12.misiontic2022.tiendalostiburones.DTO.ProveedoresVO; 

@RestController
public class ProveedoresController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarproveedores")
	public void registrarProveedores(ProveedoresVO user) {
		ProveedoresDAO Dao = new ProveedoresDAO();
		Dao.registrarProveedores(user);
	}

	@GetMapping("/consultarproveedores")
	public ArrayList<ProveedoresVO> consultarProveedores(Integer nit_proveedor) {
		ProveedoresDAO Dao = new ProveedoresDAO();
		return Dao.consultarProveedores(nit_proveedor);
	}

	@GetMapping("/listarProveedores")
	public ArrayList<ProveedoresVO> listaDeProveedores() {
		ProveedoresDAO Dao = new ProveedoresDAO();
		return Dao.listaDeProveedores();
	}
	
	@DeleteMapping("/eliminarProveedores")
	public void eliminarProveedores(Integer nit_proveedor) {
		ProveedoresDAO Dao = new ProveedoresDAO();
		Dao.eliminarProveedores(nit_proveedor);
	}
	
	@PutMapping("/actualizarProveedores")
	public void actualizarProveedores(ProveedoresVO user) {
		ProveedoresDAO Dao = new ProveedoresDAO();
		Dao.actualizarProveedores(user);
	}
}