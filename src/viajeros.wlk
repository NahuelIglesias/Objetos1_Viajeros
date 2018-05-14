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
	override method enQuePaisesEstuvo(anio) {
		
	}
}