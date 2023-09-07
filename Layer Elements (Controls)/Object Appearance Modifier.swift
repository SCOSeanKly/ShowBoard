//
//  SettingsModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/08/2023.
//

import SwiftUI

extension View {
    func objectAppearanceModifier(layer: LayerObject, systemImageName: String, systemImage2: String, titleText: String, showMicroControls: Binding<Bool>) -> some View {
        self.modifier(SettingsMod(layer: layer, systemImageName: systemImageName, titletext: titleText, showMicroControls: showMicroControls))
    }
}


struct SettingsMod: ViewModifier {
    @StateObject var layer: LayerObject
    
    let systemImageName: String
    let titletext: String
    @Binding var showMicroControls: Bool

    
    func body(content: Content) -> some View {
        content
            .frame(width: layer.appearance.width + layer.appearance.scaleWidth, height: layer.appearance.height + layer.appearance.scaleHeight)
            .cornerRadius(layer.appearance.cornerRadius)
            .rotationEffect(layer.appearance.rotation)
            .blur(radius: layer.appearance.blur)
            .if(layer.appearance.invert) { view in
                view.colorInvert()
            }
            .blendMode(layer.appearance.blendMode)
            .shadow(color: Color.black.opacity(layer.appearance.shadowOpacity), radius: layer.appearance.shadow.radius, x: layer.appearance.shadow.offset.x, y: layer.appearance.shadow.offset.y)
            .opacity(layer.appearance.opacity)
            .rotation3DEffect(.degrees(layer.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
            .rotation3DEffect(.degrees(layer.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
            .scaleEffect(layer.appearance.scales.x)
            .scaleEffect(x: layer.appearance.scaleWidth, y: layer.appearance.scaleHeight, anchor: .center)
            .background{
               Rectangle()
                    .fill(Color.white.opacity(0.00001))
            }
            .overlay {
                MarchingAntsBorder(opacity: layer.appearance.showSettings ? 1 : 0) // MARK: Change this to show when selection = obj.id
                    .frame(width: layer.appearance.width + layer.appearance.scaleWidth, height: layer.appearance.height + layer.appearance.scaleHeight)
                    .rotationEffect(layer.appearance.rotation)
            }
            .offset(x: layer.appearance.offsetX, y: layer.appearance.offsetY)
            .onTapGesture {
                layer.appearance.showSettings.toggle()
            }
            .sheet(isPresented: $layer.appearance.showSettings){
                
                AppearanceControlView(layer: layer, systemImageName: systemImageName, titletext: titletext, showMicroControls: $showMicroControls)
                
                
            }
        
      
    }
}





