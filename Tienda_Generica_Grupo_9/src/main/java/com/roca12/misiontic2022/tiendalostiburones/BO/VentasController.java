package com.roca12.misiontic2022.tiendalostiburones.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.roca12.misiontic2022.tiendalostiburones.DAO.VentasDAO;
import com.roca12.misiontic2022.tiendalostiburones.DTO.VentasVO;


@RestController
public class VentasController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarventa")
	public void registrarVenta(VentasVO codigov) {
		VentasDAO Dao = new VentasDAO();
		Dao.registrarVentas(codigov);
	}

	@GetMapping("/consultarventa")
	public ArrayList<VentasVO> consultarVentas(String venta) {
		VentasDAO Dao = new VentasDAO();
		return Dao.consultarVentas(venta);
	}
	
	@GetMapping("/consultarcodigo_venta")
	public ArrayList<VentasVO> consultarCodigo_venta(int codigo_venta) {
		VentasDAO Dao = new VentasDAO();
		return Dao.consultarCodigo_venta(codigo_venta);
	}

	@GetMapping("/listarventas")
	public ArrayList<VentasVO> listaDeVentas() {
		VentasDAO Dao = new VentasDAO();
		return Dao.listaDeVentas();
	}
	
	@DeleteMapping("/eliminarventa")
	public void eliminarventa(Integer codigo_venta) {
		VentasDAO Dao = new VentasDAO();
		Dao.eliminarVentas(codigo_venta);
	}
	
	@PutMapping("/actualizarventas")
	public void actualizarVenta(VentasVO codigov) {
		VentasDAO Dao = new VentasDAO();
		Dao.actualizarVentas(codigov);
	}
	
	

}