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
    @Published var fontColor: Color = .white
    
    
    // TODO: d
    @Published var textAlignment: TextAlignment = .leading
    
    
    /// The currently selected font
    var font: Font {
        Font.custom(selectedFontName, size: fontSize)
            .weight(fontWeight)
    }
    
    
    @MainActor public func dynamicText(wk: WeatherKitManager) -> String {
        DynamicText.convert(input: inputText, wk: wk)
    }
    
    
    /// The list of the avaliable fonts
    public static let fontList: [String] = [
        "ModernAge",
        "Autone",
        "RobotoCondensed-Regular",
        "AlfaSlabOne-Regular",
        "AmaticSC-Regular",
        "BebasNeue-Regular",
        "Codystar-Regular",
        "FugazOne-Regular",
        "LibreBarcode39Text-Regular",
        "Megrim-Regular",
        "Monoton-Regular",
        "NixieOne-Regular",
        "Quicksand-VariableFont_wght",
        "Rajdhani-Medium",
        "RobotoMono-VariableFont_wght",
        "ShadowsIntoLight-Regular",
        "Shalimar-Regular",
        "SourceCodePro-VariableFont_wght",
        "YsabeauSC-VariableFont_wght"
        
    ]
    
    
    // TODO: !
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), inputText: String? = nil) {
            self.selectedFontName = TextObject.fontList.first!
            
            if let inputText = inputText {
                self.inputText = inputText
            } else {
                // Randomly select initial text from a list of 5 options
                let randomIndex = Int.random(in: 0..<4)
                self.inputText = ["Enter text...", "Change this text...", "ShowBoard", "Show Creative"][randomIndex]
            }
            
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .text
        }
}
