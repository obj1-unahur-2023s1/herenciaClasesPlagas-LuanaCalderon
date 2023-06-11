import plagas.*

class Elemento{
	method esBueno()
	
}

class Barrio inherits Elemento {
	
    const elementos = []
    
	var  property esCopado = true
	
        method cantidadElementosBuenos() { return elementos.count({e => e.esBueno()}) }
        
        method cantidadElementoMalos() { return elementos.count({e => not e.esBueno()})}
        
	    method esCopado() { return self.cantidadElementosBuenos() > self.cantidadElementoMalos() }
	
}

class Hogar inherits Elemento {
	var property nivelDeMugre
	var property confort = 100
	
	override method esBueno() { return nivelDeMugre <= (confort / 2) }
	
	method consecuenciaDeAtaque(plaga) { nivelDeMugre = nivelDeMugre + plaga.nivelDanio() }
	
	
}

class Huerta inherits Elemento {
	var property capacidadDeProduccion = 0
	var property produccionEsperada
	
	override method esBueno() { return capacidadDeProduccion > produccionEsperada }
	
	method recibirDanio(plaga) { if(plaga.transmiteEnfermedades()) { capacidadDeProduccion -= ((plaga.nivelDanio() * 0.1) + 10) } 
		else { capacidadDeProduccion -= (plaga.nivelDanio() * 0.1) } }
}


class  Mascota inherits Elemento {
	var property nivelDeSalud 
	
	override method esBueno() = nivelDeSalud > 250 
	
	method recibirDanio(plaga) { if (plaga.transmiteEnfermedades()) { nivelDeSalud -= plaga.nivelDanio() } }
}



