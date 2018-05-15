import viajes.*

class Viajero {
	var viajes = #{}
	
	method viajes() {
		return viajes
	}
	
	method viajoA(viaje) {
		viajes.add(viaje)
	}
	
//	method enQuePaisesEstuvo(anioX) {
//		var viajesEnAnioX = viajes
//		
//		viajesEnAnioX.filter({viaje => viaje.anio() == anioX})
//		viajesEnAnioX.map({viaje => viaje.pais()})
//		
//		return viajesEnAnioX.addAll(self.paisesDeResidencia(anioX))
//	}

	method enQuePaisesEstuvo(anio) { // MOD template method
		return self.paisesDeResidencia(anio) + self.paisesDeTurista(anio)
	}
	
	method paisesDeResidencia(anioX)
	method paisesDeTurista(anioX) {
		return viajes
			.filter({viaje => viaje.anio() == anioX})
			.map({viaje => viaje.pais()})
			.asSet()
	}
}

//------Tipos de viajeros------
class Establecido inherits Viajero {
	var paisResidencia = "Argentina"
	
	method viveEn(pais) {
		paisResidencia = pais
	}
	
	override method paisesDeResidencia(anioX) {
		return #{paisResidencia}
	}
}


class Migrante inherits Viajero {
	var paisNacimiento = "Argentina"
	var paisInmigracion = "Chile"
	var anioInmigracion = 2018
	
	method nacioEn(pais) {
		paisNacimiento = pais
	}
	
	method migroA(pais, anio) {
		paisInmigracion = pais
		anioInmigracion = anio
	}
	
	override method paisesDeResidencia(anioX) {
		return if (anioX > anioInmigracion) {
			#{paisNacimiento}
		} else if (anioX == anioInmigracion) {
			#{paisNacimiento, paisInmigracion}
		} else {
			#{paisInmigracion}
		}
	}
}


class Doctor inherits Viajero {
	var paisResidencia = "Argentina"
	var paisEstudios = "Chile"
	var anioInicioEstudios = 2014
	var anioFinalEstudios = 2018
	
	method viveEn(pais) {
		paisResidencia = pais
	}
	method vaAEstudiar(pais, anioInicio, anioFin) {
		paisEstudios = pais
		anioInicioEstudios = anioInicio
		anioFinalEstudios = anioFin
	}
	
	override method paisesDeResidencia(anioX) {
		return if (anioX < anioInicioEstudios or anioX > anioFinalEstudios) {
			#{paisResidencia}
		} else if (anioX == anioInicioEstudios) {
			#{paisResidencia, paisEstudios}
		} else {
			#{paisEstudios}
		}
	}
/*
 	override method enQuePaisesEstuvo(anio){
		return if(anio.contains(aniosDeEstudio)){
				self.entreAnios(anio, aniosDeEstudio, paisDeResidencia, paisDeEstudios)
			} else {paisDeResidencia}
	}
	
	method entreAnios(anioX, anios, paisResidencia, paisEstudios){
		return if ((anioX == anios.first()) or (anioX == anios.last()) ){
				#{paisResidencia, paisEstudios}
			} else { paisEstudios }
	}
*/
}

class Menor inherits Viajero {
	var madre = madreX
	
	method esHijoDe(persona) {
		madre = persona
	}
	
	override method paisesDeResidencia(anioX) {
		return madre.paisesDeResidencia(anioX)
	}
}