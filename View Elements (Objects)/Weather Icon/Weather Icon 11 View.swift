//
//  Weather Icon 11 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 25/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon11View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject11 = WeatherIconLayerObject11()
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
            
            Image(DynamicText.Placeholder.conditionAsset11.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .if(weatherIconObject11.appearance.showReflection) { view in
                    view.reflection(offsetY: weatherIconObject11.appearance.reflectionOffset)
                }
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject11, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}
