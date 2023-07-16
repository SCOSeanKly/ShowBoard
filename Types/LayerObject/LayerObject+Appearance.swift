//
//  LayerObject+Appearance.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI

    
class LayerObjectAppearance {
    
    
    // MARK: - Public Properties
    
    
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
        @unknown default:
            return ""
        }
    }
    
    
    
    
    init() {
        self.position = .zero
        self.originalSize = .zero
        self.scales = .init(x: 1, y: 1)
        self.rotation = .zero
        self.blendMode = .normal
        self.shadow = ShadowSettings()
    }
    
    
    init(position: CGPoint, originalSize: CGSize, scales: CGPoint, rotation: Angle, blendMode: BlendMode, shadow: ShadowSettings) {
        self.position = position
        self.originalSize = originalSize
        self.scales = scales
        self.rotation = rotation
        self.blendMode = blendMode
        self.shadow = ShadowSettings()
    }
    
    
    
    /// Sets bot horizontal and vertical scale values with the given value
    /// - Parameter value: The new scale value
    public func setScales(with value: CGFloat) {
        self.scales.x = value
        self.scales.y = value
    }
}
