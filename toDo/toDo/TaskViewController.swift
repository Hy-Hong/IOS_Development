//
//  TaskViewController.swift
//  toDo
//
//  Created by Hy Horng on 11/12/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.red
    }
    
    @objc func deleteTask() {
        
//        let newCount = count - 1
//        UserDefaults().setValue(newCount, forKey: "count")
//        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
        
    }

}
