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
    
    let textIconsArray = ["character.textbox", "character.textbox", "character.textbox", "character.textbox", "character.textbox", "character.textbox", "character.textbox", "character.textbox", "character.textbox"]
    let textIconsArraytext = ["Custom1", "Custom2", "Custom3", "Custom4", "Custom5", "Custom6", "Custom7", "Custom8", "Custom9"]
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView{
            LayerBackButton(selfViewToClose: $showTextElementView, showLayerElementView: $showLayerElementView, headerText: "Dynamic Text", systemImage: "arrow.left.circle")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: textIconsArray, iconsArraytext: textIconsArraytext, viewToClose: $showTextElementView, viewToOpen: $showLayerElementView)
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}
