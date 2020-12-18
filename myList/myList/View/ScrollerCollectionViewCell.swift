//
//  SecondCollectionViewCell.swift
//  myList
//
//  Created by Hy Horng on 11/26/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

enum MovieType {
    case BesGenre, PopularMovie, BestActor, none
}

class ScrollerCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var scrollHorizontalCollection: UICollectionView?
    var movieType: MovieType = .none
    
    var listPopularMovieImage: [UIImage] = [UIImage(named: "Banner Movie Vertical – 1")!,
                                            UIImage(named: "Banner Movie Vertical – 2")!,
                                            UIImage(named: "Banner Movie Vertical – 3")!,
                                            UIImage(named: "Banner Movie Vertical – 4")!,
                                            UIImage(named: "Banner Movie Vertical – 5")!,
                                            UIImage(named: "Banner Movie Vertical – 6")!,
                                            UIImage(named: "Banner Movie Vertical – 7")!,
                                            UIImage(named: "Banner Movie Vertical – 8")!,
                                            UIImage(named: "Banner Movie Vertical – 9")!,
                                            UIImage(named: "Banner Movie Vertical – 10")!,
                                            UIImage(named: "Banner Movie Vertical")!]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //function setup layout
    private func setupScrollLayout() {
        let scrollLayout = UICollectionViewFlowLayout()
        scrollLayout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
        scrollHorizontalCollection = UICollectionView(frame: .zero, collectionViewLayout: scrollLayout)
        scrollHorizontalCollection?.delegate = self
        scrollHorizontalCollection?.dataSource = self
        scrollHorizontalCollection?.backgroundColor = .white
        
        scrollHorizontalCollection?.register(GreenItemCollectionViewCell.self, forCellWithReuseIdentifier: "scrollId")
        
        self.addSubview(scrollHorizontalCollection!)
        scrollHorizontalCollection?.frame = bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        
        switch self.movieType {
        case .BesGenre:
            return CGSize(width: (screenSize.width / 2) - 25, height: bounds.height - 10)
        case .PopularMovie:
            return CGSize(width: (screenSize.width / 2) - 25, height: bounds.height - 10)
        case .BestActor:
            return CGSize(width: (screenSize.width / 3) - 20, height: bounds.height - 10)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.movieType {
        case .BesGenre:
            return 10
        case .PopularMovie:
            return listPopularMovieImage.count
        default:
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let scrollCell = scrollHorizontalCollection?.dequeueReusableCell(withReuseIdentifier: "scrollId", for: indexPath) as! GreenItemCollectionViewCell
        scrollCell.layer.cornerRadius = 8
        
        // set best genre cell
        func customBestGenre() {
            let bestGenreImage = UIImageView()
            bestGenreImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height)
            bestGenreImage.image = UIImage(named: "Banner Slide in My List – 3")
            bestGenreImage.contentMode = .scaleAspectFill
            bestGenreImage.clipsToBounds = true
            bestGenreImage.layer.cornerRadius = 8
            
            let shadowView = UIView()
            shadowView.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height)
            shadowView.backgroundColor = .blue
            shadowView.layer.cornerRadius = 8
            shadowView.alpha = 0.7
            
            let bestGenreLabel = UILabel()
            bestGenreLabel.frame = CGRect(x: 0, y: 0, width: shadowView.frame.width, height: shadowView.frame.height)
            bestGenreLabel.text = "Best Genre"
            bestGenreLabel.textAlignment = .center
            bestGenreLabel.font = UIFont.systemFont(ofSize: 18)
            bestGenreLabel.textColor = .white
            
            scrollCell.addSubview(bestGenreImage)
            scrollCell.addSubview(shadowView)
            scrollCell.addSubview(bestGenreLabel)
        }
        
        //function to custom poplular movie
        func customPoplularMovie() {
            let poplularMovieImage = UIImageView()
            poplularMovieImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height - 30)
            poplularMovieImage.image = listPopularMovieImage[indexPath.item]
            poplularMovieImage.contentMode = .scaleAspectFill
            poplularMovieImage.clipsToBounds = true
            poplularMovieImage.layer.cornerRadius = 8
            
            let titleFooter = UILabel()
            scrollCell.addSubview(titleFooter)
            titleFooter.frame = scrollCell.frame
            titleFooter.text = "Best Genre"
            
            titleFooter.translatesAutoresizingMaskIntoConstraints = false
            titleFooter.topAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 1).isActive = true
            titleFooter.leftAnchor.constraint(equalTo: scrollCell.leftAnchor, constant: 0).isActive = true
            titleFooter.rightAnchor.constraint(equalTo: scrollCell.rightAnchor, constant: 0).isActive = true
            titleFooter.bottomAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 0).isActive = true
            titleFooter.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            scrollCell.addSubview(poplularMovieImage)
        }
        
        //function to custom best actors
        func customBestActorImage() {
            let bestActorImage = UIImageView()
            bestActorImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height - 30)
            bestActorImage.image = UIImage(named: "manprofile")
            bestActorImage.contentMode = .scaleAspectFill
            bestActorImage.clipsToBounds = true
            bestActorImage.layer.cornerRadius = 8
            
            let bestActorShadow = UIView()
            bestActorShadow.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: bestActorImage.frame.height)
            bestActorShadow.backgroundColor = .black
            bestActorShadow.layer.cornerRadius = 8
            bestActorShadow.alpha = 0.5
            
            let titleFooter = UILabel()
            scrollCell.addSubview(titleFooter)
            titleFooter.frame = scrollCell.frame
            titleFooter.text = "Best Genre"
            
            titleFooter.translatesAutoresizingMaskIntoConstraints = false
            titleFooter.topAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 1).isActive = true
            titleFooter.leftAnchor.constraint(equalTo: scrollCell.leftAnchor, constant: 0).isActive = true
            titleFooter.rightAnchor.constraint(equalTo: scrollCell.rightAnchor, constant: 0).isActive = true
            titleFooter.bottomAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 0).isActive = true
            titleFooter.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            scrollCell.addSubview(bestActorImage)
            scrollCell.addSubview(bestActorShadow)
        }
        
        switch self.movieType {
        case .BesGenre:
            customBestGenre()
        case .PopularMovie:
            customPoplularMovie()
            
        default:
            customBestActorImage()
        }
        
        return scrollCell
    }
}

class GreenItemCollectionViewCell: UICollectionViewCell {
    
}
