//
//  CollectionViewCell.swift
//  myList
//
//  Created by Hy Horng on 11/20/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class IconModel {
    let imgIcon: UIImage?
    let txtIcon: String?
    
    init(imgIcon: UIImage, txtIcon: String) {
        self.imgIcon = imgIcon
        self.txtIcon = txtIcon
    }
}

class CollectionViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let reuseableCell = "cell"
    var imageIcon = [IconModel]()
    
//    lazy var backCell: UIView = {
//        let viewCell = UIView(frame: CGRect(x: 5, y: 0, width: 60, height: 30))
//        viewCell.backgroundColor = .green
//
//        return viewCell
//    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseableCell)
        setupViews()
        
        iconList()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }
    
    let imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: 120, height: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let iconCell_0 = UIImageView()
        iconCell_0.frame = CGRect.init(x: (collectionView.frame.width / 3) + 15, y: (collectionView.frame.height / 2) + 6, width: 22, height: 22)
        iconCell_0.image = UIImage(named: "Movie-1")
        iconCell_0.contentMode = .scaleAspectFill
        iconCell_0.clipsToBounds = true
        
        let lblCell_0 = UILabel()
        lblCell_0.frame = CGRect.init(x: (collectionView.frame.width / 3) + 43, y: 5, width: 43, height: 25)
        lblCell_0.text = "2019"
        lblCell_0.textAlignment = .center
        lblCell_0.font = UIFont.boldSystemFont(ofSize: 17)
        
        let iconCell_1 = UIImageView()
        iconCell_1.frame = CGRect.init(x: (collectionView.frame.width / 3) + 123, y: (collectionView.frame.height / 2) + 6, width: 22, height: 22)
        iconCell_1.image = UIImage(named: "TVC-1")
        iconCell_1.contentMode = .scaleAspectFill
        iconCell_1.clipsToBounds = true
        
        let lblCell_1 = UILabel()
        lblCell_1.frame = CGRect.init(x: (collectionView.frame.width / 3) + 150, y: 5, width: 30, height: 25)
        lblCell_1.text = "2hr"
        lblCell_1.textAlignment = .center
        lblCell_1.font = UIFont.boldSystemFont(ofSize: 17)
        
        let iconCell_2 = UIImageView()
        iconCell_2.frame = CGRect.init(x: (collectionView.frame.width / 3) + 215, y: 5, width: 22, height: 22)
        iconCell_2.image = UIImage(named: "TV Drama")
        iconCell_2.contentMode = .scaleAspectFill
        iconCell_2.clipsToBounds = true
        
        let lblCell_2 = UILabel()
        lblCell_2.frame = CGRect.init(x: (collectionView.frame.width / 3) + 243, y: 5, width: 85, height: 25)
        lblCell_2.text = "Advanture"
        lblCell_2.textAlignment = .center
        lblCell_2.font = UIFont.boldSystemFont(ofSize: 17)
        
        let iconMarkBook = UIImageView()
        iconMarkBook.frame = CGRect.init(x: (collectionView.frame.width / 2) + 373, y: 5, width: 15, height: 22)
        iconMarkBook.image = UIImage(named: "Save")
        iconMarkBook.contentMode = .scaleAspectFill
        iconMarkBook.clipsToBounds = true
        
        collectionView.addSubview(iconCell_0)
        collectionView.addSubview(lblCell_0)
        
        collectionView.addSubview(iconCell_1)
        collectionView.addSubview(lblCell_1)
        
        collectionView.addSubview(iconCell_2)
        collectionView.addSubview(lblCell_2)
        
        collectionView.addSubview(iconMarkBook)
        

        return collectionView
    }()
    
    fileprivate func iconList() {
        imageIcon.append(IconModel(imgIcon: UIImage(named: "Movie-1")!, txtIcon: "2019"))
        imageIcon.append(IconModel(imgIcon: UIImage(named: "TVC-1")!, txtIcon: "2hr"))
        imageIcon.append(IconModel(imgIcon: UIImage(named: "TV Drama")!, txtIcon: "Advanture"))
    }
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(imagesCollectionView)
        
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        
        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        imagesCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8.5).isActive = true
        imagesCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -7.5).isActive = true
        imagesCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imagesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageIcon.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.item {
        case 0:
            return CGSize(width: collectionView.frame.width/3-37, height: collectionView.frame.height - 5)
        case 1:
            return CGSize(width: collectionView.frame.width/3-50, height: collectionView.frame.height - 5)
        default:
            break
        }
        return CGSize(width: collectionView.frame.width/3+7, height: collectionView.frame.height - 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UICollectionViewCell {
            
            cell.backgroundColor = .gray
            cell.alpha = 0.2
            cell.layer.cornerRadius = 6

            return cell
        }
        return UICollectionViewCell()
    }
}
