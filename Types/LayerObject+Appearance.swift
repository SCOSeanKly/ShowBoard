//
//  LayerObject+Appearance.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


struct LayerObjectAppearance {
    
    
    // MARK: - Public Properties
    
    
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
        
    }
    
    init(position: CGPoint, originalSize: CGSize, scales: CGPoint, rotation: Angle, blendMode: BlendMode, shadow: ShadowSettings, blur: CGFloat, opacity: CGFloat, cornerRadius: CGFloat, skewX: CGFloat, skewY: CGFloat, shadowOpacity: CGFloat = 0.0, darkMode: Bool = false, invert: Bool = false, showSettings: Bool = false, width: CGFloat = 200, height: CGFloat = 200, overlayColor: Color = .clear) {
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
    }
    
    
    
    
    /// Sets bot horizontal and vertical scale values with the given value
    /// - Parameter value: The new scale value
    public mutating func setScales(with value: CGFloat) {
        self.scales.x = value
        self.scales.y = value
    }
}
