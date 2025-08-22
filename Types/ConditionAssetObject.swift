//
//  ConditionAssetObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/08/2023.
//

import SwiftUI

    class ConditionAssetObject: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

           
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .conditionAsset //MARK: remember and update this!
        }

        required init(from decoder: Decoder) throws {
            try super.init(from: decoder)
            self.objectType = .conditionAsset
        }
    }

