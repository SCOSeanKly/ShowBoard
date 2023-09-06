//
//  CommonControls.swift
//  ShowBoard
//
//  Created by Sean Kelly on 22/08/2023.
//

import SwiftUI

struct WeatherIconPLus7Controls: View {
    
    @StateObject var layer: LayerObject
  
    
    
    var body: some View {
        
        if layer is weatherIconForecast {
            HStack {
                Text("Weather Icon Style")
                    .titleFont()
                
                Spacer()
                
                Button(action: {
                    // Increment the selected style value
                    layer.appearance.weatherIconAssetStyle = (layer.appearance.weatherIconAssetStyle % 11) + 1
                }) {
                    Image("set\(layer.appearance.weatherIconAssetStyle)_1d") // Display the current style's image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 45, height: 45) // Adjust the size of the button as needed
            }
            .padding(.horizontal)


            
            CustomToggle(showTitleText: true, titleText: "Layout (Horizontal / Vertical)", bindingValue: $layer.appearance.showHorizontal, onSymbol: "h.circle", offSymbol: "v.circle", rotate: false)
                .padding(.trailing, 5)
            
            SliderStepper(color: .blue, title: "Spacing", sliderBindingValue: $layer.appearance.spacing, minValue: -150, maxValue: 150, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: -10)
            
            SliderStepper(color: .blue, title: "Forecast Days", sliderBindingValue: $layer.appearance.daysToShow, minValue: 3, maxValue: 7, step: 1, specifier: 0, defaultValue: 5)
            
            CustomToggle(showTitleText: true, titleText: "Show Min/Max Labels", bindingValue: $layer.appearance.showForecastTempString, onSymbol: "circle", offSymbol: "xmark", rotate: false)
                .padding(.trailing, 5)
            
            SliderStepper(color: .blue, title: "Labels Offset", sliderBindingValue: $layer.appearance.labelsOffset, minValue: -30, maxValue: 100, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 10)
            
            CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $layer.appearance.minMaxValueLabelColor, pickerBindingValue2: nil, showGradientToggle: false)
            
        }
    }
}






struct CommonControls: View {
    
    @StateObject var layer: LayerObject
 
    
    var body: some View {
        
        if layer is WavyDockObject || layer is SquareShapeObject || layer is CustomShapeObject  || layer is ConditionAssetObject || layer is StrokeShapeObject {
            
            CustomColorPicker(titleText: "Fill Colour", pickerBindingValue:  $layer.appearance.fillColor2, pickerBindingValue2: $layer.appearance.fillColor, showGradientToggle: true)
        }
        
        if  layer is CircleGaugeObject || layer is LinearGaugeObject || layer is HiLoGaugeObject || layer is LinearHiLoObject {
            
            CustomColorPicker(titleText: "Fill Colour", pickerBindingValue:  $layer.appearance.fillColor2, pickerBindingValue2: $layer.appearance.fillColor, showGradientToggle: false)
        }
        
        if layer is StrokeShapeObject {
            SliderStepper(color: .blue, title: "Stroke Height:", sliderBindingValue: $layer.appearance.strokeWidth, minValue: 0, maxValue: 35, step: layer.appearance.strokeWidth, specifier: layer.appearance.sliderSpecifier, defaultValue: 5)
            SliderStepper(color: .blue, title: "Stroke Dash:", sliderBindingValue: $layer.appearance.strokeDash, minValue: 0, maxValue: 35, step: layer.appearance.strokeWidth, specifier: layer.appearance.sliderSpecifier, defaultValue: 5)
        }
        
        
        SliderStepper(color: .blue, title: "Shadow Radius:", sliderBindingValue: $layer.appearance.shadow.radius, minValue: 0, maxValue: 20, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Shadow Offset:", sliderBindingValue: $layer.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Shadow Opacity:", sliderBindingValue: $layer.appearance.shadowOpacity, minValue: 0, maxValue: 1, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0.0)
        
        SliderStepper(color: .blue, title: "Object Blur Radius:", sliderBindingValue: $layer.appearance.blur, minValue: 0, maxValue: 50, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        
        SliderStepper(color: .blue, title: "Image Opacity:", sliderBindingValue: $layer.appearance.opacity, minValue: 0, maxValue: 1, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 1)
        
        SliderStepperDegrees(color: .blue,title: "Rotation:", sliderBindingValue: $layer.appearance.rotation.degrees,minValue: -180, maxValue: 180, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        
        CustomToggle(showTitleText: true, titleText: "Invert", bindingValue: $layer.appearance.invert, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            .padding(.trailing, 5)
        
        CustomBlendModePicker(bindingValue: $layer.appearance.blendMode)
    }
}



struct WeatherIconControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        SliderToggle(color: .blue, title: "Reflection", sliderBindingValue: $layer.appearance.reflectionOffset, minValue: -250, maxValue: 250, step: 1, specifier: 0, defaultValue: 0, action: $layer.appearance.showReflection)
        
    }
}



struct rainControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        
        
        if layer is RainObject {
          
            CustomToggle(showTitleText: true, titleText: "Show Rain Bounce", bindingValue: $layer.appearance.showRainBounce, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                .padding(.trailing, 5)
            
            CustomToggle(showTitleText: true, titleText: "Add Gradient Mask", bindingValue: $layer.appearance.addGaradientMask, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                .padding(.trailing, 5) 
        }
    
    }
}


struct CornerRadiusSkewControls: View {
    
    @StateObject var layer: LayerObject
 
    
    var body: some View {
        
        
        if layer is GlassObject || layer is SquareShapeObject || layer is MapObject || layer is StrokeShapeObject {
            SliderStepper(color: .blue, title: "Corner Radius:", sliderBindingValue: $layer.appearance.cornerRadius, minValue: 0, maxValue: 200, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        }
        
        if !(layer is GlassObject || layer is CustomShapeObject || layer is RainObject) {
            SliderStepper(color: .blue, title: "Skew X", sliderBindingValue: $layer.appearance.skewY, minValue: -180, maxValue: 180, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
            
            SliderStepper(color: .blue, title: "Skew Y", sliderBindingValue: $layer.appearance.skewX, minValue: -180, maxValue: 180, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0)
        }
        
    }
}

struct GlassControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        
        if let _ = layer as? GlassObject {
            
            SliderStepper(color: .blue, title: "Glass Blur Radius:", sliderBindingValue: $layer.appearance.glassBlur, minValue: 0, maxValue: 20, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 5)
            
            CustomToggle(showTitleText: true, titleText: "Add Frosted Effect:", bindingValue: $layer.appearance.shapeGrain, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            
            CustomToggle(showTitleText: true, titleText: "Show Glass Border:", bindingValue: $layer.appearance.showBorder, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            
            SliderStepper(color: .blue, title: "Glass Border Width:", sliderBindingValue:  $layer.appearance.borderWidth, minValue: 0.2, maxValue: 2.5, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0.5)
        }
    }
}


struct Font_GaugeLabelControls: View {
    
    @StateObject var layer: LayerObject
 
    
    var body: some View {
        
        
        if layer is LinearGaugeObject || layer is CircleGaugeObject  || layer is HiLoGaugeObject {
            
            SliderStepper(color: .blue, title: "Current FontSize:", sliderBindingValue: $layer.appearance.currentValueLabelFontSize, minValue: 0, maxValue: 15, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 10)
            
            SliderStepper(color: .blue, title: "Min/Max FontSize:", sliderBindingValue: $layer.appearance.minMaxValueLabelFontSize, minValue: 4, maxValue: 15, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 6)
            
            CustomToggle(showTitleText: true, titleText: "Show Current Label:", bindingValue: $layer.appearance.showCurrentValueLabel, onSymbol: "circle", offSymbol: "xmark", rotate: false)
            
            CustomToggle(showTitleText: true, titleText: "Show Min/Max Label:", bindingValue: $layer.appearance.showMinMaxValueLabels, onSymbol: "circle", offSymbol: "xmark", rotate: false)
            
            CustomColorPicker(titleText: "Current Label Colour", pickerBindingValue:  $layer.appearance.currentValueLabelColor, pickerBindingValue2: nil, showGradientToggle: false)
            
            CustomColorPicker(titleText: "Min/Max Label Colour:", pickerBindingValue: $layer.appearance.minMaxValueLabelColor, pickerBindingValue2: nil, showGradientToggle: false)
            
        }
    }
}


struct ScaleWidthHeightControls: View {
    
    @StateObject var layer: LayerObject
   
    
    var body: some View {
        
        if layer is CircleGaugeObject || layer is CalendarViewModel || layer is HiLoGaugeObject || layer is ConditionAssetObject || layer is weatherIconForecast {
            SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.scales.x, minValue: 0, maxValue: 4, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 1)
        }
        
        if layer is WeatherIconLayerObject ||  layer is WeatherIconLayerObject2 || layer is WeatherIconLayerObject3 || layer is WeatherIconLayerObject4 || layer is WeatherIconLayerObject5 || layer is WeatherIconLayerObject6 || layer is WeatherIconLayerObject7 || layer is WeatherIconLayerObject8 || layer is WeatherIconLayerObject9 || layer is WeatherIconLayerObject10 || layer is WeatherIconLayerObject11  || layer is WeatherIconLayerObject12 || layer is WeatherIconLayerObject13 || layer is WeatherIconLayerObject14 || layer is WeatherIconLayerObject15 {
            SliderStepper(color: .blue, title: "Scale:", sliderBindingValue: $layer.appearance.scales.x, minValue: 0, maxValue: 2.5, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 1)
        }
        
        if !(layer is CircleGaugeObject) && !(layer is WeatherIconLayerObject)  && !(layer is WeatherIconLayerObject2) && !(layer is WeatherIconLayerObject3) && !(layer is WeatherIconLayerObject4) && !(layer is WeatherIconLayerObject5) && !(layer is WeatherIconLayerObject6) && !(layer is WeatherIconLayerObject7) && !(layer is WeatherIconLayerObject8) && !(layer is WeatherIconLayerObject9) && !(layer is WeatherIconLayerObject10) && !(layer is WeatherIconLayerObject11) && !(layer is WeatherIconLayerObject12) && !(layer is WeatherIconLayerObject13) && !(layer is WeatherIconLayerObject14) && !(layer is WeatherIconLayerObject15) && !(layer is CalendarViewModel) && !(layer is HiLoGaugeObject) && !(layer is ConditionAssetObject) && !(layer is weatherIconForecast){
            
            SliderStepper(color: .blue, title: "Width:", sliderBindingValue: $layer.appearance.width, minValue: 0, maxValue: UIScreen.main.bounds.width * 1.05, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 200)
            
            SliderStepper(color: .blue, title: "Height:", sliderBindingValue:  $layer.appearance.height, minValue: 0, maxValue: UIScreen.main.bounds.height * 1.05, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 200)
        }
    }
}


struct CustomShapeControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        
        if let _ = layer as? CustomShapeObject {
            
            SliderStepper(color: .blue, title: "Count:", sliderBindingValue: $layer.appearance.shapePointCount, minValue: 2, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 5)
            
            SliderStepper(color: .blue, title: "Inner Ratio:", sliderBindingValue: $layer.appearance.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: layer.appearance.sliderSpecifier, defaultValue: 1)
        }
    }
}

struct CalendarControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        
        if let _ = layer as? CalendarViewModel {
            SliderStepper(color: .blue, title: "Days Text Size", sliderBindingValue: $layer.appearance.daysTextSize, minValue: 2, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 15)
            
            CustomColorPicker(titleText: "Days Colour", pickerBindingValue:  $layer.appearance.daysColor, pickerBindingValue2: nil, showGradientToggle: false)
            
            SliderStepper(color: .blue, title: "Date Text Size", sliderBindingValue: $layer.appearance.dateTextSize, minValue: 2, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 15)
            
            CustomColorPicker(titleText: "Date Text Colour", pickerBindingValue:  $layer.appearance.dateTextColor, pickerBindingValue2: nil, showGradientToggle: false)
            
            CustomColorPicker(titleText: "Date BG Colour", pickerBindingValue:  $layer.appearance.dateBackgroundColor, pickerBindingValue2: nil, showGradientToggle: false)
            
            SliderStepper(color: .blue, title: "Date BG Corner Radius", sliderBindingValue: $layer.appearance.dateBackgroundCornerRadius, minValue: 2, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 10)
            
            CustomColorPicker(titleText: "Background Colour", pickerBindingValue:  $layer.appearance.calendarBackgroundColor, pickerBindingValue2: $layer.appearance.calendarBackgroundColor2, showGradientToggle: true)
            
            SliderStepper(color: .blue, title: "Background Corner Radius", sliderBindingValue: $layer.appearance.calendarBackgroundCornerRadius, minValue: 2, maxValue: 30, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 10)
            
            CustomToggle(showTitleText: true, titleText: "Toggle Today Indicator Style:", bindingValue: $layer.appearance.todayIndicatorStyle, onSymbol: "square", offSymbol: "circle", rotate: false)
                .padding(.trailing, 5)
            
            CustomColorPicker(titleText: "Today Indicator Colour", pickerBindingValue:  $layer.appearance.todayIndicator, pickerBindingValue2: nil, showGradientToggle: false)
        }
    }
}

struct WavyDockControls: View {
    
    @StateObject var layer: LayerObject
  
    
    var body: some View {
        
        if let _ = layer as? WavyDockObject {
            SliderStepper(color: .blue, title: "xAngle", sliderBindingValue: $layer.appearance.xAngle, minValue: 0, maxValue: 360, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 360)
            
            SliderStepper(color: .blue, title: "Amplitude", sliderBindingValue: $layer.appearance.amplitude, minValue: -0.5, maxValue: 0.5, step: layer.appearance.sliderStep, specifier: layer.appearance.sliderSpecifier, defaultValue: 0.15)
        }
    }
}
