//
//  MapObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI


class MapObject: LayerObject {
    
    // MARK: - Public Properties
    
    

    
    /// Map Color Overlay
    @Published var mapOverlayColor: Color
    
    /// Map Image Invert Colors
    @Published var mapInvertColor: Bool
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), mapOverlayColor: Color = Color.clear, mapInvertColor: Bool = false) {


        self.mapOverlayColor = mapOverlayColor
        self.mapInvertColor = mapInvertColor
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .map
    }
}

