//
//  HeaderCell.swift
//  reviewtableView
//
//  Created by Hy Horng on 9/21/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    @IBOutlet var imgIcon: UIImageView!
    
    @IBOutlet var lbImage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
