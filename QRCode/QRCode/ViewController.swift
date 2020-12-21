//
//  ViewController.swift
//  QRCode
//
//  Created by Hy Horng on 12/21/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTextField: UITextField!
    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        button2.isEnabled = false
    }

    @IBAction func button(_sender: Any){
        if let myString = myTextField.text {
            let data = myString.data(using: .ascii, allowLossyConversion: false)
            let filter = CIFilter(name: "CIQRCodeGenerator")
            filter?.setValue(data, forKey: "InputMessage")
            
            let ciImage = filter?.outputImage
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            let transformImage = ciImage?.transformed(by: transform)
            let image = UIImage(ciImage: transformImage!)
            myImageView.image = image
            
            button2.isEnabled = true
        }
    }
    
    @IBAction func buttonScreenShot(_sender: Any) {
        screenShotMethod()
    }
    
    func screenShotMethod() {
        let layer = UIApplication.shared.keyWindow!.layer
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, scale)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenshot = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(screenshot!, nil, nil, nil)
    }

}

