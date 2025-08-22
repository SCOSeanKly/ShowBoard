//
//  BatBarObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 09/08/2023.
//

import SwiftUI


class LinearGaugeObject: LayerObject {
    
    // MARK: - Public Properties
    
    
 
 
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

      
       
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .batteryLinearGauge
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.objectType = .batteryLinearGauge
    }
}


class LinearHiLoObject: LayerObject {
    
    // MARK: - Public Properties
    
    
 
 
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

      
       
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .hiLoLinearGauge
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.objectType = .hiLoLinearGauge
    }
}
 

