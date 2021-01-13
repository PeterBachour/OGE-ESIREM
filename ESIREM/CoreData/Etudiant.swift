//
//  Etudiant.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation

protocol  Etudiant {
    var firstname : String {
        set get
    }
    var lastname : String {
        set get
    }
    var matricule : String {
        set get
    }
    var note : [Notes]{
        get
    }
    func add(note:Notes)
    func remove(note:Notes)
    
    func matieres()->[Matiere]
    }

extension CDEtudiant : Etudiant {
    
    func remove(note: Notes) {
        self.removeFromCdNoteEtudiant(note as! CDNote)
    }
    
    func add(note: Notes) {
        self.addToCdNoteEtudiant(note as! CDNote)
    }
    
    func matieres() -> [Matiere] {
        var r=[Matiere]()
        
        for n in self.note{
            let m=n.Examen.Matiere
            if r.contains(where: { (x) -> Bool in
                return x === m
            })==false
            {
                r.append(m)
            }
        }
        return r
    }
    var note : [Notes] {
        get {
            return self.cdNoteEtudiant?.sorted(by: { (a, b) -> Bool in
                return (a as! Notes).Examen.Matiere.Code < (b as! Notes).Examen.Matiere.Code
            }) as! [Notes]
        }
        
    }
    var firstname : String {
        set{
            cdFirstName = newValue
        }
        get{
            return cdFirstName!
        }
    }
    var lastname : String {
        set{
            cdLastName = newValue
        }
        get{
            return cdLastName!
        }
    }
    var matricule : String {
        set{
            cdMatricule = newValue
        }
        get{
            return cdMatricule!
        }
    }
}