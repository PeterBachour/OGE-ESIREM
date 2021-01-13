//
//  Note.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol Notes : class {
    var Coeff : Float {
        set get
    }
    var Etudiant : Etudiant {
        set get
    }
    var Note : Float {
        set get
    }
    var Examen : Examen {
        set get
    }
}

extension CDNote : Notes {
    var Coeff : Float {
        get {
            return cdCoeff
        }
        set {
            cdCoeff = newValue
        }
    }
    var Etudiant : Etudiant {
        set {
            cdNoteEtudiant = newValue as? CDEtudiant
        }
        get {
            return cdNoteEtudiant! as Etudiant
        }
    }
    var Note : Float {
        set{
            cdNote = newValue
        }
        get{
            return cdNote/20*cdCoeff
        }
    }
    var Examen : Examen {
        set{
            cdNoteExamen = newValue as? CDExamen
        }
        get
        {
            return cdNoteExamen! as Examen
        }
    }
}
