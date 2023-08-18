//
//  TextObject.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


class TextObject: LayerObject {
    
    
    // MARK: - Public Properties

    
  
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
    //    "Freedom45"
        
    ]
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {
         
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .text
        }
}
