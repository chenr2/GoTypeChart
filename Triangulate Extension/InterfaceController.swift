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
            mapView.addAnnotation(coordinate, with: ringImage, centerOffset: CGPoint.zero)
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
    
    func handlePermissionsWarning(_ allowed: Bool){
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
        mapView.addAnnotation(currentLocation, with: pokeMarker, centerOffset: CGPoint.zero)
    }
    
    @IBOutlet var mapView: WKInterfaceMap!
    
    func here(){
        locationManager.requestLocation()
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // infinite polling
        let _ = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(InterfaceController.here), userInfo: nil, repeats: true)

    }
    
    func handleLocationServicesStateNotDetermined(){
        locationManager.requestWhenInUseAuthorization()
    }
    
    func handleLocationServicesAuthorizationStatus(_ status: CLAuthorizationStatus){
        switch status {
        case .notDetermined:
            handleLocationServicesStateNotDetermined()
        case .denied, .restricted:
            handlePermissionsWarning(false)
        case .authorizedWhenInUse, .authorizedAlways:
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
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
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
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        checkPermissions()
        print("error:: \(error)")
    }
}
