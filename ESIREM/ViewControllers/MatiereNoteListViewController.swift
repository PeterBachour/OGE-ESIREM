//
//  MatiereNoteListViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 16/01/2021.
//

import Foundation

import UIKit

class MatiereNoteListViewController: UITableViewController {

    var exam = [Notes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = exam[0].Examen.Matiere.Titre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "  Examen                                          Coeff %      Note"
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            let tableViewHeader = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
            tableViewHeader.backgroundColor = UIColor.lightGray
            
            let version = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.width, height: 30))
            let version1 = UILabel(frame: CGRect(x: 225, y: 0, width: tableView.frame.width, height: 30))
            let version2 = UILabel(frame: CGRect(x: 305, y: 0, width: tableView.frame.width, height: 30))
            
            version.text = "Examen"
            version2.text = "Note"
            version1.text = "Coeff %"
            
            tableViewHeader.addSubview(version1)
            tableViewHeader.addSubview(version2)
            tableViewHeader.addSubview(version)
            return tableViewHeader
        }
        return nil

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exam.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exam", for: indexPath)
        let m = exam[indexPath.row]
        (cell.viewWithTag(1) as! UILabel).text = "\(m.Examen.titre)"
        (cell.viewWithTag(2) as! UILabel).text = "\(m.Coeff)"
        (cell.viewWithTag(3) as! UILabel).text = "\(m.Note)"
        return cell
    }
}

