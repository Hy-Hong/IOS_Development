//
//  CustomTableViewCell.swift
//  myList
//
//  Created by Hy Horng on 11/18/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 10, y: 6, width: self.frame.width - 20, height: 84))
//        view.backgroundColor = .cyan
        
        let iconActin = UIImageView()
        iconActin.frame = CGRect.init(x: view.frame.width-15, y: view.frame.height/2-13, width: 14, height: 25)
        iconActin.image = UIImage(named: "Action")
        iconActin.contentMode = .scaleAspectFit
        
        
        view.addSubview(iconActin)
        
        return view
    }()
    
    lazy var videoView: UIImageView = {
       let videoView = UIImageView(frame: CGRect(x: 10, y: 6, width: 150, height: 84))
        videoView.contentMode = .scaleAspectFill
        videoView.clipsToBounds = true
        
        return videoView
    }()
    
    lazy var namelbl: UILabel = {
       let nlbl = UILabel(frame: CGRect(x: 165, y: 20, width: backView.frame.width - 165, height: 30))
        nlbl.textAlignment = .left
        nlbl.font = UIFont.boldSystemFont(ofSize: 18)
        
        return nlbl
    }()
    
    lazy var subLabel: UILabel = {
       let slbl = UILabel(frame: CGRect(x: 165, y: 45, width: backView.frame.width - 165, height: 30))
        slbl.textAlignment = .left
        
        return slbl
    }()
    
    lazy var viewOnVideo: UIView = {
        let bgView = UIView(frame: CGRect(x: 10, y: 6, width: videoView.frame.width-66, height: 84))
        bgView.backgroundColor = UIColor(displayP3Red: 41/255, green: 49/255, blue: 99/255, alpha: 0.9)
        bgView.layer.cornerRadius = 5

        let lblOnVideo = UILabel()
        lblOnVideo.frame = CGRect.init(x: bgView.frame.width/2-13, y: 15, width: bgView.frame.width/2-17, height: bgView.frame.height/2-17)
        lblOnVideo.text = String("12")
        lblOnVideo.textColor = .white
        lblOnVideo.font = UIFont.boldSystemFont(ofSize: 23)
        lblOnVideo.textAlignment = .center
        
        let iconOnVideo = UIImageView()
        iconOnVideo.frame = CGRect.init(x: bgView.frame.width/2-13, y: bgView.frame.height/2+4, width: bgView.frame.width/2-17, height: bgView.frame.height/2-17)
        iconOnVideo.image = UIImage(named: "menubuger")
        iconOnVideo.contentMode = .scaleAspectFill
        iconOnVideo.clipsToBounds = true
        
        bgView.addSubview(lblOnVideo)
        bgView.addSubview(iconOnVideo)
        
        return bgView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backView.layer.cornerRadius = 5
        backView.clipsToBounds = true
        videoView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(backView)
        addSubview(videoView)
        addSubview(namelbl)
        addSubview(subLabel)
        addSubview(viewOnVideo)
    }

}
