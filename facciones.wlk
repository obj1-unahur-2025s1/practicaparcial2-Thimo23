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
}

class Cazador{
  const mascota
  method extra() = mascota.potencialOfensivo()
}

class Mascota{
    const fuerza
    var edad
    const garras
    method cumplirAños(){edad += 1}  
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
}

class Localidad{

}

class Aldea inherits Localidad{
    const habitantes = []
    const tamaño
    method cantidadMaximaHab() = tamaño

}
class Ciudad inherits Localidad{

}

class CiudadGrande inherits Ciudad{

}

class CiudadRica inherits Ciudad{

}

class Ejercito{}