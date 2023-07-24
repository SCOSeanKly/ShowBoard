//
//  MapSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct MapSettings: View {
    
    @StateObject var map = MapObject()
    @Binding var showSettings: Bool
    
    var body: some View {
        
        ZStack {
          
            
            VStack {
                
              
                
                ScrollView (showsIndicators: false){
                    
                    LayerBackButton(selfViewToClose: $showSettings, viewToOpen: $showSettings, showLayerElementView: $showSettings, headerText: "Maps", systemImage: "questionmark.circle", systemImage2: "")
                    
                    Group {
                        ResetValues(resetValues: resetMapValues)
                        
                        SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $map.mapFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 300)
                        
                        SliderStepper(color: .blue, title: "Height:", sliderBindingValue: $map.mapFrameHeight, minValue: 150, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 150)
                        
                        SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $map.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $map.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                        
                        SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $map.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                    }
                    Group {
                        SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $map.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $map.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                        
                        CustomToggle(titleText: "Map Dark Mode:", bindingValue: $map.appearance.darkMode, onSymbol: "moon", offSymbol: "sun.max", rotate: true)
                        
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
                        
                        Spacer()
                            .frame(height: 100)
                    }
                    
                }
                .padding(.horizontal)
                .padding(.horizontal)
                .ignoresSafeArea()
            }
            .presentationDetents([.fraction(0.45)])
            .presentationBackground{
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: 9, opaque: true)
                    .background(.white.opacity(0.05))
                
                
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.white.opacity(0.3), lineWidth: 1.0)
        }
       
    }
    
    private func resetMapValues() {
        
        map.mapFrameWidth = 300
        map.mapFrameHeight = 150
        map.appearance.cornerRadius = 0
        map.appearance.opacity = 1
        map.appearance.shadow.radius = 0
        map.appearance.shadow.offset.y = 0
        map.appearance.shadowOpacity = 0.0
        map.appearance.blendMode = .normal
        map.mapOverlayColor = .clear
        map.mapInvertColor = false
        map.appearance.darkMode = false
    }
}

