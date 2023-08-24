//
//  Weather Icon 5 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon5View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject5 = WeatherIconLayerObject5()
    @Binding var showMicroControls: Bool
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
   
    @State private var imageLoaded = false
    
    var body: some View {
        
        ZStack {
            
            if !imageLoaded {
                ProgressView()
            }
            
          
            
            Image(DynamicText.Placeholder.conditionAsset5.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject5, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}

