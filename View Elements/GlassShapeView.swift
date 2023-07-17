//
//  GlassShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

struct GlassShapeView: View {
        
    @StateObject var shape = CustomShapeObject()
    
    var body: some View {
        
        ZStack {
            ZStack {
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .foregroundColor(.clear)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: shape.appearance.cornerRadius))
                
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                
            }
            .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
            .shadow(
                radius: shape.appearance.shadow.radius,
                x: shape.appearance.shadow.offset.x,
                y: shape.appearance.shadow.offset.y
            )
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
                    Slider(value: $shape.shapeFrameWidth, in: 0...UIScreen.main.bounds.width)
                    Text("\(shape.shapeFrameWidth, specifier: "%.0f")")
                }
                HStack {
                    Text("Height: ")
                    Slider(value: $shape.shapeFrameHeight, in: 0...UIScreen.main.bounds.height)
                    Text("\(shape.shapeFrameHeight, specifier: "%.0f")")
                }
                HStack {
                    Text("Corner Radius: ")
                    Slider(value: $shape.appearance.cornerRadius, in: 0...200)
                    Text("\(shape.appearance.cornerRadius, specifier: "%.0f")")
                }
                HStack {
                    Text("Shadow Radius: ")
                    Slider(value: $shape.appearance.shadow.radius, in: 0...20)
                    Text("\(shape.appearance.shadow.radius, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Offset: ")
                    Slider(value: $shape.appearance.shadow.offset.y, in: 0...30)
                    Text("\(shape.appearance.shadow.offset.y, specifier: "%.1f")")
                }
                
            }
            .padding()
            .offset(y: 250)
            .scaleEffect(0.8)
        }
        
    }
    
     private func resetValues() {
         shape.shapeFrameWidth = 300
         shape.shapeFrameHeight = 150
         shape.appearance.cornerRadius = 20
         shape.appearance.shadow.radius = 0
         shape.appearance.shadow.offset.y = 0
     }
     
}

struct GlassShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GlassShapeView()
    }
}
