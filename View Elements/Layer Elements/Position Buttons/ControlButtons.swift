//
//  ControlButtons.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct ControlButtons: View {
    
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    @Binding var frameWidth: CGFloat
    @Binding var frameHeight: CGFloat
   
    var body: some View {
        HStack(spacing: 5){
            PositionButton(offsetX: $offsetX, offsetY: $offsetY)
            ScaleButton(frameWidth: $frameWidth, frameHeight: $frameHeight)
        }
        .padding()
        .contentShape(Rectangle())
        
        
    }
}
