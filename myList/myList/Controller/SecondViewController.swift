//
//  SecondViewController.swift
//  myList
//
//  Created by Hy Horng on 11/17/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //creating search bar
    lazy var searchBar = UISearchBar(frame: CGRect.zero)
    
    var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
//        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.title = "Search"

        //calling function search bar
        setupSearchBar()
        
        setupCollectionView()
    }
    
    //setup collection view
    fileprivate func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(ScrollerCollectionViewCell.self, forCellWithReuseIdentifier: "myCollection")
        collectionView?.register(GreenItemCollectionViewCell.self, forCellWithReuseIdentifier: "myScrollCellId")
        collectionView?.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifire)
        
        view.addSubview(collectionView!)
        collectionView?.frame = view.bounds
        
    }
    
    //setup search bar
    private func setupSearchBar() {
        let seacherController = UISearchController(searchResultsController: nil)
        seacherController.obscuresBackgroundDuringPresentation = false
        seacherController.searchResultsUpdater = self.isViewLoaded as? UISearchResultsUpdating
        self.navigationItem.searchController = seacherController
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.size.width, height: view.frame.size.width/2-95)
        case 1:
            return CGSize(width: view.frame.size.width, height: (view.frame.size.height / 3) + 30)
        default:
            return CGSize(width: view.frame.size.width, height: (view.frame.size.width / 2) - 60)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let secondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCollection", for: indexPath) as!
        ScrollerCollectionViewCell
        
        switch indexPath.section {
        case 0:
            secondCell.movieType = .BesGenre
        case 1:
            secondCell.movieType = .PopularMovie
        case 2:
            secondCell.movieType = .BestActor
        default:
            secondCell.movieType = .none
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
        case 0:
            titleHeader.text = "Best Genre"
        case 1:
            titleHeader.text = "Poppular Movie"
        default:
            titleHeader.text = "Best Actors"
        }
        
        header.addSubview(titleHeader)
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 40)
    }
    
}
