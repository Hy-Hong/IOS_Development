//
//  ViewController.swift
//  signInApp
//
//  Created by Hy Horng on 10/12/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit
import GoogleSignIn
import FBSDKLoginKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, GIDSignInDelegate, GIDSignInUIDelegate {

    @IBOutlet var googleSignIn: GIDSignInButton!
    @IBOutlet var facebookLogInButton: UIView!
    @IBOutlet var iconImageFB: UIImageView!
    @IBOutlet var lblFacebookLogin: UILabel!
    
    var tapGesture = UITapGestureRecognizer()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
        tap.delegate = self
        facebookLogInButton.addGestureRecognizer(tap)
        
        iconImageFB.layer.cornerRadius = iconImageFB.frame.width / 2
        iconImageFB.clipsToBounds = true
        iconImageFB.layer.borderWidth = 2
        iconImageFB.layer.borderColor = UIColor.brown.cgColor
        
        facebookLogInButton.layer.cornerRadius = facebookLogInButton.frame.height / 2
        facebookLogInButton.clipsToBounds = true
        facebookLogInButton.layer.borderWidth = 2
        facebookLogInButton.layer.borderColor = UIColor.orange.cgColor
        
        googleSignIn.layer.cornerRadius = googleSignIn.frame.height / 2
        googleSignIn.clipsToBounds = true
        googleSignIn.layer.borderColor = UIColor.blue.cgColor
        googleSignIn.layer.borderWidth = 4
        googleSignIn.backgroundColor = .blue
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }
    
    // set action FBbutton
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        // handling code
        if AccessToken.current == nil {
           fetchFacebookFields()
        }else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "facebookVCID")
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func fetchFacebookFields() {
            
        //do login with permissions for email and public profile
        
        LoginManager().logIn(permissions: ["email","public_profile"], from: nil) {
            (result, error) -> Void in
            //if we have an error display it and abort
            if let error = error {
                print(error.localizedDescription)
                return
            }
            //make sure we have a result, otherwise abort
            guard let result = result else { return }
            //if cancelled nothing todo
            if result.isCancelled { return }
            else {
                //login successfull, now request the fields we like to have in this case first name and last name
                GraphRequest(graphPath: "me", parameters: ["fields" : "first_name, last_name, email"]).start() {
                    (connection, result, error) in
                    //if we have an error display it and abort
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    //parse the fields out of the result
                    if let fields = result as? [String:Any],
                        let firstName = fields["first_name"] as? String,
                        let lastName = fields["last_name"] as? String,
                        let email = fields["email"] as? String {
                        
                        print(firstName)
                        print(email)
                        // Login Success
                        if AccessToken.current != nil {
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "facebookVCID")
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                        
                    }
                }
            }
        }
    }
}

extension ViewController {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
                
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name
        let givenName = user.profile.givenName
        let familyName = user.profile.familyName
        let email = user.profile.email
        // ...
        
        let userDefault = UserDefaults.standard
        userDefault.set(userId, forKey: "USERID")

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "googleVCID")
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

