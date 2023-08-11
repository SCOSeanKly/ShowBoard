//
//  SquareShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI


struct SquareShapeView: View {
    
    @StateObject var square = SquareShapeObject()

    
    var body: some View {
        
      
            ZStack {
                
                RoundedRectangle(cornerRadius: square.appearance.cornerRadius)
                    .foregroundColor(square.appearance.fillColor)
            }
            .objectAppearanceModifier(layer: square, systemImageName: "square", systemImage2: "", titleText: "Square Shape Object")
      
        
    }
}




