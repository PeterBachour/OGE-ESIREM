//
//  Facade.swift
//  ESIREM
//
//  Created by Peter Bachour on 13/01/2021.
//

import Foundation
import CoreData
import UIKit

class Facade {
    private let objctx = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private static var instance : Facade?=nil
    
    private init(){
        
    }
    
    public static func getInstance() -> Facade {
        if let x = instance {
            return x
        }
        else{
            instance = Facade()
            return instance!
        }
    }
    
    func etudiant() throws -> Etudiant  {
        let request = NSFetchRequest<CDEtudiant>(entityName: "CDEtudiant")
        return try objctx.fetch(request) as! Etudiant
    }
    func createEtudiant(firstname :String, lastname: String, nbEtudiant: String, adress: String, mail: String, photoName: String, dob: String)-> Etudiant {
        var etudiant = NSEntityDescription.insertNewObject(forEntityName: "CDEtudiant", into: objctx) as! Etudiant
        etudiant.firstname = firstname
        etudiant.lastname = lastname
        etudiant.nbEtudiant = nbEtudiant
        etudiant.adress = adress
        etudiant.mail = mail
        etudiant.photo = photoName
        etudiant.dob = dob
        return etudiant
    }
    
    func createSemestre(semestre: Float , annee: Float )-> Semestre{
        let semestre1 = NSEntityDescription.insertNewObject(forEntityName: "CDSemestre", into: objctx) as! Semestre
        semestre1.annee = annee
        semestre1.NSemestre = semestre
        return semestre1
    }
    
    func createMatiere(titre: String, credit: Float, Code: String, semestre: Semestre)-> Matiere {
        let matiere = NSEntityDescription.insertNewObject(forEntityName: "CDMatiere", into: objctx) as! Matiere
        matiere.Titre = titre
        matiere.Credit = credit
        matiere.Code = Code
        matiere.Semestre = semestre
        return matiere
    }
    func createSeance(debut : Date , fin :Date)-> Seance{
        var seance = NSEntityDescription.insertNewObject(forEntityName: "CDSeance", into: objctx) as! Seance
        seance.Debut = debut
        seance.Fin = fin
        return seance
    }
    
    func createExamen(titre : String, poids: Float, matiere: Matiere)->Examen{
        let examen = NSEntityDescription.insertNewObject(forEntityName: "CDExamen", into: objctx) as! Examen
        examen.Poids = poids
        examen.Matiere = matiere
        examen.titre = titre
        return examen
    }
    
    func createNote(examen: Examen, note: Float, coeff : Float, matiere :Matiere, etudiant: Etudiant) {
        let notes = NSEntityDescription.insertNewObject(forEntityName: "CDNote", into: objctx) as! Notes
        if note <= 20 && note >= 0 {
            notes.Note = note
            notes.Coeff = coeff
            etudiant.add(note: notes)
        }
        notes.Examen = examen
        notes.Examen.Matiere = matiere
    }
    func createCursus(nom: String, etudiant: Etudiant)->Cursus {
        var cursus = NSEntityDescription.insertNewObject(forEntityName: "CDCursus", into: objctx) as! Cursus
        cursus.nom = nom
        return cursus
    }
    
    func calculeMoyenne(etudiant : Etudiant)->Float {
        var moyenne :Float = 0
        var credtot :Float = 0
        
        for n in etudiant.note {
            let m=n.Examen.Matiere
            moyenne = moyenne + m.noteFinal(etud: etudiant)*m.Credit
            credtot = credtot + m.Credit
        }
        return moyenne/credtot
    }
    
    func seance()->[Seance]{
        var seances = [Seance]()
        let v = createSeance(debut: Date(), fin: Date().addingTimeInterval(15))
        seances.append(v)
        return seances
    }
    
    
    func remplir()->Etudiant {
        
        let etudiant = createEtudiant(firstname: "Peter", lastname: "Bachour", nbEtudiant: "pb912525", adress: "21000, Dijon", mail: "peter_bachour@icloud.com", photoName: "peter", dob: "15/09/1998")
        let semestre1 = createSemestre(semestre: 1, annee: 2020)
        let semestre2 = createSemestre(semestre: 2, annee: 2020)
        let cpp = createMatiere(titre: "C++", credit: 6, Code: "CPP20", semestre: semestre2)
        let db = createMatiere(titre: "Base de Donnée", credit: 5, Code: "BDD20", semestre: semestre2)
        let ios = createMatiere(titre: "Programmation IOS", credit: 6, Code: "IOS20", semestre: semestre2)
        let web = createMatiere(titre: "Developpement WEB", credit: 5, Code: "WEB20", semestre: semestre2)
        
        let genie = createMatiere(titre: "Genie Logiciel", credit: 5, Code: "GEL20", semestre: semestre1)
        let marketing = createMatiere(titre: "Marketing", credit: 2, Code: "MKT20", semestre: semestre1)
                
        semestre1.add(matiere: genie)
        semestre1.add(matiere: marketing)
        
        semestre2.add(matiere: cpp)
        semestre2.add(matiere: db)
        semestre2.add(matiere: ios)
        semestre2.add(matiere: web)
        
        let tpc = createExamen(titre: "TPC",poids: 30, matiere: cpp)
        let partiel = createExamen(titre: "Partiel",poids: 30, matiere: cpp)
        let final = createExamen(titre: "Final",poids: 40, matiere: cpp)

        let tpc1 = createExamen(titre: "TPC",poids: 30, matiere: db)
        let partiel1 = createExamen(titre: "Partiel",poids: 30, matiere: db)
        let final1 = createExamen(titre: "Final",poids: 40, matiere: db)
        
        let tpc2 = createExamen(titre: "TPC",poids: 30, matiere: ios)
        let final2 = createExamen(titre: "Final",poids: 70, matiere: ios)
        
        let tpc3 = createExamen(titre: "TPC",poids: 30, matiere: web)
        let partiel3 = createExamen(titre: "Partiel",poids: 30, matiere: web)
        let final3 = createExamen(titre: "Final",poids: 40, matiere: web)
        
        let tpc4 = createExamen(titre: "TPC",poids: 30, matiere: marketing)
        let final4 = createExamen(titre: "Final",poids: 70, matiere: marketing)
        
        let tpc5 = createExamen(titre: "TPC",poids: 30, matiere: genie)
        let partiel5 = createExamen(titre: "Partiel",poids: 30, matiere: genie)
        let final5 = createExamen(titre: "Final",poids: 40, matiere: genie)
        
        createNote(examen: tpc, note: 17, coeff: tpc.Poids, matiere: cpp , etudiant: etudiant)
        createNote(examen: partiel, note: 16, coeff: partiel.Poids, matiere: cpp, etudiant: etudiant)
        createNote(examen: final, note: 13, coeff: final.Poids, matiere: cpp, etudiant: etudiant)
        
        createNote(examen: tpc1, note: 19, coeff: tpc1.Poids, matiere: db , etudiant: etudiant)
        createNote(examen: partiel1, note: 17, coeff: partiel1.Poids, matiere: db, etudiant: etudiant)
        createNote(examen: final1, note: 16, coeff: final1.Poids, matiere: db, etudiant: etudiant)
        
        createNote(examen: tpc2, note: 20, coeff: tpc2.Poids, matiere: ios , etudiant: etudiant)
        createNote(examen: final2, note: 18, coeff: final2.Poids, matiere: ios, etudiant: etudiant)
        
        createNote(examen: tpc3, note: 17, coeff: tpc3.Poids, matiere: web , etudiant: etudiant)
        createNote(examen: partiel3, note: 16, coeff: partiel3.Poids, matiere: web, etudiant: etudiant)
        createNote(examen: final3, note: 13, coeff: final3.Poids, matiere: web, etudiant: etudiant)
        
        createNote(examen: tpc4, note: 17, coeff: tpc4.Poids, matiere: marketing , etudiant: etudiant)
        createNote(examen: final4, note: 13, coeff: final4.Poids, matiere: marketing, etudiant: etudiant)

        createNote(examen: tpc5, note: 12, coeff: tpc5.Poids, matiere: genie , etudiant: etudiant)
        createNote(examen: partiel5, note: 12, coeff: partiel5.Poids, matiere: genie, etudiant: etudiant)
        createNote(examen: final5, note: 13, coeff: final5.Poids, matiere: genie, etudiant: etudiant)

        return etudiant
    }
}
