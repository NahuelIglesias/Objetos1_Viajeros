import viajes.*

class Persona {
	var viajes = []
	
	method viajes() {
		return viajes
	}
	
	method viajoA(viaje) {
		viajes.add(viaje)
	}
	
	method paisesDeResidencia(anio)
	
	method enQuePaisesEstuvo(anioX) {
		var viajesEnAnioX = viajes
		
		viajesEnAnioX.filter({viaje => viaje.anio() == anioX})
		viajesEnAnioX.map({viaje => viaje.pais()})
		viajesEnAnioX.asSet()
		
		return viajesEnAnioX.addAll(self.paisesDeResidencia(anioX))
	}
}

class Establecido inherits Persona {
	var property paisResidencia = "Argentina"
	
	override method paisesDeResidencia(anio) {
		return #{paisResidencia}
	}
}

class Migrante inherits Persona {
	var property paisDeNacimiento = "Argentina"
	var property paisDeInmigracion = "Chile"
	var property anioDeInmigracion = 2018
	
	override method paisesDeResidencia(anio) {
		return if (anio > anioDeInmigracion) {
			#{paisDeNacimiento}
		} else if (anio == anioDeInmigracion) {
			#{paisDeNacimiento, paisDeInmigracion}
		} else {
			#{paisDeInmigracion}
		}
	}
}
class Doctor inherits Persona {
	var property paisDeResidencia = "Argentina"
	var property paisDeEstudios = "Chile"
	var property aniosDeEstudio = []
	
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
}