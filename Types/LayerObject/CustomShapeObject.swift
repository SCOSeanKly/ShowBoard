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
    
    
    
    
    
    // MARK: - Public Properties
    
     /// The shape point count
     @Published var shapePointCount: CGFloat
     
     /// The shape inner fill ratio (shape fill to points ratio)
     @Published var shapeRatio: CGFloat
     
     /// Shape colour
     @Published var shapeColor: Color
     
     
    
    
    
    
    
    // MARK: - Public Methods
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), shapePointCount: CGFloat = 5.0, shapeRatio: CGFloat = 1.0, shapeColor: Color = Color.blue) {
        self.id = id
        self.appearance = appearance
        self.shapePointCount = shapePointCount
        self.shapeRatio = shapeRatio
        self.shapeColor = shapeColor
    }

   
}

