//
//  WeatherObserver.swift
//  ShowBoard
//
//  Created by Sean Kelly on 03/08/2023.
//

import Foundation
import WeatherKit


class WeatherObserver: ObservableObject {
    @Published var weather: Weather?
    
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


