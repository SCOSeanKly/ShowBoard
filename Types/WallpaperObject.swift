//
//  WallpaperObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 06/09/2023.
//

import SwiftUI

    class WallpaperObject: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

           
            super.init()
            self.id = id
            self.appearance = appearance
         //   self.objectType = .squareShape //MARK: remember and update this!
        }
    }

