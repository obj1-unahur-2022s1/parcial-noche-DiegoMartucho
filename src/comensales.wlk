import comidas.*

class Comensales
	{
 const comidasIngeridas = []
 
	method peso()
	
	method leAgrada(unaComida)
	
	method comer(unaComida)
		{
		comidasIngeridas.add(unaComida)
		}
	
	method pesoTotalComidas()
		{
		return comidasIngeridas.sum({ comida => comida.peso() })
		}	
	method estaSatisfecho()
		{
		return self.pesoTotalComidas() >= self.peso() * 0.01
		}
	}

class Vegetariano inherits Comensales
	{
	override method leAgrada(unaComida)
		{
		return unaComida.aptoVegetariano() and unaComida.valoracion() > 85
		}
		
	override method estaSatisfecho()
		{
		return super() and comidasIngeridas.all({ comida => not comida.esAbundante() })
		}
	}
	
class HambrePopular inherits Comensales
	{
	override method leAgrada(unaComida)
		{
		return unaComida.esAbundante()
		}
	}
	
class PaladarFino inherits Comensales
	{
	override method leAgrada(unaComida)
		{
		return unaComida.peso().between(150, 300) and unaComida.valoracion() >= 100
		}
		
	override method estaSatisfecho()
		{
		return super() and comidasIngeridas.size().even()
		}
	}