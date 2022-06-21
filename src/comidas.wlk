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
 
	override method valoracion() = if(self.esEspecial()) {return 120} else {return 80}
 
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
		return super() +
		if (legumbreBase.size() * 2 <= 17)
			{
			return legumbreBase.size() * 2
			}
		else 
			{
			return 0
			}
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
		return cortesDeCarne.sum({ cortes => cortes.peso() })
		}
	
	method corteDeMasCalidad()
		{
		return cortesDeCarne.max({ cortes => cortes.calidad() })
		}
	
	override method valoracion()
		{
		if(15 * self.corteDeMasCalidad().calidad() - cortesDeCarne.size() >= 0)
			{
			return 15 * self.corteDeMasCalidad().calidad() - cortesDeCarne.size()
			}
		else { return 0 }
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

/* OTRA POSIBLE SOLUCION:
 * 
 object asado
	{
	method calidad() = 2
	
	method peso() = 800
	}

object vacio
	{
	method calidad() = 3
	
	method peso() = 1200
	}
	
object matambreDeCerdo
	{
	method calidad() = 1
	
	method peso() = 1350
	}
 */	
	
	
	