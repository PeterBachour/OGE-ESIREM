//
//  HomeViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 19/01/2021.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate 
 {
    
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = "Salut Peter Bachour!"
        self.nameLabel.textColor = UIColor(named: "Dark Blue")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let horaire = tableView.dequeueReusableCell(withIdentifier: "horaire", for: indexPath)
        let dossier = tableView.dequeueReusableCell(withIdentifier: "dossier", for: indexPath)
        let notes = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath)
        if indexPath.row == 0 {
            return horaire
        }else if indexPath.row == 1 {
            return dossier
        }
        return notes
    }
}

