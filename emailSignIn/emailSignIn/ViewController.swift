//
//  ViewController.swift
//  emailSignIn
//
//  Created by Hy Horng on 11/13/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let e = UITextField()
        let attributedPlaceholder = NSAttributedString(string: " Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
            e.attributedPlaceholder = attributedPlaceholder
            e.backgroundColor = GREEN_THEME
       return e
    }()
    
    let passwordTextField: UITextField = {
        let p = UITextField()
        let attributedPlaceholder = NSAttributedString(string: " Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
            p.attributedPlaceholder = attributedPlaceholder
            p.backgroundColor = GREEN_THEME
        return p
    }()
    
    let loginButton: UIButton = {
        let l = UIButton(type: .system)
            l.setTitleColor(.white, for: .normal)
            l.setTitle("Log In", for: .normal)
            l.backgroundColor = .purple
        return l
    }()
    
    let forgotPwdButton: UIButton = {
        let f = UIButton(type: .system)
            f.setTitleColor(.white, for: .normal)
            f.setTitle("Forgot Password?", for: .normal)
            f.backgroundColor = GREEN_THEME
        return f
    }()
    
    let haveAccountButton: UIButton = {
        let color = UIColor(red: 89 / 255, green:  156 / 255, blue: 120 / 255, alpha: 1)
        let font = UIFont.systemFont(ofSize: 16)
        let h = UIButton(type: .system)
//            h.backgroundColor = .yellow
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ", attributes: [NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font: font])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.font: font]))
        
            h.setAttributedTitle(attributedTitle, for: .normal)
        
        return h
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = GREEN_THEME
        //Calling setup the functions
        setupTextFieldComponents()
        setupLoginButton()
        setupHaveAccountButton()
        setupForgotPwdButton()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    fileprivate func setupTextFieldComponents() {
        setupEmailField()
        setupPasswordField()
    }
    
    fileprivate func setupEmailField() {
        view.addSubview(emailTextField)
        
        emailTextField.leftViewMode = .always
        emailTextField.leftView = UIImageView(image: UIImage(named: "email"))
        
        emailTextField.anchors(top: nil, topPad: 0, bottom: nil, bottomPad: 0,
                               left: view.leftAnchor, leftPad: 24, right: view.rightAnchor, rightPad: 24,
                               height: 30, width: 0)
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func setupPasswordField() {
        view.addSubview(passwordTextField)
        passwordTextField.leftViewMode = .always
        passwordTextField.leftView = UIImageView(image: UIImage(named: "pwd"))
        passwordTextField.anchors(top: emailTextField.bottomAnchor, topPad: 12, bottom: nil, bottomPad: 0,
                                  left: emailTextField.leftAnchor, leftPad: 0, right: emailTextField.rightAnchor, rightPad: 0,
                                  height: 30, width: 0)
    }
    
    fileprivate func setupLoginButton() {
        view.addSubview(loginButton)
        loginButton.anchors(top: passwordTextField.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0,
                            left: passwordTextField.leftAnchor, leftPad: 0, right: passwordTextField.rightAnchor, rightPad: 0,
                            height: 50, width: 0)
    }
    
    fileprivate func setupForgotPwdButton() {
        view.addSubview(forgotPwdButton)
        forgotPwdButton.anchors(top: loginButton.bottomAnchor, topPad: 8, bottom: nil, bottomPad: 0,
                                left: loginButton.leftAnchor, leftPad: 0, right: loginButton.rightAnchor, rightPad: 0,
                                height: 30, width: 0)
    }
    
    fileprivate func setupHaveAccountButton() {
        view.addSubview(haveAccountButton)
        haveAccountButton.anchors(top: nil, topPad:0,bottom: view.safeAreaLayoutGuide.bottomAnchor,bottomPad: 8,
                                  left: view.leftAnchor, leftPad: 12, right: view.rightAnchor, rightPad: 12,
                                  height: 30, width: 0)
    }

}

