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
    @Binding var widthRatio: CGFloat
    @Binding var heightRatio: CGFloat
    
    var scaleValue: CGFloat {
        return microAdjustment ? 0.001 : 0.01
    }
    
    func resetValues() {
        widthRatio = 1
        heightRatio = 1
    }
    
    var body: some View {
        VStack(spacing: stackSpacing) {
            HStack {
                Text("SCALE")
                    .font(.system(size: 10))
                    .textCase(.uppercase)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal)
                    .background(.white.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 50))
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
                .offset(x: 25, y: 32)
            }
            .frame(width: 150, height: 10)
            
            PressableButtonView(systemImage: "plus") {
                heightRatio += scaleValue
            }
            HStack(spacing: stackSpacing) {
                
                PressableButtonView(systemImage: "minus") {
                    widthRatio -= scaleValue
                }
                PressableButtonView(systemImage: "arrow.counterclockwise") {
                    resetValues()
                }
                PressableButtonView(systemImage: "plus") {
                    widthRatio += scaleValue
                }
            }
            PressableButtonView(systemImage: "minus") {
                heightRatio -= scaleValue
            }
        }
        .scaleEffect(0.9)
    }
}
