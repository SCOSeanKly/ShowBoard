//
//  ControlButtons.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MicroControlsView: View {
    
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    @Binding var widthRatio: CGFloat
    @Binding var heightRatio: CGFloat
    @Binding var showMicroControls: Bool
    
    var body: some View {
        
        HStack(spacing: 5){
            PositionButton(offsetX: $offsetX, offsetY: $offsetY)
            ScaleButton(widthRatio: $widthRatio, heightRatio: $heightRatio)
        }
        .padding()
        .background{
            TransparentBlurView(removeAllFilters: true)
                .blur(radius: 10, opaque: true)
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contentShape(Rectangle())
        .offset(y: showMicroControls ? 0 : UIScreen.main.bounds.height)
        .animation(.easeInOut, value: showMicroControls)
        .shadow(radius: 2)
        .modifier(VerticalDragModifier())
    }
}
