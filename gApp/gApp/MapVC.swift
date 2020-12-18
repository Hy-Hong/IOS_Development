//
//  MapVC.swift
//  gApp
//
//  Created by Hy Horng on 11/10/20.
//  Copyright © 2020 Hy Horng. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class MapVC: UIViewController {
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var menuImage: UIImageView!
    @IBOutlet var microphoneImage: UIImageView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call a function
        setUpLocationManager()
        //Call a function
        getCurrentLocation()
        
        // Google map SDK Compass
        mapView.settings.compassButton = true

        mapView.bringSubviewToFront(searchBarView)
        
        // Google map SDK: User's location
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //set up search bar
//        setUpCustomSearchBar()
    }
    
    //Function custom search bar
//    func setUpCustomSearchBar() {
//        customSearchBar.placeholder = "Search Google Map"
//    }
    
    //Set up locationManager
    func setUpLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    //Function get current user's location
    func getCurrentLocation() {
        //Ask for authorization from users
        self.locationManager.requestAlwaysAuthorization()
        
        //For users in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
}

extension MapVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else {return }
        mapView.animate(to: GMSCameraPosition(target: locValue, zoom: 20.0))
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
}
