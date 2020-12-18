//
//  FiveViewController.swift
//  myList
//
//  Created by Hy Horng on 11/17/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class VideoModel {
    let videoImage: UIImage?
    let name: String?
    let description: String?
    
    init(videoImage: UIImage, name: String, description: String) {
        self.videoImage = videoImage
        self.name = name
        self.description = description
    }
    
}

class FiveViewController: UIViewController {
    
    //Creating image profile
    private let imageView = UIImageView(image: UIImage(named: "manprofile"))
    
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
    
    //Creating table view
    var tableView = UITableView(frame: .zero, style: .plain)
    var userModel = [VideoModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showImage(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "MyList"
        //Calling a function
        setupLeftRightNavBtn()
        //function setup ui
        setupUI()
        
        //calling fucntion setup table view
        setupTableView()
        
        userList()
        
        setupHeaderView()
        
        showImage(true)
        
        //calling function custom back button
        customBackButton()
    }
    
    //Setup header view
    fileprivate func setupHeaderView() {
        let headerImage = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 200))
        
        headerImage.image = UIImage(named: "Banner Ads")
        headerImage.contentMode = .scaleAspectFill
        headerImage.clipsToBounds = true
        tableView.tableHeaderView = headerImage
        
    }
    
    //stored array videos images
    fileprivate func userList() {
        userModel.append(VideoModel(videoImage: UIImage(named: "Banner Live Stream")!, name: "Adventure", description: "12 Videos"))
        userModel.append(VideoModel(videoImage: UIImage(named: "Banner Live Stream – 1")!, name: "Comidies", description: "20 Videos"))
        userModel.append(VideoModel(videoImage: UIImage(named: "Banner Live Stream – 2")!, name: "Documentaries", description: "25 Videos"))
    }
    
    //setup table view
    fileprivate func setupTableView() {
//        tableView.frame = self.view.frame
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        tableView.backgroundColor = UIColor.clear
        tableView.separatorColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.register(CollectionViewCell.self, forCellReuseIdentifier: "cellCollection")
    }
    
    func setupLeftRightNavBtn() {
        let leftNaviButton = UIBarButtonItem(image: UIImage(named: "Menu Sidebar"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(Tapped1))
        self.navigationItem.leftBarButtonItem = leftNaviButton
        
        let rightNaviButton = UIBarButtonItem(image: UIImage(named: "Search"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(Tapped2))
        self.navigationItem.rightBarButtonItem = rightNaviButton
    }
    
    @objc func Tapped1() {
        print("Tapped1")
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
    
    //setup back button
    fileprivate func customBackButton() {
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
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
}

extension FiveViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 60 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = " Change "
            label.font = UIFont.boldSystemFont(ofSize: 30) // my custom font
            label.textColor = UIColor.darkText // my custom colour
            
            let subView = UIView()
            subView.frame = CGRect.init(x:headerView.frame.width - 115, y: 15, width: 95.5, height: headerView.frame.height-23)
            subView.backgroundColor = .red
            
            headerView.addSubview(label)
            headerView.addSubview(subView)
            
            return headerView
        }
       return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 60
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 0 {
            let footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

            //Creating left button
            let btnLeft = UIButton()
            btnLeft.frame = CGRect.init(x: 9, y: 15, width: (footerView.frame.width / 2) - 15, height: footerView.frame.height-15)
            btnLeft.backgroundColor = .blue
            btnLeft.layer.cornerRadius = 5
            
            let btnLIcon = UIImageView()
            btnLIcon.frame = CGRect.init(x: (btnLeft.frame.width / 2) - 39, y: (btnLeft.frame.height / 2) - 9.5, width: (btnLeft.frame.height) - 15, height: (btnLeft.frame.height) - 15)
            btnLIcon.image = UIImage(named: "Play Big")
            btnLIcon.contentMode = .scaleAspectFill
            btnLIcon.clipsToBounds = true
            
            let btnLTitle = UILabel()
            btnLTitle.frame = CGRect.init(x: (btnLeft.frame.width / 3) + 15, y: btnLeft.frame.height/2-13, width: (btnLeft.frame.width / 4), height: btnLeft.frame.height/2+10)
            btnLTitle.text = "PLAY"
            btnLTitle.textAlignment = .center
            btnLTitle.font = UIFont.boldSystemFont(ofSize: 18)
            btnLTitle.textColor = .white
            
            btnLeft.addSubview(btnLIcon)
            btnLeft.addSubview(btnLTitle)
            
            //Creating right button
            let btnRight = UIButton()
            btnRight.frame = CGRect.init(x: (footerView.frame.width / 2) + 5, y: 15, width: (footerView.frame.width / 2) - 15, height: footerView.frame.height-15)
            btnRight.backgroundColor = UIColor.lightGray
            btnRight.layer.cornerRadius = 5
            btnRight.alpha = 0.5
            
            let btnRIcon = UIImageView()
            btnRIcon.frame = CGRect.init(x: (btnRight.frame.width / 2) - 52, y: btnRight.frame.height/2-6.5, width: (btnRight.frame.height) - 15, height: btnRight.frame.height/2-3)
            btnRIcon.image = UIImage(named: "Eye blue")
            btnRIcon.contentMode = .scaleAspectFit
            btnRIcon.clipsToBounds = true
            
            let btnRTitle = UILabel()
            btnRTitle.frame = CGRect.init(x: btnRight.frame.width/2-30, y: btnRight.frame.height/2-13, width: (btnRight.frame.width / 2) - 20, height: btnRight.frame.height/2+10)
            btnRTitle.text = "MY LIST"
            btnRTitle.font = UIFont.boldSystemFont(ofSize: 18)
            btnRTitle.textAlignment = .center
            
            btnRight.addSubview(btnRIcon)
            btnRight.addSubview(btnRTitle)
            
            footerView.addSubview(btnLeft)
            footerView.addSubview(btnRight)

            return footerView
        }
           return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //secotion
        if section == 0 {
            return 1
        }else {
            return userModel.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 35
        }else {
        return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //Show collection view
                if let cellCollection = tableView.dequeueReusableCell(withIdentifier: "cellCollection", for: indexPath) as? CollectionViewCell {
                    
                    return cellCollection
                }
            }
            else {
                //Show two buttons left and right
                
            }
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CustomTableViewCell
            cell.videoView.image = userModel[indexPath.row].videoImage
            cell.namelbl.text = userModel[indexPath.row].name
            cell.subLabel.text = userModel[indexPath.row].description
            return cell
        }
        return UITableViewCell()
        
    }
}
