package com.roca12.misiontic2022.tiendalostiburones.DAO;

import java.sql.*;
import java.util.ArrayList;
import com.roca12.misiontic2022.tiendalostiburones.DTO.VentasVO;

/**
 * Clase que permite el acceso a la base de datos
 *
 */
public class VentasDAO {
	/**
	 * Permite registrar una Venta nueva
	 * 
	 * @param codigov
	 */
	public void registrarVentas(VentasVO codigov) {
		//llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			//sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();
			
			//String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO ventas VALUES(" 
					+ codigov.getCodigo_venta() + "'," + "'" 
					+ codigov.getCedula_usuario() + "," + "'"
					+ codigov.getCedula_cliente() + "'," + "'" 
					+ codigov.getIva_venta() + "'," + "'" 
					+ codigov.getTotal_venta() + "'," + "'"
					+ codigov.getValor_venta() + "'," + "'"
					+ ");";
			
			//se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			//impresión en consola para verificación 
			System.out.println("Registrado " + sentencia);
			//cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo registrar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo registrar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	/**
	 * permite consultar la Venta asociado al codigov enviado como parametro
	 * 
	 * @param documento
	 * @return
	 */
	public ArrayList<VentasVO> consultarVentas(String venta) {	
		//lista que contendra el o los Ventass obtenidos
		ArrayList<VentasVO> listaventas = new ArrayList<VentasVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM Ventas where Venta = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setString(1, venta);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				VentasVO Venta = new VentasVO();
				Venta.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				Venta.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
				Venta.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Venta.setIva_venta(Integer.parseInt(res.getString("iva_venta")));
				Venta.setTotal_venta(Integer.parseInt(res.getString("total_venta")));
				Venta.setValor_venta(Integer.parseInt(res.getString("Valor_venta"))); 
				
				listaventas.add(Venta);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaventas;
	}

	public ArrayList<VentasVO> consultarCodigo_venta(int codigo_venta) {	
		//lista que contendra el o los Ventas obtenidos
		ArrayList<VentasVO> listaventas = new ArrayList<VentasVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM Ventas where codigo_venta = ? ");		
			// se cambia el comodin ? por el dato que ha llegado en el parametro de la funcion
			consulta.setInt(1, codigo_venta);			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				VentasVO Venta = new VentasVO();
				Venta.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				Venta.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
				Venta.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Venta.setIva_venta(Integer.parseInt(res.getString("iva_venta")));
				Venta.setTotal_venta(Integer.parseInt(res.getString("total_venta")));
				Venta.setValor_venta(Integer.parseInt(res.getString("Valor_venta"))); 
				
				listaventas.add(Venta);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaventas;
	}
	
	/**
	 * permite consultar la lista de todos los Ventass
	 * 
	 * @return
	 */
	public ArrayList<VentasVO> listaDeVentas() {
		//lista que contendra las Ventas obtenidos
		ArrayList<VentasVO> listaventas = new ArrayList<VentasVO>();
		
		//instancia de la conexión
		Conexion conex = new Conexion();

		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM ventas");
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			while (res.next()) {
				VentasVO Venta = new VentasVO();
				Venta.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				Venta.setCedula_usuario(Integer.parseInt(res.getString("cedula_usuario")));
				Venta.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Venta.setIva_venta(Integer.parseInt(res.getString("iva_venta")));
				Venta.setTotal_venta(Integer.parseInt(res.getString("total_venta")));
				Venta.setValor_venta(Integer.parseInt(res.getString("Valor_venta"))); 
				
				listaventas.add(Venta);
			}
			
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaventas;
	}

	public void eliminarVentas(Integer codigo_venta) {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "delete from ventas where codigo_venta=" + codigo_venta + ";";
			
			//impresion de verificación
			System.out.println("Registrado " + sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	public void actualizarVentas(VentasVO codigov) {
		
		//instancia de conexion
		Conexion conex = new Conexion();

		try {
			//inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();
			
			//String con la sentencia a ejecutar
			String sentencia = "UPDATE ventas "
					+ "SET cedula_usuario = '"+codigov.getCedula_usuario()+"',"
					+ "cedula_cliente = '"+codigov.getCedula_cliente()+"',"
					+ "iva_venta = '"+codigov.getIva_venta()+"',"
					+ "total_venta = '"+codigov.getTotal_venta()+"' "
					+ "valor_venta = '"+codigov.getValor_venta()+"' "
					+ "WHERE codigo_venta = "+codigov.getCodigo_venta()+";";
			
			//ejecuta la sentencia 
			estatuto.executeUpdate(sentencia);
			
			//verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);
			
			//cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo actualizar la Venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

}