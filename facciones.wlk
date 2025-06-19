class Personaje{
    const fuerza
    const inteligencia
    var rol
}

class rol{

}

class Guerrero inherits rol{

}

class Cazador inherits rol{
  const mascota
}

class Mascota{
    const fuerza
    var edad
    const garras
    method tieneGarras() = garras
    method cumplirAños(){edad += 1}  
}

class NoTieneMascota{

}

class Brujo inherits rol{
  
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