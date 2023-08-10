//
//  WeatherIconObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 02/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIconView: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject = WeatherIconLayerObject()
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    
    var body: some View {
        
        ZStack {
            
         //   ProgressView()
            
            Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .objectAppearanceModifier(layer: weatherIconObject, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon Object")
        }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        return WeatherIconView()
    }
}




