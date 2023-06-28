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
    
    
    var blendMode: BlendMode
    
    
    init() {
        self.position = .zero
        self.originalSize = .zero
        self.scales = .zero
        self.rotation = .zero
        self.blendMode = .normal
    }
    
    
    init(position: CGPoint, originalSize: CGSize, scales: CGPoint, rotation: Angle, blendMode: BlendMode) {
        self.position = position
        self.originalSize = originalSize
        self.scales = scales
        self.rotation = rotation
        self.blendMode = blendMode
    }
}
