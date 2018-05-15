class Persona {
//	var viajes = []
	
//	method viajes() {
//		return viajes
//	}
	
//	method viajoA(viaje) {
//		viajes.add(viaje)
//	}
	
	method enQuePaisesEstuvo(anioX) //{
//		var viajesEnAnioX = viajes.filter({viaje => viaje.anio() == anioX})
//		return viajesEnAnioX.map({viaje => viaje.pais()})
//	}
}

class Establecido inherits Persona {
	var property pais = "unPais"
	
	override method enQuePaisesEstuvo(anio) {
		return pais
	}
}

class Migrante inherits Persona {
	var property paisDeNacimiento = "paisDeNacimiento" 
	var property paisAlMudarse = "paisAlMudarse"
	var property anioDeMudanza = 0
	
	override method enQuePaisesEstuvo(anio){
		return 	if (anio > anioDeMudanza){
					paisDeNacimiento
				} else if (anio == anioDeMudanza){
					#{paisDeNacimiento, paisAlMudarse}
				} else {paisAlMudarse}
	}
}
class Doctor inherits Persona {
	var property paisDondeVive = "unPaisDondeVive"
	var property paisDondeEstudio = "UnPaisDondeEstudio"
	var property anioDeEstudio = []
	
	override method enQuePaisesEstuvo(anio){
		return if(anio.contains(anioDeEstudio)){
				self.comparacionDeAnios(anio, anioDeEstudio, paisDondeEstudio, paisDondeVive)
			} else {paisDondeVive}
	}
	
	method comparacionDeAnios(anio, anioEst, paisEst, paisVive){
		return if ((anio == anioEst.first()) or (anio == anioEst.last()) ){
				#{paisEst, paisVive}
			} else { paisEst }
	}
}