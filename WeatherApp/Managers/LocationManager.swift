//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Sakshi Chavre on 31/05/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let Manager = CLLocationManager()
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        Manager.delegate = self
    }
    
    func requestLocation (){
        isLoading = true
        Manager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Error getting Location", error)
        isLoading = false
    }
}
