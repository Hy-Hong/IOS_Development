//
//  GoogleViewController.swift
//  signInApp
//
//  Created by Hy Horng on 10/23/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit
import GoogleSignIn

class GoogleViewController: UIViewController {
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnLogoutClick(_ sender: Any) {
        signOutOverride()
    }
    
    
    func signOutOverride() {
        
        if UserDefaults.standard.value(forKey: "USERID") != nil {
            // Set the view to the login screen after signing out
            GIDSignIn.sharedInstance().signOut()
            self.navigationController?.popViewController(animated: true)
            UserDefaults.standard.removeObject(forKey: "USERID")
            
        }
//        }else {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let loginVC = storyboard.instantiateViewController(withIdentifier: "googleVCID")
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = loginVC
//
//
//        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
