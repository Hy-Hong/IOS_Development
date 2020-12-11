//
//  ViewController.swift
//  practiceMVC
//
//  Created by Hy Horng on 9/22/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let filmStarObj = FilmStar(name: "", description: "", profile: "")
    
    let cellID = "cellID"
    let heightHeaderSection: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Footballers"
        }
        else if section == 1 {
            return "Singers"
        }
        return "Modelers"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightHeaderSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return filmStarObj.footballers().count
        }
        else if section == 1 {
            return filmStarObj.singers().count
        }
        return filmStarObj.modelers().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CustomTableViewCell
        if indexPath.section == 0 {
            cell.profileImage.image = UIImage(named: filmStarObj.footballers()[indexPath.row].profile)
            cell.labelName.text = filmStarObj.footballers()[indexPath.row].name
            cell.txtLabel.text = filmStarObj.footballers()[indexPath.row].description
        }
        else if indexPath.section == 1 {
            cell.profileImage.image = UIImage(named: filmStarObj.singers()[indexPath.row].profile)
            cell.labelName.text = filmStarObj.singers()[indexPath.row].name
            cell.txtLabel.text = filmStarObj.singers()[indexPath.row].description
        }
        else {
            cell.profileImage.image = UIImage(named: filmStarObj.modelers()[indexPath.row].profile)
            cell.labelName.text = filmStarObj.modelers()[indexPath.row].name
            cell.txtLabel.text = filmStarObj.modelers()[indexPath.row].description
        }
        
        return cell
    }
}

