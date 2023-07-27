//
//  MapObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI


class MapObject: LayerObject {
    
    // MARK: - Public Properties
    
    
    
    /// Map Frame Width
    @Published var mapFrameWidth: CGFloat
    
    /// Map Frame Height
    @Published var mapFrameHeight: CGFloat
    
    /// Map Color Overlay
    @Published var mapOverlayColor: Color
    
    /// Map Image Invert Colors
    @Published var mapInvertColor: Bool
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), mapFrameWidth: CGFloat = 300.0, mapFrameHeight: CGFloat = 150, mapOverlayColor: Color = Color.clear, mapInvertColor: Bool = false) {

        self.mapFrameWidth = mapFrameWidth
        self.mapFrameHeight = mapFrameHeight
        self.mapOverlayColor = mapOverlayColor
        self.mapInvertColor = mapInvertColor
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .map
    }
}

