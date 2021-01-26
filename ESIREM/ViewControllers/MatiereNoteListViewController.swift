//
//  MatiereNoteListViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 16/01/2021.
//

import Foundation

import UIKit

class MatiereNoteListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var navigationBar: UINavigationBar!
    var exam = [Notes]()
    var note = Float()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.topItem?.title = exam[0].Examen.Matiere.Titre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Header", for: [0,0])
        return cell
    }


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exam.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "exam", for: indexPath)
        let m = exam[indexPath.row]
        (cell.viewWithTag(1) as! UILabel).text = "\(m.Examen.titre)"
        (cell.viewWithTag(2) as! UILabel).text = "\(m.Coeff)"
        (cell.viewWithTag(3) as! UILabel).text = "\(m.Note)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
        
        let version = UILabel(frame: CGRect(x: -25, y: 0, width: tableView.frame.width, height: 30))
        version.font = version.font.withSize(17)
        version.text = "Note Final: \(note)"
        version.textAlignment = .right
                    
        tableViewFooter.addSubview(version)
        return tableViewFooter
    }
}

