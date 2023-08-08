//
//  WeatherIconViewSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/08/2023.
//

import SwiftUI

struct WeatherIconViewSettings: View {
    
    @StateObject var weatherIconObject: WeatherIconLayerObject
    
    var body: some View {
        ScrollView (showsIndicators: false){
            
            ResetValues(resetValues: resetWeatherIconValues, systemImageName: "sun.max", titleText: "Weather Icon Object")
            
            SliderStepper(color: .blue, title: "Scale", sliderBindingValue: $weatherIconObject.frameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1.0, specifier: 0, defaultValue: 150)
            
            SliderStepperDegrees(color: .blue, title: "Rotation", sliderBindingValue: $weatherIconObject.appearance.rotation.degrees, minValue: 0, maxValue: 360, step: 1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue:  $weatherIconObject.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $weatherIconObject.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $weatherIconObject.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
            
            Spacer()
                .frame(height: 100)
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
    }
    
    private func resetWeatherIconValues() {
        
        // Add reset values
    }
    
    
    
}
