//
//  GlassShapeSettings.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct GlassShapeSettings: View {
    
    @StateObject var shape = CustomShapeObject()
    @State private var doNothing: Bool = false
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            Group {
                
                ResetValues(resetValues: resetGlassShapeValues, systemImageName: "square", titleText: "Glass Object")
                
                SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $shape.shapeFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: 1, specifier: 0, defaultValue: 300)
                
                SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $shape.shapeFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: 1, specifier: 0, defaultValue: 150)
                
                SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $shape.shapeBlur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 8)
                
                SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $shape.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
            }
            Group {
                SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue:  $shape.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $shape.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $shape.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                
                CustomToggle(titleText: "Add Frosted Effect:", bindingValue: $shape.shapeGrain, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                
                CustomToggle(titleText: "Show Glass Border:", bindingValue: $shape.showBorder, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                
                SliderStepper(color: .blue, title: "Glass Border Width:", sliderBindingValue:  $shape.borderWidth, minValue: 0.2, maxValue: 2.5, step: 0.1, specifier: 1, defaultValue: 0.5)
            }
            
            Spacer()
                .frame(height: 100)
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
    }
    
    private func resetGlassShapeValues() {
        shape.shapeFrameWidth = 300
        shape.shapeFrameHeight = 150
        shape.appearance.cornerRadius = 0
        shape.appearance.shadow.radius = 0
        shape.appearance.shadow.offset.y = 0
        shape.shapeBlur = 8
        shape.appearance.shadowOpacity = 0
        shape.shapeGrain = false
        shape.showBorder = true
        shape.borderWidth = 0.5
    }
    
}




