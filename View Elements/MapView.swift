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
    
    var body: some View {
        ZStack {
            
            MapExtensionView(locationDataManager: locationDataManager)
                .frame(width: map.mapFrameWidth, height: map.mapFrameHeight * 1.35)
                .if(map.mapInvertColor) { view in
                                   view.colorInvert()
                               }
                .overlay(map.mapOverlayColor)
                .mask(
                    RoundedRectangle(cornerRadius: map.mapCornerRadius)
                        .frame(width: map.mapFrameWidth, height: map.mapFrameHeight)
                        .cornerRadius(map.mapCornerRadius)
                )
                .shadow(color: .black.opacity(map.mapShadowOpacity), radius: map.mapShadowRadius, y: map.mapShadowOffset)
                .blendMode(map.appearance.blendMode)
                .opacity(map.mapOpacity)
                .animation(.spring())
                .offset(y: -200)
            
            
            //MARK: Settings for Maps
            VStack {
                
              ResetValues(resetValues: resetMapValues)
                
                SliderStepper(title: "Width:", sliderBindingValue: $map.mapFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 300)
                
                SliderStepper(title: "Height:", sliderBindingValue: $map.mapFrameHeight, minValue: 150, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 150)
                
                SliderStepper(title: "Corner Radius:", sliderBindingValue: $map.mapCornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Opacity:", sliderBindingValue: $map.mapOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                
                SliderStepper(title: "Shadow Radius:", sliderBindingValue: $map.mapShadowRadius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(title: "Shadow Offset:", sliderBindingValue: $map.mapShadowOffset, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(title: "Shadow Opacity:", sliderBindingValue: $map.mapShadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                
                HStack {
                    Text("Blend Mode:")
                    Spacer()
                    Picker("Blend Mode", selection: $map.appearance.blendMode) {
                        ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                            Text(LayerObjectAppearance.labelForBlendMode(mode))
                                .tag(mode)
                        }
                    }
                    .pickerStyle(.menu)
                }
               
                CustomToggle(titleText: "Invert", bindingValue: $map.mapInvertColor, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                
                CustomColorPicker(titleText: "Color Overlay", pickerBindingValue:  $map.mapOverlayColor)
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
            .offset(y: 200)
        }
        .ignoresSafeArea()
    }
    
    private func resetMapValues() {
        
        map.mapFrameWidth = 300
        map.mapFrameHeight = 150
        map.mapCornerRadius = 0
        map.mapOpacity = 1
        map.mapCornerRadius = 0
        map.mapShadowRadius = 0
        map.mapShadowOffset = 0
        map.mapShadowOpacity = 0
        map.appearance.blendMode = .normal
        map.mapOverlayColor = .clear
        map.mapInvertColor = false
         
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, modifier: (Self) -> Content) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationDataManager: LocationDataManager())
    }
}
