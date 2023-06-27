//
//  ShapesElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI


struct ShapesElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showShapesElementView: Bool
    
    let shapesIconsArray = ["rectangle", "star"]
    let shapesIconsArraytext = ["Glass", "Custom"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
    
            ScrollView{
                LayerBackButton(selfViewToClose: $showShapesElementView, showLayerElementView: $showLayerElementView, headerText: "Shapes")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: shapesIconsArray, iconsArraytext: shapesIconsArraytext, viewToClose: $showShapesElementView)
            }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
