//
//  CommonControls.swift
//  ShowBoard
//
//  Created by Sean Kelly on 22/08/2023.
//

import SwiftUI

struct CommonControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
      
        Group {
            if layer is GlassObject || layer is SquareShapeObject || layer is MapObject {
                SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $layer.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
            }
            
            if !(layer is GlassObject || layer is CustomShapeObject) {
                SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $layer.appearance.skewY, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $layer.appearance.skewX, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
            }
        }
        
        Group {
            SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $layer.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
            
            SliderStepper(color: .blue, title: "Object Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
        }
        
        Group {
            SliderStepper(color: .blue, title: "Image Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
            
            SliderStepperDegrees(color: .blue,title: "Rotation:", sliderBindingValue: $layer.appearance.rotation.degrees,minValue: -180, maxValue: 180, step: 1, specifier: 0, defaultValue: 0)
            
            CustomToggle(showTitleText: true, titleText: "Invert", bindingValue: $layer.appearance.invert, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            
            CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
        }
        
        
        
    }
}

