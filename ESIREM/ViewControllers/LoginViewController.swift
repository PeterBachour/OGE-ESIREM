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
}
