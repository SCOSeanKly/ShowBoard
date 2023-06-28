//
//  TextObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import Foundation


class TextObject: LayerObject {
    
    
    // MARK: - Public Properties
    
    // Conforming LayerObject
    public var id: UUID
    
    @Published var appearance: LayerObjectAppearance
    
    
    /// The user sets this text in a text field. This should contain some Placeholder tags too.
    @Published var inputText: String
    
    
    public var dynamicText: String {
        DynamicText.convert(input: inputText)
    }
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), inputText: String = "") {
        self.id = id
        self.appearance = appearance
        self.inputText = inputText
    }
    
    
}
