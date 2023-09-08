//
//  WeatherIcon2View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/08/2023.
//

import SwiftUI
import WeatherKit

struct WeatherIcon2View: View {
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject2 = WeatherIconLayerObject2()
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
            
            Image(DynamicText.Placeholder.conditionAsset2.withCurrentWeather(currentWeather, unit: .celsius))
                .resizable()
                .if(weatherIconObject2.appearance.showReflection) { view in
                    view.reflection(offsetY: weatherIconObject2.appearance.reflectionOffset)
                      
                }
                .scaleEffect(0.5)
                .aspectRatio(contentMode: .fill)
                .onAppear {
                    imageLoaded = true
                }
                .objectAppearanceModifier(layer: weatherIconObject2, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Icon", showMicroControls: $showMicroControls)
        }
    }
}
