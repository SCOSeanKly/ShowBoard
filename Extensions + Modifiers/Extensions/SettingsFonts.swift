//
//  SettingsFont.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/07/2023.
//

import SwiftUI

struct CustomFontModifier_TitleFontSettings: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 12).weight(.regular))
            .lineLimit(1)
          
    }
}

extension View {
    func titleFont() -> some View {
        self.modifier(CustomFontModifier_TitleFontSettings())
    }
}


struct CustomFontModifier_SpecifierFontSettings: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 10).weight(.semibold))
            .lineLimit(1)
         
    }
}

extension View {
    func specifierFont() -> some View {
        self.modifier(CustomFontModifier_SpecifierFontSettings())
    }
}

