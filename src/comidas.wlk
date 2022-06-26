class Plato
	{
	method valoracion()
	
	method peso()
	
	method aptoVegetariano()
	
	method esAbundante() = self.peso() > 250
	}
	
class Provoleta inherits Plato
	{
 var peso
 const property tieneEspecias
 
	override method valoracion() = if(self.esEspecial()) {120} else {80}
 
	override method aptoVegetariano() = not tieneEspecias
		
	override method peso() = peso
		
	method esEspecial() = self.esAbundante() or tieneEspecias
	}

class HamburguesaDeCarne inherits Plato
	{
 var pan 
 
	override method peso() = 250
	
	override method aptoVegetariano() = false
	
	override method valoracion() = 60 + pan.valor()
	}
	
class HamburguesaVegetariana inherits HamburguesaDeCarne
	{
 var legumbreBase 
 
	override method aptoVegetariano() = true
	
	override method valoracion()
		{
		return super() + 17.min(legumbreBase.size() * 2)
		}
	}
	
class Parrillada inherits Plato
	{
 const cortesDeCarne = []
 
	method ponerCorte(corte)
		{
		cortesDeCarne.add(corte)
		}
		
	method sacarCorte(corte)
		{
		cortesDeCarne.remove(corte)
		}
 
	override method aptoVegetariano() = false

	override method peso()
		{
		return cortesDeCarne.sum({ corte => corte.peso() })
		}
	
	method corteDeMasCalidad()
		{
		return cortesDeCarne.max({ corte => corte.calidad() })
		}
	
	override method valoracion()
		{
		return 0.max(15 * self.corteDeMasCalidad().calidad() - cortesDeCarne.size())
	}
}

object panIndustrial
	{
	method valor() = 0
	}
	
object panCasero
	{
	method valor() = 20
	}
	
object panMasaMadre
	{
	method valor() = 45
	}
	
class CortesDeCarne
	{
 const property calidad
 const property peso
	}
