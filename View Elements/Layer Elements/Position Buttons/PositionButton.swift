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
    
    var offsetValue: CGFloat {
        return microAdjustment ? 0.5 : 2
    }
    
    func resetValues() {
        offsetX = 0
        offsetY = 0
    }
    
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
                        .foregroundColor(.black)
                        .offset(y: -5)
                }
                .offset(x: 17, y: 32)
            }
            .frame(width: 150, height: 10)
            
            
            PressableButtonView(systemImage: "arrow.up") {
                offsetY -= offsetValue
            }
            HStack(spacing: stackSpacing) {
                
                PressableButtonView(systemImage: "arrow.left") {
                    offsetX -= offsetValue
                }
                PressableButtonView(systemImage: "arrow.counterclockwise") {
                    resetValues() 
                }
                PressableButtonView(systemImage: "arrow.right") {
                    offsetX += offsetValue
                }
            }
            PressableButtonView(systemImage: "arrow.down") {
                offsetY += offsetValue
            }
        }
        .scaleEffect(0.9)
        
    }
}




