//
//  WeatherIconTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 16/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIconTest: View {
    
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject private var weatherIconObject = WeatherIconLayerObject(activeWeatherIconImageSet: .set2)
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    
    var body: some View {
        
        VStack {
            Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .id(UUID())
            
            Button("Change Set") {
                let newSet: WeatherIconLayerObject.WeatherIconImageSet
                switch weatherIconObject.activeWeatherIconImageSet {
                case .set1:
                    newSet = .set1
                case .set2:
                    newSet = .set2
                case .set3:
                    newSet = .set3
                case .set4:
                    newSet = .set4
                case .set5:
                    newSet = .set5
                case .set6:
                    newSet = .set6
                }
                print("Changing weather icon set to: \(newSet)")
                weatherIconObject.changeActiveWeatherIconSet(to: newSet)
            }
        }
    }
}



struct WeatherIconTest_Previews: PreviewProvider {
    static var previews: some View {
        WeatherIconTest()
    }
}
