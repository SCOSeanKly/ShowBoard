//
//  GlassShapeSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct GlassShapeSettings: View {
    
    @StateObject var shape = CustomShapeObject()
    
    var body: some View {
        Group {
            VStack {
                
                Spacer()
                
                ResetValues(resetValues: resetGlassShapeValues)
                
                SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $shape.shapeFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 250)
                
                SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $shape.shapeFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 250)
                
                SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $shape.shapeBlur, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 8)
                
                SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $shape.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue:  $shape.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $shape.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $shape.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                
            }
            .padding()
            .padding(.bottom)
        }
    }
    private func resetGlassShapeValues() {
        shape.shapeFrameWidth = 250
        shape.shapeFrameHeight = 250
        shape.appearance.cornerRadius = 0
        shape.appearance.shadow.radius = 0
        shape.appearance.shadow.offset.y = 0
        shape.shapeBlur = 8
        shape.appearance.shadowOpacity = 0
    }
}

