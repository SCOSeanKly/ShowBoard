//
//  LocationModel.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/09/2023.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    
    @Published var locationManager = CLLocationManager()
    
    @Published var city: String = "Error: Unknown"
    @Published var street: String = "Error: Unknown"
    @Published var state: String = "Error: Unknown"
    @Published var country: String = "Error: Unknown"
    @Published var postalCode: String = "Error: Unknown"
    @Published var neighborhood: String = "Error: Unknown"
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if let placemark = placemarks?.first {
                    if let city = placemark.locality {
                        self.city = city
                    }
                    if let street = placemark.thoroughfare {
                        self.street = street
                    }
                    if let state = placemark.administrativeArea {
                        self.state = state
                    }
                    if let country = placemark.country {
                        self.country = country
                    }
                    if let postalCode = placemark.postalCode {
                        self.postalCode = postalCode
                    }
                    if let neighborhood = placemark.subLocality {
                        self.neighborhood = neighborhood
                    }
                    
                    self.latitude = location.coordinate.latitude
                    self.longitude = location.coordinate.longitude
                }
            }
        }
    }
}
