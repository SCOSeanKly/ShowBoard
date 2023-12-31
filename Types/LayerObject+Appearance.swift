//
//  LayerObject+Appearance.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


struct LayerObjectAppearance {
    
    
    //MARK: Global
    var showSettings: Bool
    var position: CGPoint
    var sliderSpecifier: Int
    var sliderStep: CGFloat
    var originalSize: CGSize
    var scales: CGFloat
    var rotation: Angle
    var blendMode: BlendMode
    var shadow: ShadowSettings
    var blur: CGFloat
    var glassBlur: CGFloat
    var opacity: CGFloat
    var cornerRadius: CGFloat
    var offsetX: CGFloat
    var offsetY: CGFloat
    var scaleHeight: CGFloat
    var scaleWidth: CGFloat
    var skewX: CGFloat
    var skewY: CGFloat
    var shadowOpacity: CGFloat
    var darkMode: Bool
    var invert: Bool
    var width: CGFloat
    var height: CGFloat
    var overlayColor: Color
    var showReflection: Bool
    var reflectionOffset: CGFloat
    
    //MARK: Custom Shape
    var shapeGrain: Bool
    var showBorder: Bool
    var borderWidth: CGFloat
    var shapePointCount: CGFloat
    var shapeRatio: CGFloat
    var fillColor: Color
    var fillColor2: Color
    var strokeWidth: CGFloat
    var strokeDash: CGFloat
    
    //MARK: Circle Gauge
    var minValue: CGFloat
    var maxValue: CGFloat
    var currentValueLabelFontSize: CGFloat
    var minMaxValueLabelFontSize: CGFloat
    var gaugeColor: Color
    var showCurrentValueLabel: Bool
    var showMinMaxValueLabels: Bool
    var currentValueLabelColor: Color
    var minMaxValueLabelColor: Color
    var gaugeScale: CGFloat
    
    //MARK: WavyDock
    var xAngle: CGFloat
    var amplitude : CGFloat
    
    
    //MARK: Calendar
    var daysTextSize: CGFloat
    var daysColor: Color
    var dateTextColor: Color
    var dateTextSize: CGFloat
    var dateBackgroundColor: Color
    var dateBackgroundCornerRadius: CGFloat
    var calendarBackgroundColor: Color
    var calendarBackgroundColor2: Color
    var calendarBackgroundCornerRadius: CGFloat
    var todayIndicator: Color
    var todayIndicatorStyle: Bool
    
    
    //MARK: Dynamic Text
    var fontTracking: CGFloat
    var fontFrameWidth: CGFloat
    var dropLast: CGFloat
    var fontColor: Color
    var fontSize: CGFloat
    // var selectedFontName: String
    @AppStorage("selectedFontName") var selectedFontName: String = "Apple SF"
    var fontWeight: Font.Weight
    var font: Font {
        Font.custom(selectedFontName, size: fontSize)
            .weight(fontWeight)
    }
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    var textAlignment: TextAlignment
    var inputText: String
    
    @MainActor public func dynamicText(wk: WeatherObserver) -> String {
        DynamicText.convert(input: inputText, wk: wk)
    }
    var isCircleText: Bool
    var isKeyboardPresented: Bool
    var useGradientColors: Bool
    
    //MARK: Rain Effect
    var showRainBounce: Bool
    var addGaradientMask: Bool
    
    //MARK: PLus7 Days
    var showHorizontal: Bool
    var spacing: CGFloat
    var daysToShow: CGFloat
    var showForecastTempString: Bool
    var weatherIconAssetStyle: Int
    var labelsOffset: CGFloat
    var showDayNames: Bool
    
    //MARK: Wallpaper Settings
    var hue: Double
    var contrast: CGFloat
    var saturation: CGFloat
    var pixellate: Float
    var speed: Float
    var frequency: Float
    var amplitudeMetal: Float
    
    
    /// The list of the avaliable blend modes
    static let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    
    // TODO: Blend mode labels
    static func labelForBlendMode(_ blendMode: BlendMode) -> String {
        
        switch blendMode {
        case .normal:
            return "Normal"
        case .multiply:
            return "Multiply"
        case .screen:
            return "Screen"
        case .overlay:
            return "Overlay"
        case .darken:
            return "Darken"
        case .lighten:
            return "Lighten"
        case .colorDodge:
            return "Color Dodge"
        case .colorBurn:
            return "Color Burn"
        case .softLight:
            return "Soft Light"
        case .hardLight:
            return "Hard Light"
        case .difference:
            return "Difference"
        case .exclusion:
            return "Exclusion"
        case .hue:
            return "Hue"
        case .saturation:
            return "Saturation"
        case .color:
            return "Color"
        case .luminosity:
            return "Luminosity"
        default:
            return "Unknown Blend Mode"
        }
    }
    
    
    init() {
        self.position = .zero
        self.originalSize = .zero
        self.scales = 1
        self.rotation = .zero
        self.blendMode = .normal
        self.shadow = ShadowSettings()
        self.blur = 0.0
        self.opacity = 1.0
        self.cornerRadius = 0.0
        self.skewX = 0.0
        self.skewY = 0.0
        self.shadowOpacity = 0.0
        self.darkMode = false
        self.invert = false
        self.showSettings = false
        self.width = UIScreen.main.bounds.width * 0.85
        self.height = UIScreen.main.bounds.width * 0.7
        self.overlayColor = .clear
        self.shapeGrain = false
        self.showBorder = true
        self.borderWidth = 0.5
        self.shapePointCount = 5
        self.shapeRatio = 1
        self.fillColor = .white
        self.glassBlur = 5
        self.minValue = 0.0
        self.maxValue = 100
        self.currentValueLabelFontSize = 12
        self.minMaxValueLabelFontSize = 6
        self.gaugeColor = .blue
        self.showCurrentValueLabel = true
        self.showMinMaxValueLabels = true
        self.currentValueLabelColor = .white
        self.minMaxValueLabelColor = .white
        self.gaugeScale = 1.0
        self.showReflection = false
        self.reflectionOffset = 5
        self.offsetX = 0
        self.offsetY = 0
        self.scaleWidth = 1
        self.scaleHeight = 1
        self.xAngle = 360
        self.amplitude = 0.15
        
        self.daysTextSize = 15
        self.daysColor = .white
        self.dateTextColor = .white
        self.dateTextSize = 15
        self.dateBackgroundColor = .clear
        self.dateBackgroundCornerRadius = 10
        self.calendarBackgroundColor = .clear
        self.calendarBackgroundColor2 = .clear
        self.calendarBackgroundCornerRadius = 10
        self.todayIndicator = .red
        
        self.fontTracking = 0
        self.fontFrameWidth = 200
        self.dropLast = 0
        self.fontColor = .white
        self.fontSize = 16
        self.fontWeight = .medium
        self.textAlignment = .center
        self.inputText = "ShowBoard - Good [timeOfDay]"
        self.isCircleText = false
        self.isKeyboardPresented = false
        self.fillColor2 = .white
        self.useGradientColors = false
        self.todayIndicatorStyle = false
        self.showRainBounce = false
        self.addGaradientMask = true
        
        self.showHorizontal = true
        self.showDayNames = true
        self.spacing = -10
        self.daysToShow = 5
        self.showForecastTempString = false
        self.weatherIconAssetStyle = 1
        self.labelsOffset = 10
        self.sliderSpecifier = 2
        self.sliderStep = 0.05
        
        
        self.hue = 0.0
        self.contrast = 1.0
        self.saturation = 1.0
        self.pixellate = 1
        self.speed = 1
        self.frequency = 15
        self.amplitudeMetal = 0
        self.strokeWidth = 5
        self.strokeDash = 5
        
        
        
        
        
        
    }
    
    init(position: CGPoint,
         originalSize: CGSize,
         scales: CGFloat,
         rotation: Angle,
         blendMode: BlendMode,
         shadow: ShadowSettings,
         blur: CGFloat,
         opacity: CGFloat,
         cornerRadius: CGFloat,
         skewX: CGFloat, skewY: CGFloat,
         shadowOpacity: CGFloat,
         darkMode: Bool, invert: Bool,
         showSettings: Bool,
         width: CGFloat,
         height: CGFloat,
         overlayColor: Color,
         shapeGrain: Bool,
         showBorder: Bool,
         borderWidth: CGFloat,
         shapePointCount: CGFloat,
         shapeRatio: CGFloat,
         fillColor: Color,
         glassBlur: CGFloat,
         minValue: CGFloat,
         maxValue: CGFloat,
         currentValueLabelFontSize: CGFloat,
         minMaxValueLabelFontSize: CGFloat,
         gaugeColor: Color,
         showCurrentValueLabel: Bool,
         showMinMaxValueLabels: Bool,
         currentValueLabelColor: Color,
         minMaxValueLabelColor: Color,
         gaugeScale: CGFloat,
         showReflection: Bool = false,
         reflectionOffset: CGFloat,
         offsetX: CGFloat,
         offsetY: CGFloat,
         scaleWidth: CGFloat,
         scaleHeight: CGFloat,
         xAngle: CGFloat,
         amplitide: CGFloat,
         daysTextSize: CGFloat,
         daysColor: Color,
         dateTextColor: Color,
         dateTextSize: CGFloat,
         dateBackgroundColor: Color,
         dateBackgroundCornerRadius: CGFloat,
         calendarBackgroundColor: Color,
         calendarBackgroundColor2: Color,
         calendarBackgroundCornerRadius: CGFloat,
         todayIndicator: Color,
         fontTracking: CGFloat,
         fontFrameWidth: CGFloat,
         dropLast: CGFloat,
         fontColor: Color,
         fontSize: CGFloat,
         selectedFontName: String,
         fontWeight: Font.Weight,
         textAlignment: TextAlignment,
         inputText: String,
         isCircleText: Bool,
         isKeyboardPresented: Bool,
         fillColor2: Color,
         useGradientColors: Bool,
         todayIndicatorStyle: Bool,
         showRainBounce: Bool,
         addGaradientMask: Bool,
         showHorizontal: Bool,
         spacing: CGFloat,
         daysToShow: CGFloat,
         showForecastTempString: Bool,
         weatherIconAssetStyle: Int,
         labelsOffset: CGFloat,
         sliderSpecifier: Int,
         sliderStep: CGFloat,
         customSliderStep: CGFloat,
         hue: Double,
         contrast: CGFloat,
         saturation: CGFloat,
         pixellate: Float,
         speed: Float,
         frequency: Float,
         amplitudeMetal: Float,
         strokeWidth: CGFloat,
         strokeDash: CGFloat,
         showDayNames: Bool
    ) {
        
        self.position = position
        self.originalSize = originalSize
        self.scales = scales
        self.rotation = rotation
        self.blendMode = blendMode
        self.shadow = shadow
        self.blur = blur
        self.opacity = opacity
        self.cornerRadius = cornerRadius
        self.skewX = skewX
        self.skewY = skewY
        self.shadowOpacity = shadowOpacity
        self.darkMode = darkMode
        self.invert = invert
        self.showSettings = showSettings
        self.width = width
        self.height = height
        self.overlayColor = overlayColor
        self.shapeGrain = shapeGrain
        self.showBorder = showBorder
        self.borderWidth = borderWidth
        self.shapePointCount = shapePointCount
        self.shapeRatio = shapeRatio
        self.fillColor = fillColor
        self.glassBlur = glassBlur
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentValueLabelFontSize = currentValueLabelFontSize
        self.minMaxValueLabelFontSize = minMaxValueLabelFontSize
        self.gaugeColor = gaugeColor
        self.showCurrentValueLabel = showCurrentValueLabel
        self.showMinMaxValueLabels = showCurrentValueLabel
        self.currentValueLabelColor = currentValueLabelColor
        self.minMaxValueLabelColor = minMaxValueLabelColor
        self.gaugeScale = gaugeScale
        self.showReflection = showReflection
        self.reflectionOffset = reflectionOffset
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.scaleWidth = scaleWidth
        self.scaleHeight = scaleHeight
        self.xAngle = xAngle
        self.amplitude = amplitide
        self.daysTextSize = daysTextSize
        self.daysColor = daysColor
        self.dateTextColor = dateTextColor
        self.dateTextSize = dateTextSize
        self.dateBackgroundColor = dateBackgroundColor
        self.dateBackgroundCornerRadius = dateBackgroundCornerRadius
        self.calendarBackgroundColor = calendarBackgroundColor
        self.calendarBackgroundColor2 = calendarBackgroundColor2
        self.calendarBackgroundCornerRadius = calendarBackgroundCornerRadius
        self.todayIndicator = todayIndicator
        self.fontTracking = fontTracking
        self.fontFrameWidth = fontFrameWidth
        self.dropLast = dropLast
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textAlignment = textAlignment
        self.inputText = inputText
        self.isCircleText = isCircleText
        self.isKeyboardPresented = isKeyboardPresented
        self.fillColor2 = fillColor2
        self.useGradientColors = useGradientColors
        self.todayIndicatorStyle = todayIndicatorStyle
        self.showRainBounce = showRainBounce
        self.addGaradientMask = addGaradientMask
        self.showHorizontal = showHorizontal
        self.spacing = spacing
        self.daysToShow = daysToShow
        self.showForecastTempString = showForecastTempString
        self.weatherIconAssetStyle = weatherIconAssetStyle
        self.labelsOffset = labelsOffset
        self.sliderSpecifier = sliderSpecifier
        self.sliderStep = sliderStep
        self.hue = hue
        self.contrast = contrast
        self.saturation = saturation
        self.pixellate = pixellate
        self.speed = speed
        self.frequency = frequency
        self.amplitudeMetal = amplitudeMetal
        self.strokeWidth = strokeWidth
        self.strokeDash = strokeDash
        self.showDayNames = showDayNames
        
    }
}
