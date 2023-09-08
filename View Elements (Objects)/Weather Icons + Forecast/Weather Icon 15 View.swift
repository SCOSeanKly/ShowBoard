//
//  Weather Icon 15 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 25/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon15View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject15 = WeatherIconLayerObject15()
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
            
            Image(DynamicText.Placeholder.conditionAsset15.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .if(weatherIconObject15.appearance.showReflection) { view in
                    view.reflection(offsetY: weatherIconObject15.appearance.reflectionOffset)
                }
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject15, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}
