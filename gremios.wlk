import magos.*

class Gremio {
    var integrantes

    method initialize() {
        if(integrantes.size() < 2)
            throw new Exception(message = "No se puede crear un gremio con menos de 2 integrantes")
    }

    method magoLider() {
        return integrantes.max({unIntegrante => unIntegrante.poderTotal()})
    }

    method poderTotal() {
        return integrantes.sum({unIntegrante => unIntegrante.poderTotal()})
    }

    method reservaDeEnergiaMagica() {
        return integrantes.sum({unIntegrante => unIntegrante.puntosDeEnergiaMagica()})
    }

    method resistenciaMagica() {
        return integrantes.sum{unIntegrante => unIntegrante.resistenciaMagica()}
    }

    method desafiar(unGremioOMago) {
        if(unGremioOMago.esVencidoPor(self))
            unGremioOMago.transferirPuntosDeEnergia(self)
    }

    method esVencidoPor(unGremio) {
        return unGremio.poderTotal() > self.resistenciaMagicaDeGremioYLider()
    }

    method resistenciaMagicaDeGremioYLider() {
        return self.resistenciaMagica() + self.resistenciaMagicaMagoLider()
    }

    method resistenciaMagicaMagoLider() {
        return self.magoLider().resistenciaMagica()
    }

    method sumarEnergiaMagica(unaCantidadDePuntos) {
        self.magoLider().sumarEnergiaMagica(unaCantidadDePuntos)
    }

    method transferirPuntosDeEnergia(unGremio) {
        integrantes.forEach({unIntegrante => unIntegrante.transferirPuntosDeEnergia()})
    }

}

//B)3. No hace falta ningun cambio para cumplir este requerimiento, ya que el mago lider es aquel que tiene mayor poder total en la lista de integrantes del gremio.
//     Si los integrantes del gremio son mas gremios, entonces en el gremio mas grande se estará buscando con el "unIntegrante.poderTotal()" al mago lider de cada gremio
//     integrante para luego saber cual de todos esos lideres es el mago lider "supremo" (aquel que ahora tenga mayor poder total entre los magos lideres)