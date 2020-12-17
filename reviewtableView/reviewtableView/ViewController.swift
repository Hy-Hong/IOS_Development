//
//  ViewController.swift
//  reviewtableView
//
//  Created by Hy Horng on 9/21/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var imageArray = [UIImage]()
    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageArray = [UIImage(named: "banner1")!, UIImage(named: "banner2")!, UIImage(named: "banner3")!, UIImage(named: "banner4")!, UIImage(named: "banner5")!]
        
        nameArray = ["Coffee", "Breakfast", "Munchies", "Sandwiches", "Specialty Drink"]
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headercell = Bundle.main.loadNibNamed("HeaderCell", owner: self, options: nil)?.first as! HeaderCell
        headercell.imgIcon.image = imageArray[section]
        headercell.lbImage.text = nameArray[section]
        
        return headercell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else if section == 1 {
            return 1
        }else if section == 2 {
            return 1
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.bgImage.image = imageArray[indexPath.section]
            }
        }else if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.bgImage.image = imageArray[indexPath.section]
            }
        }
        
        return cell
        
        
//        cell.bgImage.image = imageArray[indexPath.row]
//
//        if indexPath.row == 0 {
//           cell.bgImage.image = imageArray[0]
//            return cell
//        }
//        else if indexPath.row == 1 {
//            cell.bgImage.image = imageArray[1]
//            return cell
//        }
        
        return cell
    }

}

