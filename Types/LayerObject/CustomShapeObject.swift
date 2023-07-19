//
//  CustomShapeObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 16.07.23.
//

import SwiftUI


class CustomShapeObject: LayerObject {    
    
    // Conforming LayerObject
    var id: UUID
    @Published var appearance: LayerObjectAppearance
    public let objectType: LayerObjectType = .customShape
    
    
    
    
    
    // MARK: - Public Properties
    
     /// The shape point count
     @Published var shapePointCount: CGFloat
     
     /// The shape inner fill ratio (shape fill to points ratio)
     @Published var shapeRatio: CGFloat
     
     /// Shape colour
     @Published var shapeColor: Color
    
    /// Shape Frame Width
    @Published var shapeFrameWidth: CGFloat
    
    /// Shape Frame Height
    @Published var shapeFrameHeight: CGFloat
    
     
     
    
    
    
    
    
    // MARK: - Public Methods
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), shapePointCount: CGFloat = 5.0, shapeRatio: CGFloat = 1.0, shapeColor: Color = Color.blue, shapeFrameWidth: CGFloat = 250, shapeFrameHeight: CGFloat = 250) {
        self.id = id
        self.appearance = appearance
        self.shapePointCount = shapePointCount
        self.shapeRatio = shapeRatio
        self.shapeColor = shapeColor
        self.shapeFrameWidth = shapeFrameWidth
        self.shapeFrameHeight = shapeFrameHeight
    }

   
}

