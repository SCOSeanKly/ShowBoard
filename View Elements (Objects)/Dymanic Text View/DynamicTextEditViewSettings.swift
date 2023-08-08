//
//  DynamicTextEditViewSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct DynamicTextEditViewSettings: View {
    
    @StateObject var text: TextObject
    @State private var doNothing: Bool = false
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            
            HStack {
                
                Image(systemName: "character.textbox")
                    .font(.title3)
                
                HStack {
                    Text("Dynamic Text Object")
                        .font(.headline.weight(.semibold))
                }
                
                Spacer()
                
            }
            .padding()
            
          
            if !text.isKeyboardPresented {
                    ResetValues(resetValues: resetDynamicTextValues)
                }
                
                DynamicTextView(text: text)
                
            if !text.isKeyboardPresented {
                    Group {
                        CustomFontPicker(bindingValue: $text.selectedFontName, text: text)
                        
                        HStack {
                            Text("Alignment:")
                                .titleFont()
                            Spacer()
                            Picker("Alignment", selection: $text.textAlignment) {
                                ForEach(text.alignmentOptions, id: \.self) { alignmentOption in
                                    Text(alignmentOption.description).tag(alignmentOption)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        .frame(height: 30)
                        .padding(.horizontal)
                        
                        SliderStepper(color: .blue, title: "Font Size:", sliderBindingValue: $text.fontSize, minValue: 1, maxValue: 200, step: 1, specifier: 0, defaultValue: 16)
                    }
                    
                    Group {
                        SliderStepper(color: .blue, title: "Tracking:", sliderBindingValue: $text.fontTracking, minValue: 0, maxValue: 20, step: 1, specifier: 0, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Frame Width:", sliderBindingValue: $text.fontFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 0.1, specifier: 1, defaultValue: 200)
                        
                        SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $text.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                    }
                    
                    Group {
                        SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $text.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $text.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $text.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                        
                        SliderStepperDegrees(color: .blue, title: "Rotation:", sliderBindingValue: $text.appearance.rotation.degrees, minValue: 0, maxValue: 360, step: 1, specifier: 0, defaultValue: 0)
                            .onChange(of: text.appearance.rotation) { text.appearance.rotation = $0 }
                        
                        CustomBlendModePicker(bindingValue: $text.appearance.blendMode)
                        
                        CustomColorPicker(titleText: "Font Colour", pickerBindingValue: $text.fontColor)
                    }
                    
                    
                    
                    
                    Spacer()
                        .frame(height: 100)
                }
            
            
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
        
    }
    
    private func resetDynamicTextValues() {
        /*fontName = "Autone"
         fontSize = 26
         fontWeight = .regular
         fontColor = .white
         text.appearance.rotation = .zero*/
    }
}

extension TextAlignment: CustomStringConvertible {
    public var description: String {
        switch self {
        case .leading:
            return "Leading"
        case .center:
            return "Center"
        case .trailing:
            return "Trailing"
        }
    }
}

