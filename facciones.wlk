class Personaje{
    const fuerza
    const inteligencia
    var rol

    method potencialOfensivo(){
        return fuerza * 10 + rol.extra()
    }
    // es una clase abstracta, no puede generar instancias.
    method esInteligente()
    method esGroso() = self.esInteligente() || rol.esGroso(self) 
}

class Humano inherits Personaje{
   
}
class Orco inherits Personaje{
   override method potencialOfensivo(){
        return
        if (rol.toString() == brujo.toString()) super() * 1.1
        else super()
    }
} 



object Guerrero{
   method extra() = 100
   method esGroso(unPersonaje) = unPersonaje.fuerza() > 50
}

class Cazador{
  const mascota
  method extra() = mascota.potencialOfensivo()
  method esGroso() = mascota.esLongeva() 
}

class Mascota{
    const fuerza
    var edad
    const garras
    method cumplirAños(){edad += 1}  
    method esLongeva() = edad > 10 
    method potencialOfensivo(){
        if(garras){return fuerza * 2}
        else {return fuerza}
    }
}

object noTieneMascota{
    method potencialOfensivo() = 0 
}

object brujo{
    method extra() =  1
    method esGroso() = true
}

class Localidad{
    var ejercito
    method poderDefensivo() = ejercito.poderOfensivo()
    method serOcupada(unEjercito)
}

class Aldea inherits Localidad{
    const maximaTropa
    method initialize(){
        if(maximaTropa<10){
            self.error("La poblacion debe ser mayor a 10")
        }
    }
    override method serOcupada(unEjercito){
        if(maximaTropa < unEjercito.tamañoTropas()){
            ejercito = new Ejercito(tropa=unEjercito.losMasPoderosos())
            unEjercito.quitarLosMasFuertes(ejercito)
        }
        else {ejercito = unEjercito}
    }
}
class Ciudad inherits Localidad{
  override method poderDefensivo() = super() + 300  
  override method serOcupada(unEjercito){
    ejercito = unEjercito
  }
}

class CiudadGrande inherits Ciudad{

}

class CiudadRica inherits Ciudad{

}

class Ejercito{
  const tropa = []
  method tamañoTropas() = tropa.size()
  method ordenadosLosMasPoderosos() = tropa.sortBy({t1,t2 => t1.potencialOfensivo()> t2.potencialOfensivo()}) 
  method losMasPoderosos() = self.ordenadosLosMasPoderosos().take(10)  
  method quitarLosMasFuertes() = tropa.removeAll(self.losMasPoderosos())  
  method poderOfensivo() = tropa.sum({personaje => personaje.potencialOfensivo()})
  method puedeInvadir(unaLocalidad) = self.poderOfensivo() > unaLocalidad.poderDefensivo() 
  method invadir(unaLocalidad) {
    if(self.puedeInvadir(unaLocalidad)){
        unaLocalidad.serOcupada(self)
    }
  } 
}