//
//  LocationDataManager.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/06/2023.
//

import CoreLocation

class LocationDataManager : NSObject, Identifiable, CLLocationManagerDelegate {
    
    public let id = UUID()
    private(set) var location: CLLocation?
    private var locationManager = CLLocationManager()
    private var authorizationStatus: CLAuthorizationStatus?
    private var locationDidUpdate: (CLLocation?) -> Void = { _ in print("Error: No callback has been passed") }

    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    
    public func registerLocationUpdateCallback(_ onLocationUpdate: @escaping (CLLocation?) -> Void) {
        self.locationDidUpdate = onLocationUpdate
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            authorizationStatus = .authorizedWhenInUse
            locationManager.requestLocation()
            break
            
        case .restricted:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .restricted
            break
            
        case .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            authorizationStatus = .denied
            break
            
        case .notDetermined:        // Authorization not determined yet.
            authorizationStatus = .notDetermined
            manager.requestWhenInUseAuthorization()
            break
            
        default:
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.location = locations.last
        self.locationDidUpdate(self.location)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error: \(error.localizedDescription)")
    }
    
    
}

