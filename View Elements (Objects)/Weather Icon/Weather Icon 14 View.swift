//
//  Weather Icon 14 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 25/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon14View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject14 = WeatherIconLayerObject14()
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
            
            Image(DynamicText.Placeholder.conditionAsset14.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .if(weatherIconObject14.appearance.showReflection) { view in
                    view.reflection(offsetY: weatherIconObject14.appearance.reflectionOffset)
                }
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject14, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}
