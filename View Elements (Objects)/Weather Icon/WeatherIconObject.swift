//
//  WeatherIconObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 02/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIconObjectView: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    var body: some View {
        
        Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

struct WeatherIconObjectView_Previews: PreviewProvider {
    static var previews: some View {
        let locationDataManager = LocationDataManager()
        let weatherKitManager = WeatherKitManager()
        
        return WeatherIconObjectView()
    }
}

