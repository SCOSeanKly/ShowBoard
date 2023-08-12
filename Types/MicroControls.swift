//
//  MicroControls.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//


import SwiftUI

    class MicroControls: LayerObject {
        
        // MARK: - Public Properties
        
        @Published var offsetX: CGFloat = 0
        @Published var offsetY: CGFloat = 0
        @Published var widthRatio: CGFloat = 0
        @Published var heightRatio: CGFloat = 0
     
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), offsetX: CGFloat = 0, OffsetY: CGFloat = 0, widthRatio: CGFloat = 0, heightRatio: CGFloat = 0) {

            self.offsetX = offsetX
            self.offsetY = OffsetY
            self.widthRatio = widthRatio
            self.heightRatio = heightRatio
          
            
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .squareShape //MARK: remember and update this!
        }
    }
