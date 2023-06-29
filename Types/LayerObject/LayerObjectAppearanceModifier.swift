//
//  LayerObjectAppearanceModifier.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.06.23.
//

import SwiftUI


struct LayerObjectAppearanceModifier: ViewModifier {
    
    var appearance: LayerObjectAppearance
    
    func body(content: Content) -> some View {
        content
            .blendMode(appearance.blendMode)
            .rotationEffect(appearance.rotation)
            .shadow(
                radius: appearance.shadow.radius,
                x: appearance.shadow.offset.x,
                y: appearance.shadow.offset.y
            )
    }
}



extension View {
    func appearance(_ appearance: LayerObjectAppearance) -> some View {
        modifier(LayerObjectAppearanceModifier(appearance: appearance))
    }
}
