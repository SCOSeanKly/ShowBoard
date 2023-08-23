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
        
        if layer is WavyDockObject || layer is SquareShapeObject || layer is CustomShapeObject || layer is CircleGaugeObject || layer is LinearGaugeObject || layer is ConditionAssetObject {
            
            CustomColorPicker(titleText: "Fill Colour", pickerBindingValue:  $layer.appearance.fillColor2, pickerBindingValue2: $layer.appearance.fillColor)
        }
        
        SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 0.1, specifier: 1, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 0.1, specifier: 1, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $layer.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 0.0)
        
        SliderStepper(color: .blue, title: "Object Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: 0.1, specifier: 1, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Image Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
        
        SliderStepperDegrees(color: .blue,title: "Rotation:", sliderBindingValue: $layer.appearance.rotation.degrees,minValue: -180, maxValue: 180, step: 1, specifier: 0, defaultValue: 0)
        
        CustomToggle(showTitleText: true, titleText: "Invert", bindingValue: $layer.appearance.invert, onSymbol: "circle", offSymbol: "xmark", rotate: true)
        
        CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
    }
}


struct CornerRadiusSkewControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        
        if layer is GlassObject || layer is SquareShapeObject || layer is MapObject {
            SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $layer.appearance.cornerRadius, minValue: 0, maxValue: 200, step: 1, specifier: 0, defaultValue: 0)
        }
        
        if !(layer is GlassObject || layer is CustomShapeObject) {
            SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $layer.appearance.skewY, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $layer.appearance.skewX, minValue: -180, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
        }
        
    }
}

struct GlassControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        if let _ = layer as? GlassObject {
            
            SliderStepper(color: .blue, title: "Glass Blur Radius:", sliderBindingValue: $layer.appearance.glassBlur, minValue: 0, maxValue: 20, step: 1.0, specifier: 1, defaultValue: 5)
            
            CustomToggle(showTitleText: true, titleText: "Add Frosted Effect:", bindingValue: $layer.appearance.shapeGrain, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            
            CustomToggle(showTitleText: true, titleText: "Show Glass Border:", bindingValue: $layer.appearance.showBorder, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            
            SliderStepper(color: .blue, title: "Glass Border Width:", sliderBindingValue:  $layer.appearance.borderWidth, minValue: 0.2, maxValue: 2.5, step: 0.1, specifier: 1, defaultValue: 0.5)
        }
    }
}


struct Font_GaugeLabelControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        
        if layer is LinearGaugeObject || layer is CircleGaugeObject  || layer is HiLoGaugeObject {
            
            SliderStepper(color: .blue, title: "Current FontSize:", sliderBindingValue: $layer.appearance.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: 1, specifier: 0, defaultValue: 10)
            
            SliderStepper(color: .blue, title: "Min/Max FontSize:", sliderBindingValue: $layer.appearance.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: 1, specifier: 0, defaultValue: 6)
            
            CustomToggle(showTitleText: true, titleText: "Show Current Label:", bindingValue: $layer.appearance.showCurrentValueLabel, onSymbol: "circle", offSymbol: "xmark", rotate: false)
            
            CustomToggle(showTitleText: true, titleText: "Show Min/Max Label:", bindingValue: $layer.appearance.showMinMaxValueLabels, onSymbol: "circle", offSymbol: "xmark", rotate: false)
            
            CustomColorPicker(titleText: "Current Label Colour", pickerBindingValue:  $layer.appearance.currentValueLabelColor, pickerBindingValue2: nil)
            
            CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $layer.appearance.minMaxValueLabelColor, pickerBindingValue2: nil)
            
        }
    }
}


struct ScaleWidthHeightControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        if layer is WeatherIconLayerObject || layer is CircleGaugeObject || layer is CalendarViewModel || layer is HiLoGaugeObject || layer is ConditionAssetObject {
            SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.scales.x, minValue: 0, maxValue: 4, step: 0.1, specifier: 1, defaultValue: 1)
        }
        
        if !(layer is CircleGaugeObject) && !(layer is WeatherIconLayerObject) && !(layer is CalendarViewModel) && !(layer is HiLoGaugeObject) && !(layer is ConditionAssetObject) {
            
            SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $layer.appearance.width, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: 1, specifier: 0, defaultValue: 200)
            
            SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $layer.appearance.height, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: 1, specifier: 0, defaultValue: 200)
        }
    }
}


struct CustomShapeControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        if let _ = layer as? CustomShapeObject {
            
            SliderStepper(color: .blue, title: "Count:", sliderBindingValue: $layer.appearance.shapePointCount, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 5)
            
            SliderStepper(color: .blue, title: "Inner Ratio:", sliderBindingValue: $layer.appearance.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: 2, defaultValue: 1)
        }
    }
}

struct CalendarControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
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
}

struct WavyDockControls: View {
    
    @StateObject var layer: LayerObject
    
    var body: some View {
        
        if let _ = layer as? WavyDockObject {
            SliderStepper(color: .blue, title: "xAngle", sliderBindingValue: $layer.appearance.xAngle, minValue: 0, maxValue: 360, step: 0.1, specifier: 1, defaultValue: 360)
            
            SliderStepper(color: .blue, title: "Amplitude", sliderBindingValue: $layer.appearance.amplitude, minValue: -0.5, maxValue: 0.5, step: 0.1, specifier: 1, defaultValue: 0.15)
        }
    }
}
