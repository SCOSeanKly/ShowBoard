//
//  Weather Icon +3 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIconPlus7View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject = WeatherIconLayerObjectPlus7()
    @Binding var showMicroControls: Bool
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    @State private var imageLoaded = false
    
    let widthHeight: CGFloat = 50
  

    

    var body: some View {
        
     
        ZStack {
            if !imageLoaded {
                ProgressView()
            }
            
            Group {
                if weatherIconObject.appearance.showHorizontal {
                    HStack(spacing: weatherIconObject.appearance.spacing) {
                        ForEach(1...Int(weatherIconObject.appearance.daysToShow), id: \.self) { offset in
                            weatherImage(forOffset: offset)
                        }
                    }
                } else {
                    VStack(spacing: weatherIconObject.appearance.spacing) {
                        ForEach(1...Int(weatherIconObject.appearance.daysToShow), id: \.self) { offset in
                            weatherImage(forOffset: offset)
                        }
                    }
                }
            }
            
          
        }
        .onAppear {
            imageLoaded = true
        }
        .objectAppearanceModifier(layer: weatherIconObject, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
    }
    
    private func weatherImage(forOffset offset: Int) -> some View {
        let dayWeather = wObserver.getGorecast(offset: offset)
        
        let highTempString = DynamicText.Placeholder.highTemp.withDayWeather(dayWeather, unit: .celsius, conditionAssetStyle: 1)
        let lowTempString = DynamicText.Placeholder.lowTemp.withDayWeather(dayWeather, unit: .celsius, conditionAssetStyle: 1)
        
        return VStack {
            if weatherIconObject.appearance.showForecastTempString {
                Text(highTempString)
                    .font(.system(size: 10))
                    .foregroundColor(weatherIconObject.appearance.minMaxValueLabelColor)
                    .offset(y: weatherIconObject.appearance.labelsOffset)
            }
            
            Image(DynamicText.Placeholder.conditionAsset.withDayWeather(dayWeather, unit: .celsius, conditionAssetStyle: weatherIconObject.appearance.weatherIconAssetStyle))

                .resizable()
                .frame(width: widthHeight, height: widthHeight, alignment: .center)
                .aspectRatio(contentMode: .fill)
            if weatherIconObject.appearance.showForecastTempString {
                Text(lowTempString)
                    .font(.system(size: 10))
                    .foregroundColor(weatherIconObject.appearance.minMaxValueLabelColor)
                    .offset(y: -weatherIconObject.appearance.labelsOffset)
            }
        }
        .frame(width: widthHeight, height: widthHeight * 3, alignment: .center)
    }

}
