//
//  ViewController.swift
//  Za
//
//  Created by Laviolette, Akivah - Student on 2/7/23.
//

import UIKit
import MapKit
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var currentLocation: CLLocation!
    let locationManager = CLLocationManager()
    var pizza: [MKMapItem] = []
    var initialRegion: MKCoordinateRegion!
    var isInitialMapLoad: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        mapView.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        
    }
    @IBOutlet weak var mapView: MKMapView!
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations[0]
        print(currentLocation)
    }
    @IBAction func whenZoomButtonPressed(_ sender: Any) {
    
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = currentLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        mapView.setRegion(region, animated: true)
        
    }
    
    
    }
