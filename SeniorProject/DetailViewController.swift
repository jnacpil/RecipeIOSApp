//
//  DetailViewController.swift
//  SeniorProject
//
//  Created by Janelle Nacpil on 1/27/17.
//  Copyright © 2017 Janelle Nacpil. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class DetailViewController : UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedLocation : LocationModel?
    
    
    override func viewDidLoad(){
    super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Create coordiantes from location lat/lomg
        
        var poiCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
        
        poiCoordinates.latitude = CDouble(self.selectedLocation!.mLatitude!)!
        poiCoordinates.longitude = CDouble(self.selectedLocation!.mLongitude!)!
        
        let viewRegion: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(poiCoordinates, 750, 750)
        self.mapView.setRegion(viewRegion, animated: true)
        let pin: MKPointAnnotation = MKPointAnnotation()
        pin.coordinate = poiCoordinates
        self.mapView.addAnnotation(pin)
        
        pin.title = selectedLocation!.mName
        
    }
}
