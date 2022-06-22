import comidas.*
import comensales.*

object cocina
	{
 const comidasPreparadas = []
 
	method tieneBuenaOfertaVege()
		{
		return self.cantidadDeComidasVeges() - self.cantidadDeComidasNoVeges() <= 2
		or self.cantidadDeComidasNoVeges() - self.cantidadDeComidasVeges() <= 2
		}
	
	method platoFuerteCarnivoro()
		{
		comidasPreparadas.filter({ comida => not comida.aptoVegetariano()}).max({ comida => comida.valoracion() })
		}
		
	method comidasAGusto(unComensal)
		{
		return comidasPreparadas.filter({ comida => unComensal.leAgrada(comida) })
		}
		
	method cantidadDeComidasVeges()
		{
		return comidasPreparadas.count({ comida => comida.aptoVegetariano() })
		}
		
	method cantidadDeComidasNoVeges()
		{
		return comidasPreparadas.count({ comida => not comida.aptoVegetariano() })
		}
			
	}