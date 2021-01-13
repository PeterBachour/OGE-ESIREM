//
//  Examen.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation
import  CoreData

protocol Examen:class {
    
    var titre : String {
        set get
    }
    var Matiere : Matiere {
        set get
    }
    var Poids : Float {
        set get
    }
    var note : [Notes] {
        get
    }
}

extension CDExamen : Examen {
    var titre: String {
        get {
            return cdTitre!
        }
        set {
            cdTitre = newValue
        }
    }
    
    
    var note : [Notes] {
        get {
            return self.cdNote!.sorted(by: { (a, b) -> Bool in
                return (a as! Notes).Examen.Matiere.Code < (b as! Notes).Examen.Matiere.Code
            }) as! [Notes]
        }
    }
    
    var Matiere : Matiere {
        set{
            cdExMatiere = newValue as? CDMatiere
        }
        get{
            return cdExMatiere! as Matiere
        }
    }
    
    var Poids : Float {
        set{
            cdPoids = newValue
        }
        get{
            return cdPoids
        }
    }
}
