//
//  BatteryCircleGauge.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct BatteryCircleGauge: View {
    
    @ObservedObject var batteryViewModel: BatteryViewModel
    @StateObject var bat = CircleGaugeObject()
    
    var body: some View {
        VStack {
            BatteryGuageBase(batteryViewModel: batteryViewModel, minValue: bat.minValue, maxValue: bat.maxValue, currentValueLabelFontSize: bat.currentValueLabelFontSize, minMaxValueLabelFontSize: bat.minMaxValueLabelFontSize, gaugeColor: bat.gaugeColor, opacity: bat.opacity, showCurrentValueLabel: bat.showCurrentValueLabel, showMinMaxValueLabels: bat.showMinMaxValueLabels, scaleEffect: bat.scaleEffect, currentValueLabelColor: bat.currentValueLabelColor, minMaxValueLabelColor: bat.minMaxValueLabelColor, shadowRadius: bat.shadowRadius, shadowOffset: bat.shadowOffset)
            
            /// Settings
            VStack {
                SliderStepper(title: "Min Value: ", sliderBindingValue: $bat.minValue, minValue: 0, maxValue: 100, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Max Value: ", sliderBindingValue: $bat.maxValue, minValue: 0, maxValue: 100, step: 1, specifier: 0, defaultValue: 100)
                
                SliderStepper(title: "Current FontSize: ", sliderBindingValue: $bat.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: 1, specifier: 0, defaultValue: 10)
                
                SliderStepper(title: "Min/Max FontSize: ", sliderBindingValue: $bat.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: 1, specifier: 0, defaultValue: 6)
                
                SliderStepper(title: "Opacity: ", sliderBindingValue: $bat.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                
                CustomToggle(titleText: "Show Current Label: ", bindingValue: $bat.showCurrentValueLabel)
                
                CustomToggle(titleText: "Show Min/Max Label: ", bindingValue: $bat.showMinMaxValueLabels)
                
                ColorPicker("Gauge Color", selection: $bat.gaugeColor)
                
                ColorPicker("Current Colour", selection: $bat.currentValueLabelColor)
                
                ColorPicker("Min/Max Colour: ", selection: $bat.minMaxValueLabelColor)
                
                SliderStepper(title: "Shadow Radius: ", sliderBindingValue: $bat.shadowRadius, minValue: 0, maxValue: 10, step: 0.1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Shadow Offset: ", sliderBindingValue: $bat.shadowOffset, minValue: 0, maxValue: 10, step: 0.1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Scale Effect: : ", sliderBindingValue: $bat.scaleEffect, minValue: 0, maxValue: 3, step: 0.1, specifier: 1, defaultValue: 1)
            }
            .scaleEffect(0.8)
            
            
            
          
            
            
            
            
        }
        .padding()
        
        
    }
}

struct BatteryCircleGauge_Previews: PreviewProvider {
    static var previews: some View {
        BatteryCircleGauge(batteryViewModel: BatteryViewModel())
    }
}


