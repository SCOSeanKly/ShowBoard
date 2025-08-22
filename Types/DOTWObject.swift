//
//  DOTWObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/09/2023.
//

import SwiftUI

class DOTWObject: LayerObject {
    
    // MARK: - Public Properties
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .DOTW //MARK: remember and update this!
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.objectType = .DOTW
    }
}
