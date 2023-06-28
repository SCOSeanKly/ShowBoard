//
//  LayerObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import Foundation

protocol LayerObject: Identifiable, ObservableObject {
    
    
    // MARK: - Public properties
    
    
    /// The unique identifier of the object
    var id: UUID { get }
    
    
    /// The class which defines the objects appearance on the screen
    var appearance: LayerObjectAppearance { get set }
    
}
