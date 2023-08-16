//
//  DynamicTextEditViewSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct DynamicTextEditViewSettings: View {
    
    @StateObject var text: TextObject
    @State private var showFontPickerSheet: Bool = false
    @Binding var showMicroControls: Bool
   
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            if !text.isKeyboardPresented {
                
                if showMicroControls {
                    MicroControlsView(showMicroControls: $showMicroControls, layer: text)
                }
                
                ResetValues(resetValues: resetDynamicTextValues, showMicroControls: $showMicroControls, systemImageName: "character.textbox", titleText: "Dynamic Text Object")
                }
                
                DynamicTextView(text: text)
                
            if !text.isKeyboardPresented {
                    Group {
                        
                        CustomToggle(showTitleText: true, titleText: "Circle Text", bindingValue: $text.isCircleText, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                        
                        HStack {
                            
                            Text("Select a font")
                                .titleFont()
                          
                            Spacer()
                            Button {
                                showFontPickerSheet.toggle()
                            } label: {
                                Text("Selected: \(text.selectedFontName)")
                                    .scaleEffect(0.8)
                            }
                            
                        }
                        .padding(.horizontal)
                        
                        if !text.isCircleText {
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
                                .scaleEffect(0.8)
                            }
                            .frame(height: 30)
                            .padding(.horizontal)
                        }
                        
                        SliderStepper(color: .blue, title: "Drop Last:", sliderBindingValue: $text.dropLast, minValue: 0, maxValue: 20, step: 1, specifier: 0, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Font Size:", sliderBindingValue: $text.fontSize, minValue: 1, maxValue: 200, step: 1, specifier: 0, defaultValue: 16)
                        
                        CustomColorPicker(titleText: "Font Colour", pickerBindingValue: $text.fontColor)
                        
                        SliderStepper(color: .blue, title: "Tracking:", sliderBindingValue: $text.fontTracking, minValue: 0, maxValue: 50, step: 1, specifier: 0, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Frame Width:", sliderBindingValue: $text.fontFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 200)
                    }
                    
                    Group {
                        
                        SliderStepperDegrees(color: .blue, title: "Rotation:", sliderBindingValue: $text.appearance.rotation.degrees, minValue: 0, maxValue: 360, step: 1, specifier: 0, defaultValue: 0)
                            .onChange(of: text.appearance.rotation) { text.appearance.rotation = $0 }
                        
                        SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $text.appearance.skewY, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $text.appearance.skewX, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                        
                        SliderToggle(color: .blue, title: "Reflection", sliderBindingValue: $text.appearance.reflectionOffset, minValue: -50, maxValue: 50, step: 1, specifier: 0, defaultValue: 0, action: $text.appearance.showReflection)
                        
                        SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $text.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $text.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                    }
                    
                    Group {
                 
                        SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $text.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
                        
                        SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $text.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                        
                        CustomBlendModePicker(bindingValue: $text.appearance.blendMode)
                        
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
            
            
        }
        .onAppear{
            showMicroControls = true
        }
        .onDisappear{
            showMicroControls = false
        }
        .customPresentationWithPrimaryBackground(detent: .medium, detent2: .small, backgroundColorOpacity: 1.0)
        .sheet(isPresented: $showFontPickerSheet){
            
            CustomFontGridPicker(bindingValue: $text.selectedFontName, text: text)
            
        }
        
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

