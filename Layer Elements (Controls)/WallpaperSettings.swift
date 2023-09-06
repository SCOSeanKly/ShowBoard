//
//  WallpaperSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 06/09/2023.
//

import SwiftUI

struct WallpaperSettings: View {
    
    @StateObject var wall = imageObject()
    
    var body: some View {
        ScrollView {
            
         
            
            HStack {
                
                Spacer()
                
                Button {
                    wall.appearance.blur = 0
                    wall.appearance.contrast = 1
                    wall.appearance.hue = 0
                    wall.appearance.saturation = 1
                    wall.appearance.pixellate = 1
                    wall.appearance.amplitude = 0
                } label: {
                    Text("Reset")
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            SliderStepper(color: .blue, title: "Blur", sliderBindingValue: $wall.appearance.blur, minValue: 0, maxValue: 100, step: 0.5, specifier: 1, defaultValue: 0)
            
           
            SliderStepper(color: .blue, title: "Hue", sliderBindingValue: Binding<CGFloat>(
                get: { CGFloat(wall.appearance.hue) },
                set: { newValue in
                    wall.appearance.hue = Double(newValue)
                }
            ), minValue: 0, maxValue: 360, step: 0.5, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Contrast", sliderBindingValue: $wall.appearance.contrast, minValue: -10, maxValue: 10, step: 0.5, specifier: 1, defaultValue: 1)
            
            SliderStepper(color: .blue, title: "Saturation", sliderBindingValue: $wall.appearance.saturation, minValue: 0, maxValue: 10, step: 0.5, specifier: 1, defaultValue: 1)
            
            SliderStepper(color: .blue, title: "Pixellate", sliderBindingValue: Binding<CGFloat>(
                get: { CGFloat(wall.appearance.pixellate) },
                set: { newValue in
                    wall.appearance.pixellate = Float(newValue)
                }
            ), minValue: 1, maxValue: 15, step: 0.5, specifier: 1, defaultValue: 1)
            
            SliderStepper(color: .blue, title: "Animated Wave", sliderBindingValue: Binding<CGFloat>(
                get: { CGFloat(wall.appearance.amplitude) },
                set: { newValue in
                    wall.appearance.amplitude = Float(newValue)
                }
            ), minValue: 0, maxValue: 15, step: 0.5, specifier: 1, defaultValue: 0)
       
            Spacer()
                .frame(height: 100)

        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
       
    }
}

#Preview {
    WallpaperSettings()
}

