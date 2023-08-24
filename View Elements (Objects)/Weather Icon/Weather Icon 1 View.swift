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
            
          
            
            Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}


