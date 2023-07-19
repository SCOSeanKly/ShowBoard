//
//  GlassShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

struct GlassShapeView: View {
    
    @StateObject var shape = CustomShapeObject()
    
    var body: some View {
        
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: shape.appearance.cornerRadius))
                
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                
            }
            .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
            .shadow(
                radius: shape.appearance.shadow.radius,
                x: shape.appearance.shadow.offset.x,
                y: shape.appearance.shadow.offset.y
            )
            .animation(.spring())
            
            // MARK: Settings for Glass
            VStack {
                
                ResetValues(resetValues: resetGlassShapeValues)
                
                SliderStepper(title: "Width:", sliderBindingValue: $shape.shapeFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 250)
                
                SliderStepper(title: "Height:", sliderBindingValue:  $shape.shapeFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 250)
                
                SliderStepper(title: "Corner Radius:", sliderBindingValue: $shape.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                
                SliderStepper(title: "Shadow Radius:", sliderBindingValue:  $shape.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(title: "Shadow Offset:", sliderBindingValue: $shape.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1, specifier: 1, defaultValue: 0)
                
            }
            .padding()
            .offset(y: 250)
        }
        
    }
    
    private func resetGlassShapeValues() {
        shape.shapeFrameWidth = 250
        shape.shapeFrameHeight = 250
        shape.appearance.cornerRadius = 0
        shape.appearance.shadow.radius = 0
        shape.appearance.shadow.offset.y = 0
    }
    
}

struct GlassShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GlassShapeView()
    }
}
