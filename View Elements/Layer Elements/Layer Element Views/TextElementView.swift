//
//  TextElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct TextElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showTextElementView: Bool
    
    @State private var openNoView: Bool = false
    
    let textIconsArray = ["character.textbox"]
    let textIconsArraytext = ["Custom1"]
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView{
            LayerBackButton(selfViewToClose: $showTextElementView, showLayerElementView: $showLayerElementView, headerText: "Dynamic Text", systemImage: "arrow.left.circle")
            
            /// Edit this $showLayerElementView to open the correct view - Dynamic Text Edit View
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: textIconsArray, iconsArraytext: textIconsArraytext, viewToClose: $showTextElementView, viewToOpen: $openNoView)
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}
