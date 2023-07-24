//
//  SettingsButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct SettingsButton: View {
    
    var layerFrameSize: Double = 40
    var cornerRadius: Double = 12
    var systemImage:String = "arrow.up.left.and.arrow.down.right"
    var colour:Color = Color.black
    var lineWidth: Double = 0.3
    var fontSize: Double = 20
    @State private var isPressing: Bool = false
    
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(colour,  lineWidth: lineWidth)
                .frame(width: layerFrameSize, height: layerFrameSize)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.white)
                }
                .shadow(color: Color.black.opacity(0.2), radius: isPressing ? 0.0 : 2.0, x: 0.0, y: isPressing ? 0.0 : 1.0)
                .scaleEffect(isPressing ? 0.9 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(colour,  lineWidth: lineWidth)
                .frame(width: layerFrameSize, height: layerFrameSize)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.ultraThinMaterial)
                }
                .scaleEffect(isPressing ? 0.8 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
            
            Image(systemName: systemImage)
                .font(.system(size: fontSize))
                .foregroundColor(.black)
                .scaleEffect(isPressing ? 0.7 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
        }
    }
}


struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}
