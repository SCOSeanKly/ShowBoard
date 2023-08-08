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
    
    deinit {
        AppModel.shared.unsubscribeFromLocationUpdates(self)
    }
    
    func subscribeForLocationUpdates() {
        AppModel.shared.subscribeToLocationUpdates(self)
    }
    
    
    func locationDidUpdate(to location: CLLocation?) {
        DispatchQueue.main.async { self.location = location }
    }
}
