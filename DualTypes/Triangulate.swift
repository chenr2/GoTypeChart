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

    @IBOutlet weak var instructionVisualEffects: UIVisualEffectView!
    @IBOutlet weak var locationInstructions: UILabel!
    @IBAction func mark(_ sender: UIBarButtonItem) {
        let currentLocation = mapView.centerCoordinate
        locationArray.append(currentLocation)
        redrawCircles()
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        locationArray = []
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)
    }

    func redrawCircles(){
        guard let currentLocation = currentLocation else { return }
        let circle = MKCircle(center: currentLocation, radius: 200)
        mapView.add(circle)
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentLocation
        mapView.addAnnotation(annotation)
    }
    
    @IBAction func switchTabs(_ sender: AnyObject) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .right)
        
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
        mapView.userTrackingMode = .follow
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        locationManager.stopUpdatingLocation()
    }
}

extension Triangulate : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationInstructions?.text = ""
        instructionVisualEffects.isHidden = true
        guard let location = locations.first else { return }
        let span = MKCoordinateSpanMake(0.007, 0.007)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        currentLocation = location.coordinate
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationInstructions?.text = NSLocalizedString("LOCATION_INSTRUCTIONS", comment: "")
        instructionVisualEffects.isHidden = false
        print("error:: \(error)")
    }
}

extension Triangulate : MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let circle = MKCircleRenderer(overlay: overlay)
        circle.fillColor = UIColor(colorLiteralRed: 0.290, green: 0.565, blue: 0.886, alpha: 0.15)
        circle.strokeColor = UIColor.darkGray
        circle.lineWidth = 1
        return circle
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if annotation is MKUserLocation {
            //return nil so map view draws "blue dot" for standard user location
            return nil
        }
        
        let identifier = "miss"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if pinView == nil {
            pinView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            pinView!.image = UIImage(named: "blank-poke")
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let span = MKCoordinateSpanMake(0.007, 0.007)
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        currentLocation = userLocation.coordinate
        mapView.setRegion(region, animated: false)
    }

}
