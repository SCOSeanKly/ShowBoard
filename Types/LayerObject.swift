//
//  LayerObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import Foundation

class LayerObject: Identifiable, ObservableObject, Codable {
    
    
    // MARK: - Public properties
    
    
    /// The unique identifier of the object
    var id: UUID = UUID()
    
    
    
    /// The class which defines the objects appearance on the screen
    @Published var appearance: LayerObjectAppearance = .init()
    
  
    
    /// The type of the object
    var objectType: LayerObjectType = .glassShape
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case appearance
        case objectType
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        appearance = try container.decode(LayerObjectAppearance.self, forKey: .appearance)
        objectType = try container.decode(LayerObjectType.self, forKey: .objectType)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(appearance, forKey: .appearance)
        try container.encode(objectType, forKey: .objectType)
    }
    
    init() {}
}
