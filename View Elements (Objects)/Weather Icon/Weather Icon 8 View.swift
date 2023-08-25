//
//  Weather Icon 8 View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 25/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon8View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject8 = WeatherIconLayerObject8()
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
            
            Image(DynamicText.Placeholder.conditionAsset8.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .if(weatherIconObject8.appearance.showReflection) { view in
                    view.reflection(offsetY: weatherIconObject8.appearance.reflectionOffset)
                }
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject8, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}
