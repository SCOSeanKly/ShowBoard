//
//  RainObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/08/2023.
//

import SwiftUI

    class RainObject: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

           
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .rain //MARK: remember and update this!
        }
    }
