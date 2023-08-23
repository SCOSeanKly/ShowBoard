//
//  WeatherKitModel.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//
//
//  WeatherKitModel.swift
//
//
//  Created by Szigeti József on 20.06.23.
//


import Foundation
import WeatherKit
import CoreLocation

enum TemperatureUnit {
    case celsius
    case fahrenheit
}

class WeatherKitManager: LocationSubscriberDelegate {

    public let id = UUID()
    private(set) var weather: Weather?
    
    init() {
    }
    
    deinit {
        AppModel.shared.unsubscribeFromLocationUpdates(self)
    }
    
    func getWeather(_ location: CLLocation?) async throws {
        
        guard let location = location else {
            throw NSError(domain: "String", code: 0) as Error
        }
        
        self.weather = try await WeatherService.shared.weather(for: .init(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        ))
        DispatchQueue.main.async {
            AppModel.shared.wObserver.weather = self.weather
        }
    }
    

    func locationDidUpdate(to location: CLLocation?) {
        Task {
            do { try await self.getWeather(location) }
            catch { print(error) }
        }
    }
}



