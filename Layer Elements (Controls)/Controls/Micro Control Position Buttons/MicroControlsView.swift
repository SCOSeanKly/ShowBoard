//
//  ControlButtons.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MicroControlsView: View {
    @StateObject var micro: MicroControls
    @Binding var showMicroControls: Bool
    
    var body: some View {
        
        HStack(spacing: 5){
            PositionButton(micro: micro)
            ScaleButton(micro: micro)
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
