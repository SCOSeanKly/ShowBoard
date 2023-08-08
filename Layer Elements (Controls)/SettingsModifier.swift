//
//  SettingsModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/08/2023.
//

import SwiftUI

extension View {
    func settingsModifier(layer: LayerObject, systemImageName: String, systemImage2: String, titleText: String) -> some View {
        self.modifier(SettingsMod(layer: layer, systemImageName: systemImageName, titletext: titleText))
    }
}


struct SettingsMod: ViewModifier {
    @StateObject var layer: LayerObject
    let systemImageName: String
    let titletext: String
    
    func body(content: Content) -> some View {
        content
            .frame(width: layer.appearance.width, height: layer.appearance.height)
            .cornerRadius(layer.appearance.cornerRadius)
            .rotationEffect(layer.appearance.rotation)
            .blendMode(layer.appearance.blendMode)
            .blur(radius: layer.appearance.blur)
            .if(layer.appearance.invert) { view in
                view.colorInvert()
            }
            .shadow(color: Color.black.opacity(layer.appearance.shadowOpacity), radius: layer.appearance.shadow.radius, x: layer.appearance.shadow.offset.x, y: layer.appearance.shadow.offset.y)
            .opacity(layer.appearance.opacity)
            .animation(.spring())
            .onTapGesture {
                layer.appearance.showSettings.toggle()
            }
            .sheet(isPresented: $layer.appearance.showSettings){
                
                AppearanceControlView(layer: layer, systemImageName: systemImageName, titletext: titletext)
                
            }
    }
}



