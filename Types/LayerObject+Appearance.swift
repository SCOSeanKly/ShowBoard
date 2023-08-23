//
//  LayerObject+Appearance.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


struct LayerObjectAppearance {
    
    
    // MARK: - Public Properties
    
    
    
    //MARK: GLOBAL
    /// Generic Bool for showSettings toggle
    var showSettings: Bool
    
    /// The position of the object on the layer
    var position: CGPoint
    
    
    /// The original size of the object
    var originalSize: CGSize
    
    
    /// The current scale values of the object
    /// - Parameter x: is the scale of the H-Axis
    /// - Parameter y: is the scale of the V-Axis
    var scales: CGPoint
    
    
    /// The rotation value of the object
    var rotation: Angle
    
    
    /// The currently used blend mode
    var blendMode: BlendMode
    
    
    /// The currently applied shadow settings
    var shadow: ShadowSettings
    
    
    /// Blur radius
    var blur: CGFloat
    var glassBlur: CGFloat
    
    
    /// Opacity ammount
    var opacity: CGFloat
    
    
    /// Corner Radius
    var cornerRadius: CGFloat
    
    var offsetX: CGFloat
    var offsetY: CGFloat
    var scaleHeight: CGFloat
    var scaleWidth: CGFloat
    
    /// Skew Effect X
    var skewX: CGFloat
    
    
    /// Skew Effect Y
    var skewY: CGFloat
    
    
    /// Shadow Opacity
    var shadowOpacity: CGFloat
    
    
    /// Appearnce Dark Mode
    var darkMode: Bool
    
    
    /// Invert Appearance / Color
    var invert: Bool
    
    
    /// Appearance Width
    var width: CGFloat
    
    
    /// Appearance Height
    var height: CGFloat
    
    /// Appearance Overlay color
    var overlayColor: Color
    
    
    /// Show Image reflection
    var showReflection: Bool
    
    /// Show Image reflection
    var reflectionOffset: CGFloat
    
    
    //MARK: Custom Shape
    /// Shape Overlay Grain Effect
    var shapeGrain: Bool
    
    /// Shape Border Remove
    var showBorder: Bool
    
    /// Shape Border Thickness
    var borderWidth: CGFloat
    
    
    var shapePointCount: CGFloat
    
    /// The shape inner fill ratio (shape fill to points ratio)
    var shapeRatio: CGFloat
    
    var fillColor: Color
    
    var fillColor2: Color
    
    //MARK: Circle Gauge
    /// Min Value
    var minValue: CGFloat
    
    /// Max Value
    var maxValue: CGFloat
    
    /// Current Value Label Font Size
    var currentValueLabelFontSize: CGFloat
    
    /// Min Max Value Label Font Size
    var minMaxValueLabelFontSize: CGFloat
    
    /// Gauge Colour
    var gaugeColor: Color
    
    /// Show current value label
    var showCurrentValueLabel: Bool
    
    /// Show Min and Max value labels
    var showMinMaxValueLabels: Bool
    
    /// Current value label color
    var currentValueLabelColor: Color
    
    /// Min Max value label colour
    var minMaxValueLabelColor: Color
    
    ///Scale effect for gauge
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
    
    
    /// The list of the avaliable blend modes
    static let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    
    // TODO: Comment
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
        self.scales = .init(x: 1, y: 1)
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
        self.calendarBackgroundCornerRadius = 10
        self.todayIndicator = .red
        
        self.fontTracking = 0
        self.fontFrameWidth = 200
        self.dropLast = 0
        self.fontColor = .white
        self.fontSize = 16
      //  self.selectedFontName = "Apple SF"
        self.fontWeight = .medium
        self.textAlignment = .center
        self.inputText = "ShowBoard - Good [timeOfDay]"
        self.isCircleText = false
        self.isKeyboardPresented = false
        self.fillColor2 = .white
        self.useGradientColors = false
        self.todayIndicatorStyle = false
        
    
        
    }
    
    init(position: CGPoint, originalSize: CGSize, scales: CGPoint, rotation: Angle, blendMode: BlendMode, shadow: ShadowSettings, blur: CGFloat, opacity: CGFloat, cornerRadius: CGFloat, skewX: CGFloat, skewY: CGFloat, shadowOpacity: CGFloat, darkMode: Bool, invert: Bool, showSettings: Bool, width: CGFloat, height: CGFloat, overlayColor: Color, shapeGrain: Bool, showBorder: Bool, borderWidth: CGFloat, shapePointCount: CGFloat, shapeRatio: CGFloat, fillColor: Color, glassBlur: CGFloat, minValue: CGFloat,
         maxValue: CGFloat, currentValueLabelFontSize: CGFloat, minMaxValueLabelFontSize: CGFloat, gaugeColor: Color, showCurrentValueLabel: Bool, showMinMaxValueLabels: Bool, currentValueLabelColor: Color, minMaxValueLabelColor: Color, gaugeScale: CGFloat, showReflection: Bool = false, reflectionOffset: CGFloat, offsetX: CGFloat, offsetY: CGFloat, scaleWidth: CGFloat, scaleHeight: CGFloat, xAngle: CGFloat, amplitide: CGFloat,
         daysTextSize: CGFloat,
         daysColor: Color,
         dateTextColor: Color,
         dateTextSize: CGFloat,
         dateBackgroundColor: Color,
         dateBackgroundCornerRadius: CGFloat,
         calendarBackgroundColor: Color,
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
         todayIndicatorStyle: Bool) {
        
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
        self.calendarBackgroundCornerRadius = calendarBackgroundCornerRadius
        self.todayIndicator = todayIndicator
        
        self.fontTracking = fontTracking
        self.fontFrameWidth = fontFrameWidth
        self.dropLast = dropLast
        self.fontColor = fontColor
        self.fontSize = fontSize
      //  self.selectedFontName = selectedFontName
        self.fontWeight = fontWeight
        self.textAlignment = textAlignment
        self.inputText = inputText
        self.isCircleText = isCircleText
        self.isKeyboardPresented = isKeyboardPresented
        self.fillColor2 = fillColor2
        self.useGradientColors = useGradientColors
        self.todayIndicatorStyle = todayIndicatorStyle
    }
    
    
    
    
    /// Sets bot horizontal and vertical scale values with the given value
    /// - Parameter value: The new scale value
    public mutating func setScales(with value: CGFloat) {
        self.scales.x = value
        self.scales.y = value
    }
}
