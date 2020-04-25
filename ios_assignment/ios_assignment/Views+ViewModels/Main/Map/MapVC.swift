//
//  MapVC.swift
//  ios_assignment
//
//  Created by Thanushka on 4/25/20.
//  Copyright © 2020 thanushka. All rights reserved.
//

import UIKit
import MapKit
class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    var hotel:Hotel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapInfo()
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
    }
    

}

extension MapVC: MKMapViewDelegate {
    
    // function to setup map and add hotel details
    func setMapInfo() {
        let center = CLLocationCoordinate2D(latitude: Double(hotel.latitude ?? "0.0")!, longitude: Double(hotel.longitude ?? "0.0")!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.8, longitudeDelta: 0.8))
           
        mapView.showsUserLocation = true
        mapView.mapType = .standard
        mapView.delegate = self
        mapView.setRegion(region, animated: true)

        let annotation = MKPointAnnotation()
        annotation.title = hotel.address ?? ""
        annotation.subtitle = hotel.title
        annotation.coordinate = center
        mapView.addAnnotation(annotation)

    }
    
}
