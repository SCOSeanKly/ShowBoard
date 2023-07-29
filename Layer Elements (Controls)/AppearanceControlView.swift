//
//  AppearanceControlView.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.07.23.
//

import SwiftUI


struct AppearanceControlView: View {
    
    @StateObject var layer: LayerObject
    var systemImage: String = "questionmark.circle"
    var systemImage2: String = ""
    
    
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    @State private var doNothing: Bool = false
    
    var body: some View {
        
        ScrollView (showsIndicators: false){
            
            // Put base appearance controls here
            VStack {
                LayerBackButton(selfViewToClose: $doNothing, viewToOpen: $doNothing, showLayerElementView: $doNothing, headerText: "Appearance", systemImage: "questionmark.circle", systemImage2: "")
                
                Group {
                    ResetValues(resetValues: {})
                    
                    
                    SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                }
                
                Group {
                    SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                    
                    SliderStepperDegrees(
                        color: .blue,
                        title: "Rotation:",
                        sliderBindingValue: $layer.appearance.rotation.degrees,
                        minValue: 0,
                        maxValue: 360,
                        step: 1,
                        specifier: 0,
                        defaultValue: 0
                    )
                    .onChange(of: layer.appearance.rotation) {
                        layer.appearance.rotation = $0
                    }
                    
                    CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
                    Spacer()
                        .frame(height: 100)
                }
            }
            
            
            // Put text object controls here
            if let object = layer as? TextObject {
                
            }
            
            // Put map object controls here
            if let object = layer as? MapObject {
                
            }
            
            // Here you do the same for the rest...
        }
        .customPresentationWithBlur(detent: .medium, blurRadius: 9, backgroundColorOpacity: 0.01)
        
    }
}

#Preview {
    AppearanceControlView(layer: TextObject())
}
