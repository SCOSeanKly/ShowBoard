//
//  CustomShapeObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 16.07.23.
//

import SwiftUI


class CustomShapeObject: LayerObject {
    
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
    
    /// Shape Transparent Blur effect
    @Published var shapeBlur: CGFloat
    
    
    
    // MARK: - Public Methods
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), shapePointCount: CGFloat = 5.0, shapeRatio: CGFloat = 1.0, shapeColor: Color = Color.blue, shapeFrameWidth: CGFloat = 150, shapeFrameHeight: CGFloat = 150, shapeBlur: CGFloat = 8.0) {
        
        self.shapePointCount = shapePointCount
        self.shapeRatio = shapeRatio
        self.shapeColor = shapeColor
        self.shapeFrameWidth = shapeFrameWidth
        self.shapeFrameHeight = shapeFrameHeight
        self.shapeBlur = shapeBlur
       
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .customShape
    }

   
}

