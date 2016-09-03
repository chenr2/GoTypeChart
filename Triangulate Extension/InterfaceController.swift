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
    
    var currentLocation:CLLocationCoordinate2D? = nil
    
    var locationArray:[CLLocationCoordinate2D] = []
    
    func redrawCircles(){
        guard let ringImage = UIImage(named: "ring") else { return }
        mapView.removeAllAnnotations()
        _ = locationArray.map { coordinate in
            mapView.addAnnotation(coordinate, withImage: ringImage, centerOffset: CGPointZero)
        }
        addCurrentPosition()
    }
    
    @IBOutlet var permissionsWarning: WKInterfaceLabel!
    
    @IBAction func clearMenu() {
        locationArray = []
        redrawCircles()
    }
    
    @IBAction func addMenu() {
        guard let currentLocation = currentLocation else { return }
        locationArray.append(currentLocation)
        redrawCircles()
    }
    
    func handlePermissionsWarning(allowed: Bool){
        if allowed {
            mapView.setHidden(false)
            permissionsWarning.setHidden(true)
        } else {
            mapView.setHidden(true)
            permissionsWarning.setHidden(false)
        }
    }
    
    func addCurrentPosition(){
        guard let currentLocation = currentLocation,
            let pokeMarker = UIImage(named: "currentPosition") else { return }
        mapView.addAnnotation(currentLocation, withImage: pokeMarker, centerOffset: CGPointZero)
    }
    
    @IBOutlet var mapView: WKInterfaceMap!
    
    func here(){
        locationManager.requestLocation()
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // infinite polling
        let _ = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: #selector(InterfaceController.here), userInfo: nil, repeats: true)

    }
    
    func handleLocationServicesStateNotDetermined(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func handleLocationServicesAuthorizationStatus(status: CLAuthorizationStatus){
        switch status {
        case .NotDetermined:
            handleLocationServicesStateNotDetermined()
        case .Denied, .Restricted:
            handlePermissionsWarning(false)
        case .AuthorizedWhenInUse, .AuthorizedAlways:
            handlePermissionsWarning(true)
        }
    }
    
    func checkPermissions(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        handleLocationServicesAuthorizationStatus(authorizationStatus)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        checkPermissions()
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
        guard let location = locations.first else {
            return
        }
        handlePermissionsWarning(true)
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region)
        currentLocation = location.coordinate
        redrawCircles()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        checkPermissions()
        print("error:: \(error)")
    }
}
