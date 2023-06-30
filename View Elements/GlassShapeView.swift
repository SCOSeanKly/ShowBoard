//
//  GlassShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

struct GlassShapeView: View {
    
    @State private var width: CGFloat = 300
    @State private var height: CGFloat = 150
    @State private var cornerRadius: CGFloat = 20
    @State private var shadowRadius: CGFloat = 0
    @State private var shadowOffset: CGFloat = 0
    
    
    var body: some View {
        
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                
            }
            .frame(width: width,  height: height)
            .shadow(radius: shadowRadius, y: shadowOffset)
            .ignoresSafeArea()
            
            // MARK: Settings for Glass
            VStack {
                
                HStack {
                
                    Spacer()
                    
                    Button {
                        resetValues()
                    }label: {
                        Text("Reset")
                    }
                    
                }
                HStack {
                    Text("Width: ")
                    Slider(value: $width, in: 0...UIScreen.main.bounds.width)
                    Text("\(width, specifier: "%.0f")")
                }
                HStack {
                    Text("Height: ")
                    Slider(value: $height, in: 0...UIScreen.main.bounds.height)
                    Text("\(height, specifier: "%.0f")")
                }
                HStack {
                    Text("Corner Radius: ")
                    Slider(value: $cornerRadius, in: 0...200)
                    Text("\(cornerRadius, specifier: "%.0f")")
                }
                HStack {
                    Text("Shadow Radius: ")
                    Slider(value: $shadowRadius, in: 0...20)
                    Text("\(shadowRadius, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Offset: ")
                    Slider(value: $shadowOffset, in: 0...30)
                    Text("\(shadowOffset, specifier: "%.1f")")
                }
                
            }
            .padding()
            .offset(y: 300)
            .scaleEffect(0.8)
        }
        
    }
    private func resetValues() {
        width = 300
        height = 150
        cornerRadius = 20
        shadowRadius = 0
        shadowOffset = 0
    }
}

struct GlassShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GlassShapeView()
    }
}
