//
//  DossierViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 22/01/2021.
//

import UIKit


class DossierViewController: UIViewController, UITextFieldDelegate {
    
    var etudiant = (UIApplication.shared.delegate as! AppDelegate).etudiant!
    var editingFields = false
    
    var activeTextField : UITextField? = nil
    
    @IBOutlet weak var editImage: UIBarButtonItem!
    @IBOutlet weak var imageEtudiant: UIImageView!
    
    @IBOutlet weak var NomEtudiantTextField: UITextField!
    @IBOutlet weak var NomEtudiant: UILabel!
    
    @IBOutlet weak var DOBEtudiantTextField: UITextField!
    @IBOutlet weak var DOBEtudiant: UILabel!
    
    @IBOutlet weak var PrenomEtudiantTextField: UITextField!
    @IBOutlet weak var PrenomEtudiant: UILabel!
    
    @IBOutlet weak var mailEtudiantTextField: UITextField!
    @IBOutlet weak var mailEtudiant: UILabel!
    
    @IBOutlet weak var adressEtudiant: UILabel!
    @IBOutlet weak var adressEtudiantTextField: UITextField!
    
    @IBOutlet weak var numeroEtudiantTextField: UITextField!
    @IBOutlet weak var numeroEtudiant: UILabel!
        
 
    override func viewDidLoad() {
        super.viewDidLoad()
        imageEtudiant.image = UIImage(named: "\(etudiant.photo)")
        imageEtudiant.layer.cornerRadius = imageEtudiant.frame.height/2
        imageEtudiant.layer.borderWidth = 5
        imageEtudiant.layer.masksToBounds = false
        imageEtudiant.layer.borderColor = UIColor(named: "Dark Blue")?.cgColor
        imageEtudiant.clipsToBounds = true

        
        NomEtudiant.text = "\(etudiant.lastname)"
        NomEtudiantTextField.text = "\(etudiant.lastname)"

        PrenomEtudiant.text = "\(etudiant.firstname)"
        PrenomEtudiantTextField.text = "\(etudiant.firstname)"

        DOBEtudiant.text = "\(etudiant.dob)"
        DOBEtudiantTextField.text = "\(etudiant.dob)"
        
        mailEtudiant.text = "\(etudiant.mail)"
        mailEtudiantTextField.text = "\(etudiant.mail)"
        
        adressEtudiant.text = "\(etudiant.adress)"
        adressEtudiantTextField.text = "\(etudiant.adress)"
        
        numeroEtudiant.text = "\(etudiant.nbEtudiant)"
        numeroEtudiantTextField.text = "\(etudiant.nbEtudiant)"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
      
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NomEtudiantTextField.delegate = self
        PrenomEtudiantTextField.delegate = self
        DOBEtudiantTextField.delegate = self
        mailEtudiantTextField.delegate = self
        adressEtudiantTextField.delegate = self
        numeroEtudiantTextField.delegate = self

        
    }
    
    @IBAction func editButton(_ sender: Any) {
        if editingFields {
            editingFields = false
            //image
            editImage.image = UIImage(systemName: "square.and.pencil")
            
            //hide and show textfield and label
            NomEtudiantTextField.isHidden = true
            NomEtudiant.isHidden = false
            PrenomEtudiantTextField.isHidden = true
            PrenomEtudiant.isHidden = false
            numeroEtudiantTextField.isHidden = true
            numeroEtudiant.isHidden = false
            DOBEtudiantTextField.isHidden = true
            DOBEtudiant.isHidden = false
            mailEtudiantTextField.isHidden = true
            mailEtudiant.isHidden = false
            adressEtudiantTextField.isHidden = true
            adressEtudiant.isHidden = false
            
            //change lastname
            NomEtudiant.text = NomEtudiantTextField.text
            etudiant.lastname = NomEtudiantTextField.text!
            
            //change firstname
            PrenomEtudiant.text = PrenomEtudiantTextField.text
            etudiant.firstname = PrenomEtudiantTextField.text!
            
            //change nEtudiant
            numeroEtudiant.text = numeroEtudiantTextField.text
            etudiant.nbEtudiant = numeroEtudiantTextField.text!
        
            //change DOB
            DOBEtudiant.text = DOBEtudiantTextField.text
            etudiant.dob = DOBEtudiantTextField.text!
            
            //chnage mail
            mailEtudiant.text = mailEtudiantTextField.text
            etudiant.mail = mailEtudiantTextField.text!
            
            //change adress
            adressEtudiant.text = adressEtudiantTextField.text
            etudiant.adress = adressEtudiantTextField.text!
            
        } else {
            editingFields = true
            //image
            editImage.image = UIImage(systemName: "checkmark.circle.fill")

            //hide and show textfield and label
            NomEtudiantTextField.isHidden = false
            NomEtudiant.isHidden = true
            PrenomEtudiantTextField.isHidden = false
            PrenomEtudiant.isHidden = true
            numeroEtudiantTextField.isHidden = false
            numeroEtudiant.isHidden = true
            DOBEtudiantTextField.isHidden = false
            DOBEtudiant.isHidden = true
            mailEtudiantTextField.isHidden = false
            mailEtudiant.isHidden = true
            adressEtudiantTextField.isHidden = false
            adressEtudiant.isHidden = true
        }
        self.NomEtudiantTextField.resignFirstResponder()
        self.PrenomEtudiantTextField.resignFirstResponder()
        self.numeroEtudiantTextField.resignFirstResponder()
        self.DOBEtudiantTextField.resignFirstResponder()
        self.mailEtudiantTextField.resignFirstResponder()
        self.adressEtudiantTextField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.NomEtudiantTextField.resignFirstResponder()
        self.PrenomEtudiantTextField.resignFirstResponder()
        self.numeroEtudiantTextField.resignFirstResponder()
        self.DOBEtudiantTextField.resignFirstResponder()
        self.mailEtudiantTextField.resignFirstResponder()
        self.adressEtudiantTextField.resignFirstResponder()
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
       // set the activeTextField to the selected textfield
       self.activeTextField = textField
     }
       
     // when user click 'done' or dismiss the keyboard
     func textFieldDidEndEditing(_ textField: UITextField) {
       self.activeTextField = nil
     }
    
    @objc func keyboardWillShow(notification: NSNotification) {
                
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {

            // if keyboard size is not available for some reason, dont do anything
            return
          }

          var shouldMoveViewUp = false

          // if active text field is not nil
          if let activeTextField = activeTextField {

            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            // if the bottom of Textfield is below the top of keyboard, move up
            if bottomOfTextField > topOfKeyboard {
              shouldMoveViewUp = true
            }
          }

          if(shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height/2
          }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }
}
