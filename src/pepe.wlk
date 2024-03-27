object sofia {
	var categoria = gerente
	var bonoResultado = porcentaje
	
	method categoria(){
		return categoria
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	
	method sueldo(){
		return categoria.neto() + bonoResultado.bono(self)*1.3
	}
	
}

object vendedor{
	var hayMuchasVentas = false
	
	method activarAumentoPorMuchasVentas(){
		hayMuchasVentas = true
	}
	
	method desactivarAumentoPorMuchasVentas(){
		hayMuchasVentas = false
	}
	method neto(){
		return if (hayMuchasVentas) 20000 else 16000
	}
	
}

object medioTiempo{
	var categoriaBase = cadete
	
	method categoriaBase(_categoria){
		categoriaBase = _categoria
	}
	method neto(){
		return categoriaBase.neto()/2
	}
}

object roque{
	var bonoResultado = porcentaje
	method neto(){
		return 28000
	}
	method categoria(){
		return self
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	
	method sueldo(){
		return self.neto() + bonoResultado.bono(self) + 9000
	}
}

object pepe {
	var categoria = gerente
	var bonoResultado = porcentaje
	var faltas = 0
	var bonoPorPresentismo = normal
	
	method faltas(){
		return faltas
	}
	
	method categoria(){
		return categoria
	}
	
	method bonoPorPresentismo(_bonoPorPresentismo){
		bonoPorPresentismo = _bonoPorPresentismo
	}
	
	method faltas(_faltas){
		faltas = _faltas
	}
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	
	method categoria(_categoria){
		categoria = _categoria
	}
	method sueldo(){
		return categoria.neto() + bonoResultado.bono(self) + bonoPorPresentismo.bono(self)
	}
}

object normal{
	method bono(persona){
		return if (persona.faltas() > 1) 0
		else 2000 - persona.faltas() * 1000
	}
}

object ajuste{
	method bono(persona){
		return if (persona.faltas() == 0) 100 else 0
	}
}

object demagogico{
	method bono(persona){
		return if (persona.categoria().neto() < 18000) 500 else 300
	}
}

object porcentaje{
	method bono(persona){
		return persona.categoria().neto() * 0.10
	}
}

object montoFijo{
	method bono(persona){
		return 800
	}
}

object gerente {
	method neto(){
		return 15000
	}
}

object cadete {
	method neto(){
		return 20000
	}
}

object nulo {
	method bono(persona){
		return 0
	} 
}

object ernesto{
	var companhero = pepe
	var bonoPorPresentismo = normal
	
	method faltas(){
		return 0
	}
	
	method bonoPorPresentismo(_bonoPorPresentismo){
		bonoPorPresentismo = _bonoPorPresentismo
	}
	method companhero(_companhero){
		companhero = _companhero
	}
	
	method sueldo(){
		return companhero.categoria().neto() + bonoPorPresentismo.bono(self)
	}
}