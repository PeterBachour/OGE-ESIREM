//
//  DossierViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 22/01/2021.
//

import UIKit


class DossierViewController: UIViewController {
    
    var etudiant = (UIApplication.shared.delegate as! AppDelegate).etudiant!
    
    @IBOutlet weak var imageEtudiant: UIImageView!
    @IBOutlet weak var NomPrenomEtudiant: UILabel!
    @IBOutlet weak var DOBEtudiant: UILabel!
    @IBOutlet weak var mailEtudiant: UILabel!
    @IBOutlet weak var adressEtudiant: UILabel!
    @IBOutlet weak var numeroEtudiant: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageEtudiant.image = UIImage(named: "\(etudiant.photo)")
        NomPrenomEtudiant.text = "\(etudiant.firstname) \(etudiant.lastname)"
        DOBEtudiant.text = "\(etudiant.dob)"
        mailEtudiant.text = "\(etudiant.mail)"
        adressEtudiant.text = "\(etudiant.adress)"
        numeroEtudiant.text = "\(etudiant.nbEtudiant)"
    }        

}