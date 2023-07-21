//
//  CustomShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//


import SwiftUI

public struct CustomShapeView: View {

    @StateObject var shape = CustomShapeObject()
    
    @State private var isSliderMode = true

    public init() {}

    public var body: some View {
       
     VStack {
               
                Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio)
                    .fill(shape.shapeColor)
                    .blendMode(shape.appearance.blendMode)
                    .background(.ultraThinMaterial.opacity(shape.appearance.opacity))
                    .clipShape(Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio))
                    .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
                    .scaleEffect(
                        x: shape.appearance.scales.x,
                        y: shape.appearance.scales.y
                    )
                    .rotationEffect(shape.appearance.rotation)
                    .shadow(
                        radius: shape.appearance.shadow.radius,
                        x: shape.appearance.shadow.offset.x,
                        y: shape.appearance.shadow.offset.y
                    )
                    .blur(radius: shape.appearance.blur)
                    .opacity(shape.appearance.opacity)
                    .rotation3DEffect(.degrees(shape.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(shape.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .animation(.spring())
                   
                // MARK: Settings
     
                  
         ScrollView{
             Group {
                 ResetValues(resetValues: resetCustomShapeValues)
                 
                 SliderStepper(color: .blue, title: "Count:", sliderBindingValue: $shape.shapePointCount, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 5)
                 
                 SliderStepper(color: .blue, title: "Inner Ratio:", sliderBindingValue: $shape.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: 2, defaultValue: 1)
                 
                 SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $shape.shapeFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 250)
                 
                 SliderStepper(color: .blue, title: "Height:", sliderBindingValue: $shape.shapeFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 250)
                 
                 // TODO: resetting only resets X and not Y
                 SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $shape.appearance.scales.x, minValue: 0, maxValue: 5, step: 0.1, specifier: 1, defaultValue: 1)
                     .onChange(of: shape.appearance.scales) { _ in
                         shape.appearance.scales.y =
                         shape.appearance.scales.x
                     }
             }
             
             Group {
                 SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $shape.appearance.skewY, minValue: 0, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                 
                 SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $shape.appearance.skewX, minValue: 0, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                 
                 SliderStepperDegrees(color: .blue, title: "Rotation", sliderBindingValue: $shape.appearance.rotation.degrees, minValue: 0, maxValue: 360, step: 1, specifier: 1, defaultValue: 0)
                 
                 SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $shape.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1.0, specifier: 1, defaultValue: 0)
                 
                 SliderStepper(color: .blue, title: "Shadow Offet:", sliderBindingValue: $shape.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1.0, specifier: 1, defaultValue: 0)
                 
                 SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $shape.appearance.blur, minValue: 0, maxValue: 50, step: 1.0, specifier: 0, defaultValue: 0)
                 
                 CustomColorPicker(titleText: "Set the background color", pickerBindingValue:  $shape.shapeColor)
                  
                 
                 HStack {
                     Text("Blend Mode:")
                         .titleFont()
                     Spacer()
                     Picker("Blend Mode", selection: $shape.appearance.blendMode) {
                         ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                             Text(LayerObjectAppearance.labelForBlendMode(mode))
                                 .tag(mode)
                         }
                     }
                     .pickerStyle(.menu)
                     .scaleEffect(0.8)
                     .offset(x: 20)
                 }
                 .frame(height: 20)
            
                 
                 SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $shape.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
             }
         }
            }
            .padding()
           
            .ignoresSafeArea()
        
    }
    
    private func resetCustomShapeValues() {
        /*
        width = 300
        height = 150
        cornerRadius = 0
        shadowRadius = 0
        shadowOffset = 0
        blendMode = .normal
        colorOverlay = .clear
         */
    }
}



struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeView()
    }
}



