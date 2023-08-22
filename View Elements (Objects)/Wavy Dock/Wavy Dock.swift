//
//  wave.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

struct WavyDock: Shape {
    
    @StateObject var wavyD:  WavyDockObject
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: 0, y: height * 0.5)
        
        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/wavyD.appearance.xAngle) * width * wavyD.graphWidth
            let y = origin.y - CGFloat(sin(angle/180 * Double.pi)) * height * wavyD.appearance.amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        return path
    }
}

struct WavyDockView: View {
    @StateObject private var wavyD = WavyDockObject()
    @State private var showSettings: Bool = false
    @Binding var showMicroControls: Bool
    
    
    var body: some View {
        ZStack {
         
                WavyDock(wavyD: wavyD)
                .fill(
                    LinearGradient(colors: [wavyD.appearance.fillColor, wavyD.appearance.fillColor2], startPoint: .top, endPoint: .bottom)
                   )
                    .objectAppearanceModifier(layer: wavyD, systemImageName: "alternatingcurrent", systemImage2: "", titleText: "Wavy Dock", showMicroControls: $showMicroControls)
        }
    
    }
}


