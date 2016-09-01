//
//  InterfaceController.swift
//  Triangulate Extension
//
//  Created by Robert Chen on 8/31/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import WatchKit
import Foundation
import MapKit

class InterfaceController: WKInterfaceController {

    let locationManager = CLLocationManager()
    
    @IBOutlet var mapView: WKInterfaceMap!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Configure interface objects here.
    }
    
    func handleLocationServicesStateNotDetermined(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func handleLocationServicesStateUnavailable(){
        
    }
    
    func handleLocationServicesStateAvailable(){
        
    }
    
    func handleLocationServicesAuthorizationStatus(status: CLAuthorizationStatus){
        switch status {
        case .NotDetermined:
            handleLocationServicesStateNotDetermined()
        case .Restricted, .Denied:
            handleLocationServicesStateUnavailable()
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            handleLocationServicesStateAvailable()
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        let authorizationStatus = CLLocationManager.authorizationStatus()
        handleLocationServicesAuthorizationStatus(authorizationStatus)
        locationManager.requestLocation()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

extension InterfaceController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedAlways {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.006, 0.006)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region)
            
//            mapView.addAnnotation(location.coordinate, withImageNamed: "currentPosition", centerOffset: CGPointZero)
            mapView.addAnnotation(location.coordinate, withImage: UIImage(named: "currentPosition")!, centerOffset: CGPointZero)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: \(error)")
    }
}
