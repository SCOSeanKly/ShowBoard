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
            
            ProgressView()
            
            Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: weatherIconObject.frameHeight, height: weatherIconObject.frameHeight)
                .rotationEffect(weatherIconObject.appearance.rotation)
                .shadow(color: .black.opacity(weatherIconObject.appearance.shadowOpacity), radius: weatherIconObject.appearance.shadow.radius, y: weatherIconObject.appearance.shadow.offset.y)
                .animation(.spring())
                .onTapGesture {
                   
                    weatherIconObject.appearance.showSettings.toggle()
                }
        }
            .sheet(isPresented: $weatherIconObject.appearance.showSettings){
                
                WeatherIconViewSettings(weatherIconObject: weatherIconObject)
                
            }
    }
}

struct WeatherIconView_Previews: PreviewProvider {
    static var previews: some View {
        return WeatherIconView()
    }
}




