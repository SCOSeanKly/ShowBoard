//
//  MapObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI


class MapObject: LayerObject {
    
    // Conforming LayerObject
    var id: UUID
    
    @Published var appearance: LayerObjectAppearance
    
    
    // MARK: - Public Properties
    
    
    
    /// Map Frame Width
    @Published var mapFrameWidth: CGFloat
    
    /// Map Frame Height
    @Published var mapFrameHeight: CGFloat
    
    /// Map Frame Corner Radius
    @Published var mapCornerRadius: CGFloat
    
    /// Map Shadow radius
    @Published var mapShadowRadius: CGFloat
    
    /// Map Shadow Offset
    @Published var mapShadowOffset: CGFloat
    
    /// Map Opacity
    @Published var mapOpacity: CGFloat
    
    
    
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), mapFrameWidth: CGFloat = 300.0, mapFrameHeight: CGFloat = 150, mapCornerRadius: CGFloat = 0.0, mapShadowRadius: CGFloat = 0.0, mapShadowOffset: CGFloat = 0.0, mapOpacity: CGFloat = 1.0 ) {
        self.id = id
        self.appearance = appearance
        self.mapFrameWidth = mapFrameWidth
        self.mapFrameHeight = mapFrameHeight
        self.mapCornerRadius = mapCornerRadius
        self.mapShadowRadius = mapShadowRadius
        self.mapShadowOffset = mapShadowOffset
        self.mapOpacity = mapOpacity
    }
}

