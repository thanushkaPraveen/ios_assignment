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
        
//        let location = CLLocation(latitude: 37.000, longitude: -122.00000)
//
//        mapView.delegate = self as MKMapViewDelegate
        setMapInfo()
        
        // Do any additional setup after loading the view.
    }
    
    func setMapInfo() {
        
        let coordinates = CLLocationCoordinate2DMake(Double(hotel!.latitude!)!, Double(hotel!.longitude!)!)
        let regionSpan =   MKCoordinateRegion(center: coordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = hotel.address
        mapItem.openInMaps(launchOptions:[
        MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center)
        ] as [String : Any])
        
    }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
     
    }
    

}

extension MapVC: MKMapViewDelegate{
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("rendering....")
    }
}
