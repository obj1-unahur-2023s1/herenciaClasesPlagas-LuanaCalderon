import elementos.*

class Plaga { 
	var property poblacion
	
	method nivelDanio() {return 0}
	
	method transmiteEnfermedades() { return poblacion > 10 }
	
	method atacar(elemento) {
        self.consecuenciaAtaque()
		elemento.recibirDanio()
	}
	
	method consecuenciaAtaque() { poblacion = poblacion + (poblacion * 0.1) }
}


class Cucarachas inherits Plaga {
	var property pesoPromedio = 0
	
  override method nivelDanio() = poblacion / 2
  
  override method transmiteEnfermedades() {return super() and (pesoPromedio >= 10)}
  
  method recibirDanio() = poblacion + pesoPromedio * 2
}


class Pulgas inherits Plaga {
	
	  override method nivelDanio() = poblacion * 2
	  
	   override method transmiteEnfermedades() =  poblacion > 10 
}


class Garrapatas inherits Plaga {
	
	override method nivelDanio() = poblacion * 0.2
	
	override method transmiteEnfermedades() = poblacion > 10 	
	
	  method recibirDanio() = poblacion + 0.20 
	
}


class Mosquitos inherits Plaga  {
	
	override method nivelDanio() = poblacion
	
	override method transmiteEnfermedades() {return super() and (poblacion % 3 == 0) }	
}