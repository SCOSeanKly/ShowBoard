//
//  TextObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


class TextObject: LayerObject {
    
    
    // MARK: - Public Properties
    
    /// The user sets this text in a text field. This should contain some Placeholder tags too.
    @Published var inputText: String
    
    
    /// The name of the selected font
    @Published var selectedFontName: String
    
    
    /// The current size of the font
    @Published var fontSize: CGFloat = 16
    
    
    // TODO: Comment me
    @Published var fontTracking: CGFloat = 0
    
    
    // TODO: Comment me
    @Published var fontWeight: Font.Weight = .black
    
    
    // TODO: d
    @Published var fontColor: Color = .black
    
    
    // TODO: d
    @Published var textAlignment: TextAlignment = .leading
    
    
    /// The currently selected font
    var font: Font {
        Font.custom(selectedFontName, size: fontSize)
            .weight(fontWeight)
    }
    
    
    public var dynamicText: String {
        DynamicText.convert(input: inputText)
    }
    
    
    /// The list of the avaliable fonts
    public static let fontList: [String] = [
        "ModernAge",
        "Autone"
    ]
    
    
    // TODO: !
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    
    

    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), inputText: String = "") {
        self.inputText = inputText
        self.selectedFontName = TextObject.fontList.first!
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .text
    }
    
    
}
