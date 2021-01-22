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
        setGradientBackground(colorTop: UIColor(named: "Red")!, colorBottom: UIColor(named: "Dark Blue")!)
        self.passwordTextField.delegate = self
        self.usernameTextField.delegate = self
    }
    
    func setGradientBackground(colorTop: UIColor,  colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorBottom.cgColor, colorTop.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at: 0)
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
        if usernameTextField.text != "" || passwordTextField.text != "" {
            self.errorLabel.text = "Username or Password incorrect"
            self.errorLabel.alpha = 1
        } else {
            if let homeVC = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as? HomeViewController {
                self.present(homeVC, animated: true, completion: nil)
                homeVC.nameLabel.text = "Salut " + usernameTextField.text! + "!"
            }
        }
    }
}
