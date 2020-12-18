//
//  FacebookViewController.swift
//  signInApp
//
//  Created by Hy Horng on 10/21/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookViewController: UIViewController {
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var profileImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func fbSignOutButton(_ sender: Any) {
        fbSignOut()
    }
    
    func fbSignOut() {
        if AccessToken.current != nil {
            LoginManager().logOut()
            self.navigationController?.popViewController(animated: true)
        }
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
