//
//  ScaleButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//


    import SwiftUI

    struct ScaleButton: View {
        let stackSpacing: Double = 10
        @State private var isDragging = false
        @State private var microAdjustment: Bool = false
        @Binding var frameWidth: CGFloat
        @Binding var frameHeight: CGFloat
        
        var body: some View {
            VStack(spacing: stackSpacing) {
                HStack {
                    Text("SCALE")
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
                    frameHeight -= 100 // Increase height
                }) {
                    SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.up", colour: .gray, lineWidth: 0.5, fontSize: 15)
                      
                }
                
                HStack(spacing: stackSpacing) {
                    Button(action: {
                        frameWidth -= 10 // Decrease Width
                    }) {
                        SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.left", colour: .gray, lineWidth: 0.5, fontSize: 15)
                    }
                    
                    Button(action: {
                        // Open layer settings
                    }) {
                        SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "wrench.adjustable", colour: .gray, lineWidth: 0.5, fontSize: 15)
                    }
                    
                    Button(action: {
                        frameWidth += 10 // Increase Width
                    }) {
                        SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: "arrow.right", colour: .gray, lineWidth: 0.5, fontSize: 15)
                    }
                }
                
                Button(action: {
                    frameHeight += 10 // Decrease height
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

    struct ScaleButton_Previews: PreviewProvider {
        static var previews: some View {
            ScaleButton(frameWidth: .constant(0), frameHeight: .constant(0))
        }
    }



