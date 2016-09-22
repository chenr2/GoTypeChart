//
//  Triangulate.swift
//  DualTypes
//
//  Created by Robert Chen on 9/18/16.
//  Copyright © 2016 Robert Chen. All rights reserved.
//

import UIKit
import MapKit

class Triangulate: UIViewController {
    
    let locationManager = CLLocationManager()

    var currentLocation:CLLocationCoordinate2D? = nil

    var locationArray:[CLLocationCoordinate2D] = []

    @IBAction func mark(sender: UIBarButtonItem) {
//        guard let currentLocation = currentLocation else { return }
        let currentLocation = mapView.centerCoordinate
        locationArray.append(currentLocation)
        redrawCircles()
    }
    
    @IBAction func clear(sender: UIBarButtonItem) {
        locationArray = []
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
    }

    func redrawCircles(){
        guard let currentLocation = currentLocation else { return }
        let circle = MKCircle(centerCoordinate: currentLocation, radius: 200)
        mapView.addOverlay(circle)
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentLocation
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func switchTabs(sender: AnyObject) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func panGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .Right)
        
        if let tbc = tabBarController as? TabBarController {
            MenuHelper.mapGestureStateToInteractor(
                sender.state,
                progress: progress,
                interactor: tbc.interactor){
                    self.tabBarController?.selectedIndex = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        mapView.userTrackingMode = .Follow
    }
    
}

extension Triangulate : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        let span = MKCoordinateSpanMake(0.007, 0.007)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        currentLocation = location.coordinate
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: (error)")
    }
}

extension Triangulate : MKMapViewDelegate {
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let circle = MKCircleRenderer(overlay: overlay)
        circle.fillColor = UIColor(colorLiteralRed: 0.290, green: 0.565, blue: 0.886, alpha: 0.15)
        circle.strokeColor = UIColor.darkGrayColor()
        circle.lineWidth = 1
        return circle
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView?{
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let identifier = "miss"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinView!.image = UIImage(named: "blank-poke")
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
        let span = MKCoordinateSpanMake(0.007, 0.007)
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        currentLocation = userLocation.coordinate
        mapView.setRegion(region, animated: false)
    }

}
