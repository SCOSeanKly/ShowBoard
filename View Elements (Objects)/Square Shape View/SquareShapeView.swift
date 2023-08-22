//
//  SquareShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI


struct SquareShapeView: View {
    
    @StateObject var square = SquareShapeObject()
    @Binding var showMicroControls: Bool
    

    
    var body: some View {
        
      
            ZStack {
                
                RoundedRectangle(cornerRadius: square.appearance.cornerRadius)
                    .fill(
                        LinearGradient(colors: [square.appearance.fillColor, square.appearance.fillColor2], startPoint: .top, endPoint: .bottom)
                       )
            }
            .objectAppearanceModifier(layer: square, systemImageName: "square", systemImage2: "", titleText: "Squared Shape", showMicroControls: $showMicroControls)
      
        
    }
}




