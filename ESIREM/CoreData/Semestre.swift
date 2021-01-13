//
//  Semestre.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol  Semestre:class {
    var annee : Float {
        set get
    }
    var NSemestre : Float {
        set get
    }
    func add(matiere:Matiere)
    func remove(matiere:Matiere)
}

extension CDSemestre : Semestre {
    
    func add(matiere: Matiere) {
        self.addToCdMatiere(matiere as! CDMatiere)
    }
    
    func remove(matiere: Matiere) {
        self.removeFromCdMatiere(matiere as! CDMatiere)

    }

    var annee : Float {
        set{
            cdAnnee = newValue
        }
        get{
            return cdAnnee
        }
    }
    var NSemestre : Float {
        set{
            cdNSemestre = newValue
        }
        get{
            return cdNSemestre
        }
    }
}
