//
//  LayerObjectAppearanceModifier.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.06.23.
//

import SwiftUI


struct LayerObjectAppearanceModifier: ViewModifier {
    
    var layerObject: LayerObject
    
    func body(content: Content) -> some View {
        content
            .blendMode(layerObject.appearance.blendMode)
            .rotationEffect(layerObject.appearance.rotation)
            .shadow(
                radius: layerObject.appearance.shadow.radius,
                x: layerObject.appearance.shadow.offset.x,
                y: layerObject.appearance.shadow.offset.y
            )
            .blendMode(layerObject.appearance.blendMode)
            .rotationEffect(layerObject.appearance.rotation)
            .opacity(layerObject.appearance.opacity)
            .blur(radius: layerObject.appearance.blur)
        
            
    }
}



extension View {
    func appearance(_ layerObject: LayerObject) -> some View {
        modifier(LayerObjectAppearanceModifier(layerObject: layerObject))
    }
}