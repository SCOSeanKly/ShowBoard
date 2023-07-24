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
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView{
            LayerBackButton(selfViewToClose: $showShapesElementView, viewToOpen: $showAnotherView, showLayerElementView: $showLayerElementView, headerText: "Shapes", systemImage: "arrow.left.circle", systemImage2: "")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: shapesIconsArray, iconsArraytext: shapesIconsArraytext, viewToClose: $showShapesElementView, viewToOpen: $showAnotherView)
        }
        .presentationDragIndicator(.visible)
    }
}
