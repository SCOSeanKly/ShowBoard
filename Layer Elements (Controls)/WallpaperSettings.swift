//
//  WallpaperSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 06/09/2023.
//

import SwiftUI

struct WallpaperSettings: View {
    
    @StateObject var layer: LayerObject
    @State private var doNothing: Bool = false
    
    var body: some View {
        ScrollView {
            
            ResetValues(resetValues: {
                layer.appearance.blur = 0
                layer.appearance.contrast = 1
                layer.appearance.hue = 0
                layer.appearance.saturation = 1
                layer.appearance.pixellate = 1
            },
                showMicroControls: $doNothing, systemImageName: "gearshape", titleText: "Wallpaper Settings", showMicroControlsButton: false)
            
            
            SliderStepper(color: .blue, title: "Blur", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 100, step: 0.5, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Hue", sliderBindingValue: Binding<CGFloat>(
                get: { CGFloat(layer.appearance.hue) },
                set: { newValue in
                    layer.appearance.hue = Double(newValue)
                }
            ), minValue: 0, maxValue: 360, step: 0.5, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Contrast", sliderBindingValue: $layer.appearance.contrast, minValue: -10, maxValue: 10, step: 0.5, specifier: 1, defaultValue: 1)
            
            SliderStepper(color: .blue, title: "Saturation", sliderBindingValue: $layer.appearance.saturation, minValue: 0, maxValue: 10, step: 0.5, specifier: 1, defaultValue: 1)
            
            
            if #available(iOS 17.0, *) {
                SliderStepper(color: .blue, title: "Pixellate", sliderBindingValue: Binding<CGFloat>(
                    get: { CGFloat(layer.appearance.pixellate) },
                    set: { newValue in
                        layer.appearance.pixellate = Float(newValue)
                    }
                ), minValue: 1, maxValue: 15, step: 0.5, specifier: 1, defaultValue: 1)
            }
             
            
            Spacer()
                .frame(height: 100)
            
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
        
    }
    
}



