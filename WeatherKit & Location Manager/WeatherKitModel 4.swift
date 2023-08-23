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

@MainActor class WeatherKitManager: ObservableObject {
    
    @Published var weather: Weather?
    
    init() {
        self.weather = nil
    }
    
    
    func getWeather(_ location: CLLocation?) async throws {
        
        guard let location = location else {
            throw NSError(domain: "String", code: 0) as Error
        }
        
        weather = try await Task.detached(priority: .userInitiated) {
            return try await WeatherService.shared.weather(for: .init(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude
            ))
            
        }.value
    }
    
    /*var symbol: String {
        weather?.currentWeather.symbolName ?? "xmark"
    }*/
    
    
    /// Gets the current weather forecast
    /// - Parameter day: The offset value determines which day we want to get.
    /// A `zero` value means, we get the forecast for today
    public func getGorecast(offset day: Int) -> DayWeather? {
        
        guard let forecast = self.weather?.dailyForecast.forecast
        else { return nil }
        
        // Make sure we dont want to acces a bigger index
        if forecast.count <= day { return nil }
        
        return forecast[day]
    }
}



