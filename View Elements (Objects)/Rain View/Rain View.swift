//
//  Rain View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/08/2023.
//

import SwiftUI
import SpriteKit

struct RainView: View {
    
    @StateObject var rain = RainObject()
    @Binding var showMicroControls: Bool
    
    var body: some View {
        ZStack {
            SpriteView(scene: RainFall(),options: [.allowsTransparency])
                .if(rain.appearance.addGaradientMask) { view in
                    view.mask{
                        LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom)
                            .opacity(rain.appearance.addGaradientMask ? 1 : 0)
                    }
                }
            
            SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                .offset(y: rain.appearance.height * 0.99)
                .opacity(rain.appearance.showRainBounce ? 1 : 0)
        }
        .blur(radius: rain.appearance.blur)
        .blendMode(.luminosity)
        .blendMode(rain.appearance.blendMode)
        .objectAppearanceModifier(layer: rain, systemImageName: "cloud.heavyrain", systemImage2: "", titleText: "Live Rain Effect", showMicroControls: $showMicroControls)
    }
}

/*
 self.showRainBounce = showRainBounce
 self.addGaradientMask = showRainBounce
 */
