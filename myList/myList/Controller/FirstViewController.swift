//
//  FirstViewController.swift
//  myList
//
//  Created by Hy Horng on 11/17/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //Creating image profile
    private let imageView = UIImageView(image: UIImage(named: "manprofile"))
    
    var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Home"
        
        //calling setup collection view function
        setupCollectionView()
        
        setupLeftRightNavBtn()
        
        setupUI()
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showImage(true)
    }
    
    func getData() {
        Authentication.createAuthorize {
            Authentication.register(phoneNumber: "012346729", country_code: "kh", completionHandler: {

            })
            //Authentication.createListDataHomeScreen()
        }
//        Authentication.createListDataHomeScreen()
//        Authentication.createVerificationCode(phoneNumber: "0886731880") { (Bool, String) in
//
//        }
    }
    
    //Adding constraint profile image
    private struct Const {
        /// Image height/width for Large NavBar state
        static let ImageSizeForLargeState: CGFloat = 30
        /// Margin from right anchor of safe area to right anchor of Image
        static let ImageRightMargin: CGFloat = 15
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
        static let ImageBottomMarginForLargeState: CGFloat = 12
        /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
        static let ImageBottomMarginForSmallState: CGFloat = 6
        /// Image height/width for Small NavBar state
        static let ImageSizeForSmallState: CGFloat = 32
    }
    
    func setupLeftRightNavBtn() {
        let leftNaviButton = UIBarButtonItem(image: UIImage(named: "Menu Sidebar"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(Tapped1))
        self.navigationItem.leftBarButtonItem = leftNaviButton
        
        let rightNaviButton = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(Tapped2))
        self.navigationItem.rightBarButtonItem = rightNaviButton
    }
    
    @objc func Tapped1() {
        print("Tapped1")
        show(ThirdViewController(), sender: Any?.self)
    }
    
    @objc func Tapped2() {
        print("Tapped2")
        show(SecondViewController(), sender: Any?.self)
        
        showImage(false)
    }
    
    //hide profile image
    fileprivate func showImage(_ show: Bool) {
        UIView.animate(withDuration: 0.2) {
            self.imageView.alpha = show ? 1.0 : 0.0
        }
    }
    
    //Initail UI setup
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Initial setup for image for Large NavBar state since the the screen always has Large NavBar once it gets opened
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])
    }
    
    //setup collection view
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: "myCollection")
        collectionView?.register(FirstItemCollectionViewCell.self, forCellWithReuseIdentifier: "myScrollCellId")
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire)
        
        view.addSubview(collectionView!)
        collectionView?.frame = view.bounds
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.size.width, height: (view.frame.size.width / 2) - 5)
        case 1:
            return CGSize(width: view.frame.size.width, height: (view.frame.size.width / 2) + 30 )
        case 2:
            return CGSize(width: view.frame.size.width, height: (view.frame.size.width / 2))
        case 3:
            return CGSize(width: view.frame.size.width, height: view.frame.size.height / 3 + 25)
        default:
            return CGSize(width: view.frame.size.width, height: view.frame.size.height / 3 + 25)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollection", for: indexPath) as!
        FirstCollectionViewCell
        
        switch indexPath.section {
        case 1:
            secondCell.movieSlideType = .LiveStreaming
        case 2:
            secondCell.movieSlideType = .Ads
        case 3:
            secondCell.movieSlideType = .NewRelease
        case 4:
            secondCell.movieSlideType = .PopularVideo
        default:
            break
        }
        
        return secondCell
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire, for: indexPath) as! HeaderCollectionReusableView
        header.configure()
        
        let titleHeader = UILabel()
        titleHeader.frame = CGRect(x: 5, y: 0, width: header.frame.width, height: header.frame.height)
        titleHeader.textAlignment = .left
        titleHeader.font = UIFont.boldSystemFont(ofSize: 20)
        titleHeader.textColor = .black
        
        switch indexPath.section {
        case 1:
            titleHeader.text = "Live Streaming"
        case 2:
            titleHeader.text = "Ads"
        case 3:
            titleHeader.text = "New Release"
        case 4:
            titleHeader.text = "Poplular Videos"
        default:
            break
        }
        
        header.addSubview(titleHeader)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        }else {
            return CGSize(width: view.frame.size.width, height: 40)
        }
    }
    
}
