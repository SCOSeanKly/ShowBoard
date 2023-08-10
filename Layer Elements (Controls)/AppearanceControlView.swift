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
        
        ScrollView (showsIndicators: false) {
            
          
            Group {
                ResetValues(resetValues: {}, systemImageName: systemImageName, titleText: titletext)
                
                if let _ = layer as? CustomShapeObject {
                    
                    SliderStepper(color: .blue, title: "Count:", sliderBindingValue: $layer.appearance.shapePointCount, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 5)
                    
                    SliderStepper(color: .blue, title: "Inner Ratio:", sliderBindingValue: $layer.appearance.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: 2, defaultValue: 1)
                    
                    CustomColorPicker(titleText: "Shape Color", pickerBindingValue:  $layer.appearance.fillColor)
                }
                
                if let _ = layer as? WeatherIconLayerObject {
                    SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.scales.x, minValue: 0, maxValue: 2, step: 0.1, specifier: 1, defaultValue: 1)
                }
                
                if !(layer is CircleGaugeObject) && !(layer is WeatherIconLayerObject) {
               
                    SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $layer.appearance.width, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: 1, specifier: 0, defaultValue: 200)
                    
                    SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $layer.appearance.height, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: 1, specifier: 0, defaultValue: 200)
                }
            }
            
            Group {
                if let _ = layer as? CircleGaugeObject {
                    
                    SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.gaugeScale, minValue: 0, maxValue: 3, step: 0.1, specifier: 1, defaultValue: 1)
                    
                    SliderStepper(color: .blue, title: "Current FontSize:", sliderBindingValue: $layer.appearance.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: 1, specifier: 0, defaultValue: 10)
                    
                    SliderStepper(color: .blue, title: "Min/Max FontSize:", sliderBindingValue: $layer.appearance.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: 1, specifier: 0, defaultValue: 6)
                    
                    CustomToggle(showTitleText: true, titleText: "Show Current Label:", bindingValue: $layer.appearance.showCurrentValueLabel, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                    
                    CustomToggle(showTitleText: true, titleText: "Show Min/Max Label:", bindingValue: $layer.appearance.showMinMaxValueLabels, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                    
                    CustomColorPicker(titleText: "Gauge Colour", pickerBindingValue:  $layer.appearance.gaugeColor)
                    
                    CustomColorPicker(titleText: "Current Label Colour", pickerBindingValue:  $layer.appearance.currentValueLabelColor)
                    
                    CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $layer.appearance.minMaxValueLabelColor)
                    
                }
            }
            
            Group {
                if let _ = layer as? GlassObject {
                    SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $layer.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                }
                
                SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $layer.appearance.skewY, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $layer.appearance.skewX, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                
                if let _ = layer as? MapObject {
                    SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $layer.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
                }
            }
            
            Group {
                SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $layer.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
                
                SliderStepper(color: .blue, title: "Object Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
                
                SliderStepper(color: .blue, title: "Image Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                
                SliderStepperDegrees(color: .blue,title: "Rotation:", sliderBindingValue: $layer.appearance.rotation.degrees,minValue: 0, maxValue: 360, step: 1, specifier: 0, defaultValue: 0)
            }
            
            Group {
                CustomToggle(showTitleText: true, titleText: "Invert", bindingValue: $layer.appearance.invert, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                
                CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
                
                if let _ = layer as? GlassObject {
                    
                    SliderStepper(color: .blue, title: "Glass Blur Radius:", sliderBindingValue: $layer.appearance.glassBlur, minValue: 0, maxValue: 20, step: 1.0, specifier: 1, defaultValue: 5)
                    
                    CustomToggle(showTitleText: true, titleText: "Add Frosted Effect:", bindingValue: $layer.appearance.shapeGrain, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                    
                    CustomToggle(showTitleText: true, titleText: "Show Glass Border:", bindingValue: $layer.appearance.showBorder, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                    
                    SliderStepper(color: .blue, title: "Glass Border Width:", sliderBindingValue:  $layer.appearance.borderWidth, minValue: 0.2, maxValue: 2.5, step: 0.1, specifier: 1, defaultValue: 0.5)
                }
            }
            
            Spacer()
                .frame(height: 100)
                .onChange(of: layer.appearance.rotation) {
                    layer.appearance.rotation = $0}
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
    }
}

