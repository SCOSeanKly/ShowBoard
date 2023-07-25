//
//  DynamicTextEditViewSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct DynamicTextEditViewSettings: View {
    
    @StateObject var text: TextObject
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    @State private var doNothing: Bool = false
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            LayerBackButton(selfViewToClose: $doNothing, viewToOpen: $doNothing, showLayerElementView: $doNothing, headerText: "Glass Shape", systemImage: "questionmark.circle", systemImage2: "")
            
            Group {
                ResetValues(resetValues: resetDynamicTextValues)
                
                CustomFontPicker(bindingValue: $text.selectedFontName)
                
                SliderStepper(color: .blue, title: "Font Size:", sliderBindingValue: $text.fontSize, minValue: 1, maxValue: 200, step: 1, specifier: 0, defaultValue: 16)
                
                SliderStepper(color: .blue, title: "Tracking:", sliderBindingValue: $text.fontTracking, minValue: 0, maxValue: 20, step: 1, specifier: 0, defaultValue: 0)
                
                //MARK: Still to do
                HStack {
                    Text("Font Alignment:")
                        .titleFont()
                    Spacer()
                    Picker("Font Alignment", selection: $text.textAlignment) {
                        ForEach(alignmentOptions, id: \.self) { style in
                            //  Text(alignmentOptions)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } //Font alignment: leading, center, trailing
                
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
                
                Spacer()
                    .frame(height: 100)
            }
            
        }
        .customPresentation(detent: .medium, blurRadius: 9, backgroundColorOpacity: 0.01)
        
    }
    
    private func resetDynamicTextValues() {
        /*fontName = "Autone"
         fontSize = 26
         fontWeight = .regular
         fontColor = .black
         text.appearance.rotation = .zero*/
    }
    
}

