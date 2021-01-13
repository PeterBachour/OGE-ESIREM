//
//  Matiere.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol Matiere : class {
    var Titre : String {
        set get
    }
    var Credit : Float {
        set get
    }
    var Code : String {
        set get
    }
    var Semestre : Semestre {
        get set
    }
    func add(examen:Examen)
    func remove(examen:Examen)
    func addSeance(seance: Seance)
    func removeSeance(seance: Seance)
    func noteFinal(etud: Etudiant)-> Float
}
   

extension CDMatiere : Matiere {

    func addSeance(seance: Seance) {
        self.addToCdSeance(seance as! CDSeance)
    }
    
    func removeSeance(seance: Seance) {
        self.removeFromCdSeance(seance as! CDSeance)
    }

    
    func noteFinal(etud: Etudiant)-> Float {
        var m : Float = 0
        for v in etud.note {
            if v.Examen.Matiere === self {
                m = m + v.Note
            }
        }
        return m/5
    }
    
    
    func add(examen: Examen) {
        self.addToCdExamen(examen as! CDExamen)
    }
    
    func remove(examen: Examen) {
        self.removeFromCdExamen(examen as! CDExamen)
    }
    
    var Semestre : Semestre {
        set{
            cdSemestre = newValue as? CDSemestre
        }
        get{
            return (cdSemestre! as CDSemestre)
        }
    }
    
    var Titre : String {
        set{
            cdTitre = newValue
        }
        get{
            return cdTitre!
        }
    }
    var Credit : Float {
        set{
            cdCredit = newValue
        }
        get{
            return cdCredit
        }
    }
    var Code : String {
        set{
            cdCode = newValue
        }
        get{
            return cdCode!
        }
    }
}
