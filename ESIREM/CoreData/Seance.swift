//
//  Seance.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol Seance {
    var Debut : Date {
        set get
    }
    
    var Fin : Date {
        set get
    }
}

extension CDSeance : Seance {
    var Debut: Date {
        get {
            return cdDebut!
        }
        set {
            cdDebut = newValue
        }
    }
    
    var Fin: Date {
        get {
            return cdFin!
        }
        set {
            cdFin = newValue
        }
    }
}
