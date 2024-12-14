import magos.*

class VaritaYTunicas {
    const poderBase

    method poder(unMago) {
        return poderBase + self.poderExtra(unMago)
    }

    method poderExtra(unMago)
}

class Varita inherits VaritaYTunicas {
    override method poderExtra(unMago) {
        if(unMago.tieneNombreConCantidadParDeLetras())
            return poderBase * 0.5
        else
            return 0
    }
}

class Tunica inherits VaritaYTunicas {
    override method poderExtra(unMago) {
        return unMago.resistenciaMagica() * 2 + self.extraPorRarezaDeTunica()
    }

    method extraPorRarezaDeTunica()
}

class TunicaComun inherits Tunica {
    override method extraPorRarezaDeTunica() {
        return 0
    }
    
}

class TunicaEpica inherits Tunica {
    override method extraPorRarezaDeTunica() {
        return 10
    }
}

object amuleto {
    method poder(unMago) {
        return 200
    }
}

object ojotaMagica {
    method poder(unMago) {
        return 10 * unMago.cantidadDeLetrasEnNombre()
    }
}