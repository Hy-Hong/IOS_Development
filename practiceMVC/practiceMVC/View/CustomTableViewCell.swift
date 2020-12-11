//
//  CustomTableViewCell.swift
//  practiceMVC
//
//  Created by Hy Horng on 9/22/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var labelName: UILabel!
    @IBOutlet var txtLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = (profileImage.frame.size.height) / 2
        profileImage.clipsToBounds = true
    }

}
