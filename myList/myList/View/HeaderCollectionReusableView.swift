//
//  HeaderCollectionReusableView.swift
//  myList
//
//  Created by Hy Horng on 11/26/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifire = "headerID"
    
    public func configure() {
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}

class FooterCollectionReusableView: UICollectionReusableView {
    
    static let identifire = "footerID"
    
    public func configure() {
        backgroundColor = .green
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
