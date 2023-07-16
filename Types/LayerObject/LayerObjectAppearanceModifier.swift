//
//  LayerObjectAppearanceModifier.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.06.23.
//

import SwiftUI


struct LayerObjectAppearanceModifier: ViewModifier {
    
    var layerObject: any LayerObject
    
    func body(content: Content) -> some View {
        content
            .blendMode(layerObject.appearance.blendMode)
            .rotationEffect(layerObject.appearance.rotation)
            .shadow(
                radius: layerObject.appearance.shadow.radius,
                x: layerObject.appearance.shadow.offset.x,
                y: layerObject.appearance.shadow.offset.y
            )
            
    }
}



extension View {
    func appearance(_ layerObject: any LayerObject) -> some View {
        modifier(LayerObjectAppearanceModifier(layerObject: layerObject))
    }
}
