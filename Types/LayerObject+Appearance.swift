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
        self.width = 200
        self.height = 200
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
        self.gaugeColor = .white
        self.showCurrentValueLabel = true
        self.showMinMaxValueLabels = true
        self.currentValueLabelColor = .white
        self.minMaxValueLabelColor = .white
        self.gaugeScale = 1.0
        self.showReflection = false
        self.reflectionOffset = 5
        
    }
    
    init(position: CGPoint, originalSize: CGSize, scales: CGPoint, rotation: Angle, blendMode: BlendMode, shadow: ShadowSettings, blur: CGFloat, opacity: CGFloat, cornerRadius: CGFloat, skewX: CGFloat, skewY: CGFloat, shadowOpacity: CGFloat, darkMode: Bool, invert: Bool, showSettings: Bool, width: CGFloat, height: CGFloat, overlayColor: Color, shapeGrain: Bool, showBorder: Bool, borderWidth: CGFloat, shapePointCount: CGFloat, shapeRatio: CGFloat, fillColor: Color, glassBlur: CGFloat, minValue: CGFloat,
         maxValue: CGFloat, currentValueLabelFontSize: CGFloat, minMaxValueLabelFontSize: CGFloat, gaugeColor: Color, showCurrentValueLabel: Bool, showMinMaxValueLabels: Bool, currentValueLabelColor: Color, minMaxValueLabelColor: Color, gaugeScale: CGFloat, showReflection: Bool = false, reflectionOffset: CGFloat = 5) {
        
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
    }
    
    
    
    
    /// Sets bot horizontal and vertical scale values with the given value
    /// - Parameter value: The new scale value
    public mutating func setScales(with value: CGFloat) {
        self.scales.x = value
        self.scales.y = value
    }
}
