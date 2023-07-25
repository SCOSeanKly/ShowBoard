//
//  BatteryCircleGaugeSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct BatteryCircleGaugeSettings: View {
    
    @StateObject var bat: CircleGaugeObject
    @State private var doNothing: Bool = false
    
    var body: some View {
        // MARK: Settings

            ScrollView (showsIndicators: false){
                
                LayerBackButton(selfViewToClose: $doNothing, viewToOpen: $doNothing, showLayerElementView: $doNothing, headerText: "Glass Shape", systemImage: "questionmark.circle", systemImage2: "")
                
                Group {
                    
                    ResetValues(resetValues: resetBatteryCircleGaugeValues)
                    
                    //MARK: Min and Max values not used for Battery Gauge as values will always be 0 and 100
                    /*
                    SliderStepper(color: .blue, title: "Min Value:", sliderBindingValue: $bat.minValue, minValue: 0, maxValue: 100, step: 1, specifier: 0, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Max Value:", sliderBindingValue: $bat.maxValue, minValue: 0, maxValue: 100, step: 1, specifier: 0, defaultValue: 100)
                     */
                    
                    SliderStepper(color: .blue, title: "Current FontSize:", sliderBindingValue: $bat.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: 1, specifier: 0, defaultValue: 10)
                    
                    SliderStepper(color: .blue, title: "Min/Max FontSize:", sliderBindingValue: $bat.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: 1, specifier: 0, defaultValue: 6)
                    
                    SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $bat.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                    
                    CustomToggle(titleText: "Show Current Label:", bindingValue: $bat.showCurrentValueLabel, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                }
                
                Group {
                    
                    CustomToggle(titleText: "Show Min/Max Label:", bindingValue: $bat.showMinMaxValueLabels, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                    
                    CustomColorPicker(titleText: "Gauge Colour", pickerBindingValue:  $bat.gaugeColor)
                    
                    CustomColorPicker(titleText: "Current Label Colour", pickerBindingValue:  $bat.currentValueLabelColor)
                    
                    CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $bat.minMaxValueLabelColor)
                    
                    SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $bat.appearance.shadow.radius, minValue: 0, maxValue: 10, step: 1, specifier: 0, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $bat.appearance.shadow.offset.y, minValue: 0, maxValue: 10, step: 1, specifier: 0, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $bat.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Scale Effect:", sliderBindingValue: $bat.appearance.scales.x, minValue: 0, maxValue: 5, step: 0.1, specifier: 1, defaultValue: 1)
                        .onChange(of: bat.appearance.scales) { _ in
                            bat.appearance.scales.y =
                            bat.appearance.scales.x
                        }
                        .padding(.bottom, 100)
                }
            }
            .customPresentationWithBlur(detent: .medium, blurRadius: 9, backgroundColorOpacity: 0.01)
        
    }
    
    private func resetBatteryCircleGaugeValues() {
        
        bat.minValue = 0
        bat.maxValue = 100
        bat.currentValueLabelFontSize = 10
        bat.minMaxValueLabelFontSize = 6
        bat.appearance.opacity = 1
        bat.showCurrentValueLabel = true
        bat.showMinMaxValueLabels = true
        bat.gaugeColor = .blue
        bat.currentValueLabelColor = .blue
        bat.minMaxValueLabelColor = .blue
        bat.appearance.shadow.radius = 0
        bat.appearance.shadow.offset.y = 0
        bat.appearance.shadowOpacity = 0
    }
}


 
 
