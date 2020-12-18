//
//  ViewController.swift
//  googleSiginApp
//
//  Created by Hy Horng on 10/12/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInUIDelegate {
    @IBOutlet var googleSignIn: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        
        
        // Automatically sign in the user.
//        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        // ...
    }

    @IBAction func gSignOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
    }
    
}

