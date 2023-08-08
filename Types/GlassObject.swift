//
//  GlassObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/08/2023.
//

import SwiftUI


class GlassObject: LayerObject {
    
    // MARK: - Public Properties
    
    
    
    
    
    
    // MARK: - Public Methods
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {
        
    
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .customShape
    }

   
}


