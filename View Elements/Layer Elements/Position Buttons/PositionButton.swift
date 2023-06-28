//
//  PositionButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct PositionButton: View {
    let stackSpacing: Double = 10
    @State private var isDragging = false
    @State private var microAdjustment: Bool = false
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    
    var body: some View {
        VStack(spacing: stackSpacing) {
            HStack {
                Text("POSITION")
                    .font(.system(size: 10))
                    .textCase(.uppercase)
                    .foregroundColor(.black)
                    .offset(x: 22)
                VStack {
                    Toggle("", isOn: $microAdjustment)
                        .frame(width: 40)
                        .scaleEffect(0.5)
                        .rotationEffect(Angle(degrees: -270))
                    Text("µ")
                        .font(.system(size: 10))
                        .textCase(.uppercase)
                        .foregroundColor(.black)
                        .offset(y: -5)
                }
                .offset(x: 25, y: 32)
            }
            .frame(width: 150, height: 10)
            
            Button(action: {
                offsetY -= 100 // Move up
            }) {
                SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.up", colour: .gray, lineWidth: 0.5, fontSize: 15)
                  
            }
            
            HStack(spacing: stackSpacing) {
                Button(action: {
                    offsetX -= 10 // Move left
                }) {
                    SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.left", colour: .gray, lineWidth: 0.5, fontSize: 15)
                }
                
                Button(action: {
                    // Open layer settings
                }) {
                    SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "wrench.adjustable", colour: .gray, lineWidth: 0.5, fontSize: 15)
                }
                
                Button(action: {
                    offsetX += 10 // Move right
                }) {
                    SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.right", colour: .gray, lineWidth: 0.5, fontSize: 15)
                }
            }
            
            Button(action: {
                offsetY += 10 // Move down
            }) {
                SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.down", colour: .gray, lineWidth: 0.5, fontSize: 15)
            }
        }
        .padding()
        .background(.ultraThinMaterial.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .contentShape(Rectangle())
        .scaleEffect(0.8)
       
    }
}

struct PositionButton_Previews: PreviewProvider {
    static var previews: some View {
        PositionButton(offsetX: .constant(0), offsetY: .constant(0))
    }
}


