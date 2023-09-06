//
//  StrokeShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 06/09/2023.
//

import SwiftUI


struct StrokeShapeView: View {
    
    @StateObject var stroke = StrokeShapeObject()
    @Binding var showMicroControls: Bool
    
    
    
    var body: some View {
        
        
        ZStack {
            
           
            if stroke.appearance.strokeDash == 0 {
                RoundedRectangle(cornerRadius: stroke.appearance.cornerRadius)
                    .stroke(LinearGradient(gradient: Gradient(stops: [
                        .init(color: stroke.appearance.fillColor, location: 0),
                        .init(color: stroke.appearance.fillColor2, location: 1)
                    ]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: stroke.appearance.strokeWidth))
            } else {
                RoundedRectangle(cornerRadius: stroke.appearance.cornerRadius)
                    .stroke(LinearGradient(gradient: Gradient(stops: [
                        .init(color: stroke.appearance.fillColor, location: 0),
                        .init(color: stroke.appearance.fillColor2, location: 1)
                    ]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: stroke.appearance.strokeWidth, dash: [stroke.appearance.strokeDash], dashPhase: 0.0))
            }

              
              
           
        }
        .objectAppearanceModifier(layer: stroke, systemImageName: "square.dashed", systemImage2: "", titleText: "Stroke Shape", showMicroControls: $showMicroControls)
        
        
    }
}
