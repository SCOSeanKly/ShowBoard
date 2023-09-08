//
//  LocationObserver.swift
//  ShowBoard
//
//  Created by Sean Kelly on 03/08/2023.
//

import CoreLocation
    
    
class LocationObserver: LocationSubscriberDelegate, ObservableObject {
    
    public let id = UUID()
    @Published var location: CLLocation?
    @Published var city: String = "Error: Unknown"
    @Published var street: String = "Error: Unknown"
    @Published var state: String = "Error: Unknown"
    @Published var country: String = "Error: Unknown"
    @Published var postalCode: String = "Error: Unknown"
    @Published var neighborhood: String = "Error: Unknown"
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    
    deinit {
        AppModel.shared.unsubscribeFromLocationUpdates(self)
    }
    
    func subscribeForLocationUpdates() {
        AppModel.shared.subscribeToLocationUpdates(self)
    }
    
    
    func locationDidUpdate(to location: CLLocation?) {
        DispatchQueue.main.async {
            self.location = location
            guard let loc = location else { return }
            
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(loc) { (placemarks, error) in
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
                    
                    self.latitude = loc.coordinate.latitude
                    self.longitude = loc.coordinate.longitude
                }
            }
        }
    }
}
