//
//  MarchingAntsBorder.swift
//  ShowBoard
//
//  Created by Sean Kelly on 31/07/2023.
//

import SwiftUI

struct MarchingAntsBorder: View {
    @State private var phase = 0.0
    let opacity: CGFloat
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5], dashPhase: phase))
                .foregroundColor(.black.opacity(0.5))
                .offset(x: 0.5, y:0.5)
             
            /*
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(lineWidth: 1)
                .foregroundColor(.black)
             */
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5], dashPhase: phase))
                .foregroundColor(.white)
        }
        .opacity(opacity)
            .onAppear {
                withAnimation(.linear.repeatForever(autoreverses: false)) {
                    phase -= 20
                    
                }
            }
    }
}
