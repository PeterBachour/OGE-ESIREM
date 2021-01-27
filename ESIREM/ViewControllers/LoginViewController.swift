//
//  LoginViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 18/01/2021.
//

import Foundation
import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    var activeTextField : UITextField? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
        self.passwordTextField.layer.borderColor = UIColor(named: "Light Blue")?.cgColor
        self.usernameTextField.layer.borderColor = UIColor(named: "Light Blue")?.cgColor
        self.passwordTextField.layer.borderWidth = 3.0
        self.usernameTextField.layer.borderWidth = 3.0
        self.loginButton.layer.backgroundColor = UIColor(named: "Dark Blue")?.cgColor
        self.loginButton.layer.cornerRadius = self.loginButton.frame.height/2
        self.loginButton.layer.masksToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
      
          // call the 'keyboardWillHide' function when the view controlelr receive notification that keyboard is going to be hidden
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if usernameTextField.isFirstResponder {
            self.passwordTextField.becomeFirstResponder()
            self.usernameTextField.resignFirstResponder()
        } else {
            self.view.endEditing(true)
        }
        return false
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if usernameTextField.text != "Peter" || passwordTextField.text != "" {
            self.errorLabel.text = "Username or Password incorrect"
            self.errorLabel.alpha = 1
        } else {
            if let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController {
                self.present(homeVC, animated: true, completion: nil)
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
                
      // move the root view up by the distance of keyboard height
      self.view.frame.origin.y = 0 - 75
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      // move back the root view origin to zero
      self.view.frame.origin.y = 0
    }

}
