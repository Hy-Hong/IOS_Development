//
//  FirstCollectionViewCell.swift
//  myList
//
//  Created by Hy Horng on 11/27/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit

enum MovieSlideType {
    case LiveStreaming, Ads, NewRelease, PopularVideo, none
}

class FirstCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var scrollHorizontalCollection: UICollectionView?
    var movieSlideType: MovieSlideType = .none
    
    var listPopularMovieImage: [UIImage] = [UIImage(named: "Banner Live Stream")!,
                                            UIImage(named: "Banner Live Stream – 1")!,
                                            UIImage(named: "Banner Live Stream – 2")!]
    
    var listBannerSlideImage: [UIImage] = [UIImage(named: "Banner Slide – 1")!,
                                            UIImage(named: "Banner Slide – 2")!,
                                            UIImage(named: "Banner Slide in My List – 1")!,
                                            UIImage(named: "Banner Slide in My List – 2")!,
                                            UIImage(named: "Banner Slide in My List – 3")!,
                                            UIImage(named: "Banner Slide in My List – 4")!,
                                            UIImage(named: "Banner Slide in My List")!,
                                            UIImage(named: "Banner Slide")!]
    
    var listBannerVerticalMovie: [UIImage] = [UIImage(named: "Banner Movie Vertical – 1")!,
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
        
        scrollHorizontalCollection?.register(FirstItemCollectionViewCell.self, forCellWithReuseIdentifier: "scrollId")
        
        self.addSubview(scrollHorizontalCollection!)
        scrollHorizontalCollection?.frame = bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds
        
        switch self.movieSlideType {
        case .LiveStreaming:
            return CGSize(width: (screenSize.width - 140), height: bounds.height - 35)
        case .Ads:
            return CGSize(width: (screenSize.width) - 15, height: bounds.height - 5)
        case .NewRelease:
            return CGSize(width: (screenSize.width / 2) - 25, height: bounds.height - 10)
        case .PopularVideo:
            return CGSize(width: (screenSize.width / 2) - 25, height: bounds.height - 10)
        default:
            return CGSize(width: (screenSize.width - 50), height: bounds.height - 5)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.movieSlideType {
        case .LiveStreaming:
            return listPopularMovieImage.count
        case .NewRelease:
            return listBannerVerticalMovie.count
        case .PopularVideo:
            return listBannerVerticalMovie.count
        default:
            return listBannerSlideImage.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let scrollCell = scrollHorizontalCollection?.dequeueReusableCell(withReuseIdentifier: "scrollId", for: indexPath) as! FirstItemCollectionViewCell
        scrollCell.layer.cornerRadius = 8
        
        //function to custom poplular movie
        func customLiveStreaming() {
            let poplularVideoImage = UIImageView()
            poplularVideoImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height - 30)
            poplularVideoImage.image = listPopularMovieImage[indexPath.item]
            poplularVideoImage.contentMode = .scaleAspectFill
            poplularVideoImage.clipsToBounds = true
            poplularVideoImage.layer.cornerRadius = 8
            
            let titleFooter = UILabel()
            scrollCell.addSubview(titleFooter)
            titleFooter.frame = scrollCell.frame
            titleFooter.text = "Live Streaming"
            
            titleFooter.translatesAutoresizingMaskIntoConstraints = false
            titleFooter.topAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 1).isActive = true
            titleFooter.leftAnchor.constraint(equalTo: scrollCell.leftAnchor, constant: 0).isActive = true
            titleFooter.rightAnchor.constraint(equalTo: scrollCell.rightAnchor, constant: 0).isActive = true
            titleFooter.bottomAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 0).isActive = true
            titleFooter.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            scrollCell.addSubview(poplularVideoImage)
            
            setupLiveViewComponent()
        }
        
        //Function to set up live views components
        func setupLiveViewComponent() {
            let bgLiveStreaming = UIView()
            bgLiveStreaming.frame = CGRect(x: 5, y: 5, width: 53, height: 20)
            bgLiveStreaming.backgroundColor = .red
            bgLiveStreaming.layer.cornerRadius = 5
            bgLiveStreaming.alpha = 0.8
            
            let iconLiveStreaming = UIView()
            iconLiveStreaming.frame = CGRect(x: bgLiveStreaming.frame.width - 43, y: (bgLiveStreaming.frame.height / 2) + 2, width: 6, height: 6)
            iconLiveStreaming.backgroundColor = .white
            iconLiveStreaming.layer.cornerRadius = iconLiveStreaming.frame.width / 2
            iconLiveStreaming.clipsToBounds = true
            
            let liveStreamingTitle = UILabel()
            liveStreamingTitle.frame = CGRect(x: bgLiveStreaming.frame.width - 34, y: 5, width: 35, height: 20)
            liveStreamingTitle.text = "Live"
            liveStreamingTitle.textColor = .white
            liveStreamingTitle.textAlignment = .center
            liveStreamingTitle.layer.cornerRadius = 5
            liveStreamingTitle.clipsToBounds = true
            
            let bgViewLiveStreaming = UIView()
            bgViewLiveStreaming.frame = CGRect(x: 65, y: 5, width: 65, height: 20)
            bgViewLiveStreaming.backgroundColor = .black
            bgViewLiveStreaming.alpha = 0.5
            bgViewLiveStreaming.layer.cornerRadius = 5
            
            let viewIcon = UIImageView()
            viewIcon.frame = CGRect(x: bgViewLiveStreaming.frame.width + 5, y: 5, width: 20, height: 20)
            viewIcon.image = UIImage(named: "Eye blue")
            viewIcon.clipsToBounds = true
            viewIcon.contentMode = .scaleAspectFit
            viewIcon.image = viewIcon.image?.withRenderingMode(.alwaysTemplate)
            viewIcon.tintColor = UIColor.white
            
            let viewStreaming = UILabel()
            viewStreaming.frame = CGRect(x: bgViewLiveStreaming.frame.width + 25, y: 5, width: 35, height: 20)
            viewStreaming.text = "576"
            viewStreaming.textAlignment = .center
            viewStreaming.textColor = .white
            viewStreaming.font = UIFont.systemFont(ofSize: 17)
            viewStreaming.layer.cornerRadius = 5
            viewStreaming.clipsToBounds = true
            
            scrollCell.addSubview(bgLiveStreaming)
            scrollCell.addSubview(iconLiveStreaming)
            scrollCell.addSubview(liveStreamingTitle)
            scrollCell.addSubview(bgViewLiveStreaming)
            scrollCell.addSubview(viewIcon)
            scrollCell.addSubview(viewStreaming)
        }
        
        //function to custom poplular movie
        func customNewReleaseAndPopularVideo() {
            let poplularVideoAndNewReleaseImage = UIImageView()
            poplularVideoAndNewReleaseImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height - 30)
            poplularVideoAndNewReleaseImage.image = listBannerVerticalMovie[indexPath.item]
            poplularVideoAndNewReleaseImage.contentMode = .scaleAspectFill
            poplularVideoAndNewReleaseImage.clipsToBounds = true
            poplularVideoAndNewReleaseImage.layer.cornerRadius = 8
            
            let titleFooter = UILabel()
            scrollCell.addSubview(titleFooter)
            titleFooter.text = "Best Genre"
            
            titleFooter.translatesAutoresizingMaskIntoConstraints = false
            titleFooter.topAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 1).isActive = true
            titleFooter.leftAnchor.constraint(equalTo: scrollCell.leftAnchor, constant: 0).isActive = true
            titleFooter.rightAnchor.constraint(equalTo: scrollCell.rightAnchor, constant: 0).isActive = true
            titleFooter.bottomAnchor.constraint(equalTo: scrollCell.bottomAnchor, constant: 0).isActive = true
            titleFooter.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            scrollCell.addSubview(poplularVideoAndNewReleaseImage)
            
            setupLiveViewComponent()
        }
        
        //function to custom best actors
        func customBestAdsImage() {
            let bestAdsImage = UIImageView()
            bestAdsImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height)
            bestAdsImage.image = UIImage(named: "Banner Ads")
            bestAdsImage.contentMode = .scaleAspectFill
            bestAdsImage.clipsToBounds = true
            bestAdsImage.layer.cornerRadius = 8
            
            scrollCell.addSubview(bestAdsImage)
        }
        
        //function to custom defualt
        func customFirstHeaderImage() {
            let firstHeaderImage = UIImageView()
            firstHeaderImage.frame = CGRect(x: 0, y: 0, width: scrollCell.frame.width, height: scrollCell.frame.height)
            firstHeaderImage.image = listBannerSlideImage[indexPath.item]
            firstHeaderImage.contentMode = .scaleAspectFill
            firstHeaderImage.clipsToBounds = true
            firstHeaderImage.layer.cornerRadius = 8
            
            scrollCell.addSubview(firstHeaderImage)
            
        }
        
        switch self.movieSlideType {
            
        case .LiveStreaming:
            customLiveStreaming()
        case .NewRelease:
            customNewReleaseAndPopularVideo()
        case .PopularVideo:
            customNewReleaseAndPopularVideo()
        case .Ads:
            customBestAdsImage()
        default:
            customFirstHeaderImage()
        }
        
        return scrollCell
    }
    
}

class FirstItemCollectionViewCell: UICollectionViewCell {
    
}
