//
//  SquareShapeObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI

    class SquareShapeObject: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

           
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .squareShape //MARK: remember and update this!
        }
    }
