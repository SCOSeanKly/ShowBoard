//
//  AppModel.swift
//  ShowBoard
//
//  Created by Sean Kelly on 03/08/2023.
//

import CoreLocation

protocol LocationSubscriberDelegate: AnyObject, Identifiable {
    func locationDidUpdate(to location: CLLocation?)
}




class AppModel {
    
    public static var shared: AppModel = AppModel()

    private(set) var lObserver: LocationObserver
    private(set) var wObserver: WeatherObserver
    
    private var wk: WeatherKitManager
    private var lm: LocationDataManager
    private var locationSubscribers: [(any LocationSubscriberDelegate)?]
    
    
    init() {
        self.locationSubscribers = .init()
        self.lm = LocationDataManager()
        self.wk = WeatherKitManager()
        self.lObserver = LocationObserver()
        self.wObserver = WeatherObserver()
        lm.registerLocationUpdateCallback(self.locationDidUpdate)
    }
    
    
    public func subscribeToLocationUpdates(_ subscriber: any LocationSubscriberDelegate) {
        if self.locationSubscribers.contains(where: { $0?.id == subscriber.id }) {
            return
        }
        self.locationSubscribers.append(subscriber)
    }
    
    
    public func unsubscribeFromLocationUpdates(_ subscriber: any LocationSubscriberDelegate) {
        self.locationSubscribers.removeAll(where: { $0?.id == subscriber.id })
    }
    
    
    
    
    private func locationDidUpdate(to location: CLLocation?) {
        for subscriber in self.locationSubscribers {
            subscriber?.locationDidUpdate(to: location)
        }
    }
}
