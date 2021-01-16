//
//  EtudiantNoteListViewController.swift
//  ESIREM
//
//  Created by Peter Bachour on 15/01/2021.
//

import UIKit

class EtudiantNoteListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var EtudiantName: UILabel!
    var etudiant = (UIApplication.shared.delegate as! AppDelegate).etudiant!
    var Moyenne =  (UIApplication.shared.delegate as! AppDelegate).Moyenne!
    
    var sem=[Semestre]()
    var matiere=[Int:[Matiere]]()
    var examen=[Examen]()
    
    func PDFButton() {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(UIImage(named: "PDF icon.png"), for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(activityControllerShow(sender:)), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButton(item1, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = etudiant.firstname + " " + etudiant.lastname
        PDFButton()
        
        for n in etudiant.note{
            let m=n.Examen.Matiere
            examen.append(n.Examen)
            if let s=sem.firstIndex(where: { (x) -> Bool in
                return x === m.Semestre
            }){
                if matiere[s]!.contains(where: { (x) -> Bool in
                    return x===m
                })==false{
                    matiere[s]!.append(m)
                }
            }
            else{
                sem.append(m.Semestre)
                matiere[sem.count-1]=[m]
            }
        }
    }
    
    @objc func activityControllerShow(sender: UIBarButtonItem){
        let data = NSMutableData()
        UIGraphicsBeginPDFContextToData(data, view.bounds, nil)
        UIGraphicsBeginPDFPage()
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        UIGraphicsEndPDFContext()
        let path = NSTemporaryDirectory() + ".pdf"
        data.write(toFile: path, atomically: true)
        let documento = NSData(contentsOfFile: path)
        
        let activityController = UIActivityViewController(activityItems: [documento!], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sem.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Semestre \(section + 1)"
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == sem.count-1{
            let tableViewFooter = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 0))
            
            let version = UILabel(frame: CGRect(x: -25, y: 25, width: tableView.frame.width, height: 30))
            version.font = version.font.withSize(14)
            version.text = "GPA: \(Moyenne/5)"
            version.textColor = UIColor.lightGray
            version.textAlignment = .right
            
            let version1 = UILabel(frame: CGRect(x: -25, y: 0, width: tableView.frame.width, height: 30))
            version1.font = version.font.withSize(14)
            version1.text = "Moyenne : \(Moyenne)"
            version1.textColor = UIColor.lightGray
            version1.textAlignment = .right
            
            tableViewFooter.addSubview(version1)
            tableViewFooter.addSubview(version)
            return tableViewFooter
        }
        return nil
        
    }
    
    func ExamenDeMatiere(m: Matiere)-> [Notes] {
        var ex = [Notes]()
        for n in examen{
            for x in n.note{
                if x.Examen.Matiere === m
                {
                    if ex.contains(where: { (v) -> Bool in
                        return v===x
                    })==false{
                        ex.append(x)
                    }
                }
            }
        }
        return ex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Semestre", for: indexPath)
        let m=matiere[indexPath.section]![indexPath.row]
        (cell.viewWithTag(1) as! UILabel).text = "\(m.Titre)"
        (cell.viewWithTag(2) as! UILabel).text = "\(m.Credit)"
        (cell.viewWithTag(3) as! UILabel).text = "\(m.noteFinal(etud: etudiant))"
        return cell
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return matiere[section]!.count
        }
    
    var selectedSection = -1
    var selectedRow = -1
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSection = indexPath.section
        selectedRow = indexPath.row
        performSegue(withIdentifier: "SegueLinkMatiere", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueLinkMatiere"
        {
            let mat = matiere[selectedSection]![selectedRow]
            let exam = ExamenDeMatiere(m: mat)
            (segue.destination as! MatiereNoteListViewController).exam = exam
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}