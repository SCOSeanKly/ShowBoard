//
//  WeatherIconObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 02/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIconObjectView: View {
    @ObservedObject var locationDataManager: LocationDataManager
    @ObservedObject var weatherKitManager: WeatherKitManager
    
    var currentWeather: CurrentWeather? {
        weatherKitManager.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        weatherKitManager.getGorecast(offset: 0)
    }
    
    var body: some View {
        
        Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
           
            .task {
                
                do {
                    try await weatherKitManager.getWeather(locationDataManager.location)
                }
                catch { }
            }
    }
}

struct WeatherIconObjectView_Previews: PreviewProvider {
    static var previews: some View {
        let locationDataManager = LocationDataManager()
        let weatherKitManager = WeatherKitManager()
        
        return WeatherIconObjectView(locationDataManager: locationDataManager, weatherKitManager: weatherKitManager)
    }
}

