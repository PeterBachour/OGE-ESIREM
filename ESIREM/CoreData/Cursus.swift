//
//  Cursus.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol  Cursus {
    var nom : String {
        set get
    }
}

extension CDCursus : Cursus {
    var nom : String {
        set {
            cdNom = newValue
        }
        get {
            return cdNom!
        }
    }
}
