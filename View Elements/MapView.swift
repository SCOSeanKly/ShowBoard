//
//  MapView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var locationDataManager: LocationDataManager
    @StateObject var map = MapObject()
    
    @State private var blendMode: BlendMode = .normal
    @State private var colorOverlay: Color = .clear
    
    let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    var body: some View {
        ZStack {
            
            MapExtensionView(locationDataManager: locationDataManager)
                .frame(width: map.mapFrameWidth, height: map.mapFrameHeight * 1.3)
                .overlay(colorOverlay)
                .mask(
                    RoundedRectangle(cornerRadius: map.mapCornerRadius)
                        .frame(width: map.mapFrameWidth, height: map.mapFrameHeight)
                        .cornerRadius(map.mapCornerRadius)
                )
                .shadow(radius: map.mapShadowRadius, y: map.mapShadowOffset)
                .blendMode(map.appearance.blendMode)
              
                .opacity(map.mapOpacity)
                .offset(y: -200)
            
            
            //MARK: Settings for Maps
            VStack {
                
              ResetValues(resetValues: resetValues)
                
                SliderStepper(title: "Width: ", sliderBindingValue: $map.mapFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 300)
                
                SliderStepper(title: "Height: ", sliderBindingValue: $map.mapFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 150)
                
                SliderStepper(title: "Corner Radius: ", sliderBindingValue: $map.mapCornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Opacity: ", sliderBindingValue: $map.mapOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                
                SliderStepper(title: "Shadow Radius: ", sliderBindingValue: $map.mapShadowRadius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(title: "Shadow Offset: ", sliderBindingValue: $map.mapShadowOffset, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                
                HStack {
                    Text("Blend Mode: ")
                    Spacer()
                    Picker("Blend Mode", selection: $map.appearance.blendMode) {
                        ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                            Text(LayerObjectAppearance.labelForBlendMode(mode))
                                .tag(mode)
                        }
                    }
                    .pickerStyle(.menu)
                }
               
                ColorPicker("Color Overlay", selection: $colorOverlay)
                
            }
            .padding()
            .offset(y: 200)
        }
        .ignoresSafeArea()
    }
    
    private func resetValues() {
        /*
        width = 300
        height = 150
        cornerRadius = 0
        shadowRadius = 0
        shadowOffset = 0
        blendMode = .normal
        colorOverlay = .clear
         */
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationDataManager: LocationDataManager())
    }
}
