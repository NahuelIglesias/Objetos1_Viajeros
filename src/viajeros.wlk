import viajes.*

class Persona {
	var viajes = []
	
	method viajes() {
		return viajes
	}
	
	method viajoA(viaje) {
		viajes.add(viaje)
	}
	
	method enQuePaisesEstuvo(anioX) {
		var viajesEnAnioX = viajes.filter({viaje => viaje.anio() == anioX})
		return viajesEnAnioX.map({viaje => viaje.pais()})
	}
}

class Establecido inherits Persona {
	var property paisResidencia = argentina
	
	override method enQuePaisesEstuvo(anio) {
		return super(anio).add(paisResidencia)
	}
}

class Migrante inherits Persona {
	var property paisDeNacimiento = argentina 
	var property paisDeInmigracion = chile
	var property anioDeInmigracion = 2018
	
	override method enQuePaisesEstuvo(anio){
		return super(anio).addAll(self.deNacimientoOrInmigracion(anio))
	}
	
	method deNacimientoOrInmigracion(anio) {
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
	var property paisDondeVive = "unPaisDondeVive"
	var property paisDondeEstudio = "UnPaisDondeEstudio"
	var property aniosDeEstudio = []
	
	override method enQuePaisesEstuvo(anio){
		return if(anio.contains(aniosDeEstudio)){
				self.comparacionDeAnios(anio, aniosDeEstudio, paisDondeEstudio, paisDondeVive)
			} else {paisDondeVive}
	}
	
	method comparacionDeAnios(anio, anioEst, paisEst, paisVive){
		return if ((anio == anioEst.first()) or (anio == anioEst.last()) ){
				#{paisEst, paisVive}
			} else { paisEst }
	}
}