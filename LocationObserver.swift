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
    
    
    init() {
        AppModel.shared.subscribeToLocationUpdates(self)
    }
        
    deinit {
        AppModel.shared.unsubscribeFromLocationUpdates(self)
    }
    
    
    func locationDidUpdate(to location: CLLocation?) {
        DispatchQueue.main.async { self.location = location }
    }
}
