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
    
    
    
    /** add published vars */
    
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {
        self.id = id
        self.appearance = appearance
    }
}

