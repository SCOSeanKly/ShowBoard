//
//  TextObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


class TextObject: LayerObject {
    
    
    // MARK: - Public Properties

    

    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {
         
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .text
        }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.objectType = .text
    }
}
