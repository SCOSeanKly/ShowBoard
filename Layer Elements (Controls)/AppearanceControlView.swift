//
//  AppearanceControlView.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.07.23.
//

import SwiftUI


struct AppearanceControlView: View {
    
    @StateObject var layer: LayerObject
    let systemImageName: String
    let titletext: String
    
    
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    @State private var doNothing: Bool = false
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            // Put base appearance controls here
            VStack {
                Group {
                    // Put text object controls here
                    if let object = layer as? TextObject {
                        
                    }
                    
                    // Put map object controls here
                    if let object = layer as? MapObject {
                        
                    }
                    
                    if let object = layer as?  CustomShapeObject {
                        
                    }
                }
                
                Group {
                    ResetValues(resetValues: {}, systemImageName: systemImageName, titleText: titletext)
                    
                    SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $layer.appearance.width, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: 1, specifier: 0, defaultValue: 200)
                    
                    SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $layer.appearance.height, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: 1, specifier: 0, defaultValue: 200)
                    
                    SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $layer.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                }
                
                Group {
                    SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Image Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                    
                    SliderStepperDegrees(color: .blue,title: "Rotation:", sliderBindingValue: $layer.appearance.rotation.degrees,minValue: 0, maxValue: 360, step: 1, specifier: 0, defaultValue: 0)
                    
                    CustomToggle(titleText: "Invert", bindingValue: $layer.appearance.invert, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                    
                    CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
                }
                
                Spacer()
                    .frame(height: 100)
                
            }
            .onChange(of: layer.appearance.rotation) {
                layer.appearance.rotation = $0}
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
    }
}

