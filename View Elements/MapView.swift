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
                    RoundedRectangle(cornerRadius: map.appearance.cornerRadius)
                        .frame(width: map.mapFrameWidth, height: map.mapFrameHeight)
                        .cornerRadius(map.appearance.cornerRadius)
                )
                .shadow(color: .black.opacity(map.appearance.shadowOpacity), radius: map.appearance.shadow.radius, y: map.appearance.shadow.offset.y)
                .blendMode(map.appearance.blendMode)
                .opacity(map.appearance.opacity)
                .animation(.spring())
                .offset(y: -200)
            
            
            //MARK: Settings for Maps
            VStack {
                
              ResetValues(resetValues: resetMapValues)
                
                SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $map.mapFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 300)
                
                SliderStepper(color: .blue, title: "Height:", sliderBindingValue: $map.mapFrameHeight, minValue: 150, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 150)
                
                SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $map.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $map.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                
                SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $map.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $map.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $map.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                
              
                HStack {
                    Text("Blend Mode:")
                        .titleFont()
                    Spacer()
                    Picker("Blend Mode", selection: $map.appearance.blendMode) {
                        ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                            Text(LayerObjectAppearance.labelForBlendMode(mode))
                                .tag(mode)
                        }
                    }
                    .pickerStyle(.menu)
                    .scaleEffect(0.8)
                    .offset(x: 20)
                }
                 
               
                CustomToggle(titleText: "Invert", bindingValue: $map.mapInvertColor, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                
                CustomColorPicker(titleText: "Color Overlay", pickerBindingValue:  $map.mapOverlayColor)
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .padding()
            .offset(y: 175)
        }
        .ignoresSafeArea()
        
        
    }
    
   
    
    private func resetMapValues() {
        
        map.mapFrameWidth = 300
        map.mapFrameHeight = 150
        map.appearance.cornerRadius = 0
        map.appearance.opacity = 1
        map.appearance.shadow.radius = 0
        map.appearance.shadow.offset.y = 0
        map.appearance.shadowOpacity = 0
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
