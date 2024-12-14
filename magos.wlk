import objetosMagicos.*
import gremios.*

class Mago {
    const nombre
    var objetosMagicos = #{}
    const poderInnato
    var resistenciaMagica
    var puntosDeEnergiaMagica
    var categoria

    method poderTotal() {
        return poderInnato * self.sumatoriaDePoderDeObjetosMagicos()
    }

    method sumatoriaDePoderDeObjetosMagicos() {
        return objetosMagicos.sum({unObjeto => unObjeto.poder(self)})
    }

    method tieneNombreConCantidadParDeLetras() {
        return self.cantidadDeLetrasEnNombre().even()
    }

    method resistenciaMagica() {
        return resistenciaMagica
    }

    method cantidadDeLetrasEnNombre() {
        return nombre.length()
    }

    method desafiar(unMago) {
        if(unMago.esVencidoPor(self))
            unMago.transferirPuntosDeEnergia(self)
    }

    method esVencidoPor(unMagoAtacante) {
        return categoria.esVencido(self, unMagoAtacante)
    }

    method puntosDeEnergiaPerdidos() {
        return categoria.puntosPerdidos(self)
    }

    method puntosDeEnergiaMagica() {
        return puntosDeEnergiaMagica
    }

    method sumarEnergiaMagica(unaCantidadDePuntos) {
        puntosDeEnergiaMagica += unaCantidadDePuntos
    }

    method restarEnergiaMagica(unaCantidadDePuntos) {
        puntosDeEnergiaMagica -= unaCantidadDePuntos
    }

    method transferirPuntosDeEnergia(unMago) {
        const puntosDeEnergia = self.puntosDeEnergiaPerdidos()

        self.restarEnergiaMagica(puntosDeEnergia)
        unMago.sumarEnergiaMagica(puntosDeEnergia)
    }
}

object aprendiz {
    method esVencido(unMago, magoAtacante) {
        return unMago.resistenciaMagica() < magoAtacante.poderTotal()
    }

    method puntosPerdidos(unMago) {
        return unMago.puntosDeEnergiaMagica() / 2
    }
}

object veterano {
    method esVencido(unMago, magoAtacante) {
        return magoAtacante.poderTotal() >= 1.5 * unMago.resistenciaMagica()
    }

    method puntosPerdidos(unMago) {
        return unMago.puntosDeEnergiaMagica() / 4
    }
}

object inmortal {
    method esVencido(unMago, magoAtacante) {
        return false
    }

    method puntosPerdidos(unMago) {     // No pareciera necesario porque si es inmortal nunca entra a este método, pero está solo para cumplir polimorfismo
        return 0
    }
}
