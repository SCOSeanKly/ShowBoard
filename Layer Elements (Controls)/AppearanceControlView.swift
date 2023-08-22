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
    @Binding var showMicroControls: Bool
    
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            
            
            if showMicroControls {
                MicroControlsView(showMicroControls: $showMicroControls, layer: layer)
            }
            
            ResetValues(resetValues: {}, showMicroControls: $showMicroControls, systemImageName: systemImageName, titleText: titletext)
            
            Group {
                
                if let _ = layer as? WavyDockObject {
                    SliderStepper(color: .blue, title: "xAngle", sliderBindingValue: $layer.appearance.xAngle, minValue: 0, maxValue: 360, step: 0.1, specifier: 1, defaultValue: 360)
                    
                    SliderStepper(color: .blue, title: "Amplitude", sliderBindingValue: $layer.appearance.amplitude, minValue: -0.5, maxValue: 0.5, step: 0.1, specifier: 1, defaultValue: 0.15)
                }
                
                if layer is WavyDockObject || layer is SquareShapeObject || layer is CustomShapeObject || layer is CircleGaugeObject || layer is LinearGaugeObject || layer is ConditionAssetObject {
                    
                    CustomColorPicker(titleText: "Fill Colour(s)", pickerBindingValue:  $layer.appearance.fillColor2, pickerBindingValue2: $layer.appearance.fillColor)
                }
            }
            
            
            Group {
                
                if let _ = layer as? CalendarViewModel {
                    SliderStepper(color: .blue, title: "Days Text Size", sliderBindingValue: $layer.appearance.daysTextSize, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 15)
                    CustomColorPicker(titleText: "Days Colour", pickerBindingValue:  $layer.appearance.daysColor, pickerBindingValue2: nil)
                    
                    SliderStepper(color: .blue, title: "Date Text Size", sliderBindingValue: $layer.appearance.dateTextSize, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 15)
                    CustomColorPicker(titleText: "Date Text Colour", pickerBindingValue:  $layer.appearance.dateTextColor, pickerBindingValue2: nil)
                    CustomColorPicker(titleText: "Date BG Colour", pickerBindingValue:  $layer.appearance.dateBackgroundColor, pickerBindingValue2: nil)
                    SliderStepper(color: .blue, title: "Date BG Corner Radius", sliderBindingValue: $layer.appearance.dateBackgroundCornerRadius, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 10)
                    
                    CustomColorPicker(titleText: "Background Colour", pickerBindingValue:  $layer.appearance.calendarBackgroundColor, pickerBindingValue2: nil)
                    SliderStepper(color: .blue, title: "Background Corner Radius", sliderBindingValue: $layer.appearance.calendarBackgroundCornerRadius, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 10)
                    
                    
                    CustomColorPicker(titleText: "Today Indicator Colour", pickerBindingValue:  $layer.appearance.todayIndicator, pickerBindingValue2: nil)
                }
            }
            
            
            Group {
                if let _ = layer as? CustomShapeObject {
                    
                    SliderStepper(color: .blue, title: "Count:", sliderBindingValue: $layer.appearance.shapePointCount, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 5)
                    
                    SliderStepper(color: .blue, title: "Inner Ratio:", sliderBindingValue: $layer.appearance.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: 2, defaultValue: 1)
                }
                
                if layer is WeatherIconLayerObject || layer is CircleGaugeObject || layer is CalendarViewModel || layer is HiLoGaugeObject || layer is ConditionAssetObject {
                    SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.scales.x, minValue: 0, maxValue: 4, step: 0.1, specifier: 1, defaultValue: 1)
                }
                
                if !(layer is CircleGaugeObject) && !(layer is WeatherIconLayerObject) && !(layer is CalendarViewModel) && !(layer is HiLoGaugeObject) && !(layer is ConditionAssetObject) {
                    
                    SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $layer.appearance.width, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: 1, specifier: 0, defaultValue: 200)
                    
                    SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $layer.appearance.height, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: 1, specifier: 0, defaultValue: 200)
                }
            }
            
            Group {
                if layer is LinearGaugeObject || layer is CircleGaugeObject  || layer is HiLoGaugeObject {
                    
                    SliderStepper(color: .blue, title: "Current FontSize:", sliderBindingValue: $layer.appearance.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: 1, specifier: 0, defaultValue: 10)
                    
                    SliderStepper(color: .blue, title: "Min/Max FontSize:", sliderBindingValue: $layer.appearance.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: 1, specifier: 0, defaultValue: 6)
                    
                    CustomToggle(showTitleText: true, titleText: "Show Current Label:", bindingValue: $layer.appearance.showCurrentValueLabel, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                    
                    CustomToggle(showTitleText: true, titleText: "Show Min/Max Label:", bindingValue: $layer.appearance.showMinMaxValueLabels, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                    
                    CustomColorPicker(titleText: "Current Label Colour", pickerBindingValue:  $layer.appearance.currentValueLabelColor, pickerBindingValue2: nil)
                    
                    CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $layer.appearance.minMaxValueLabelColor, pickerBindingValue2: nil)
                    
                }
            }
            
           CommonControls(layer: layer)
            
            Group {
               
                
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
        .onAppear{
            showMicroControls = true
        }
        .onDisappear{
            showMicroControls = false
        }
        .customPresentationWithPrimaryBackground(detent: .medium, detent2: .small, backgroundColorOpacity: 1.0)
    }
}


