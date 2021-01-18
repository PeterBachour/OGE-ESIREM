//
//  LoginViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 18/01/2021.
//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setGradientBackground(colorTop: UIColor(named: "Red")!, colorBottom: UIColor(named: "Dark Blue")!)
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
}
