//
//  GlassShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI


struct GlassShapeView: View {
    
    @StateObject var glass = GlassObject()
    @Binding var showMicroControls: Bool
    

    
    var body: some View {
        
      
            ZStack {
                RoundedRectangle(cornerRadius: glass.appearance.cornerRadius)
                    .foregroundColor(.clear)
                    .background {
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: glass.appearance.glassBlur, opaque: true)
                            .background(.white.opacity(0.05))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: glass.appearance.cornerRadius))
                
                if glass.appearance.shapeGrain {
                    Image("grain")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: glass.appearance.cornerRadius))
                        .blendMode(.multiply)
                        .opacity(0.3)
                }
                
                if glass.appearance.showBorder {
                    RoundedRectangle(cornerRadius: glass.appearance.cornerRadius)
                        .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.9), Color.white.opacity(0.2), Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3), Color.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: glass.appearance.borderWidth)
                }
                
            }
            .objectAppearanceModifier(layer: glass, systemImageName: "bubbles.and.sparkles", systemImage2: "", titleText: "Glass Object", showMicroControls: $showMicroControls)
      
        
    }
}



