//
//  LayerObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import Foundation

class LayerObject: Identifiable, ObservableObject {
    
    
    // MARK: - Public properties
    
    
    /// The unique identifier of the object
    var id = UUID()
    
    
    /// The class which defines the objects appearance on the screen
    var appearance: LayerObjectAppearance = .init()
    
    /// The type of the object
    var objectType: LayerObjectType = .text
    
}
