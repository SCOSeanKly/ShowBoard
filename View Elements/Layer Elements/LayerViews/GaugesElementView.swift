//
//  GaugesElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct GaugesElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showGaugesElementView: Bool
    let gaugesIconsArray = ["questionmark.circle", "questionmark.circle", "questionmark.circle", "questionmark.circle", "questionmark.circle", "questionmark.circle"]
    let gaugesIconsArraytext = ["Style1", "Style2", "Style3", "Style4", "Style5", "Style6"]
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView{
            LayerBackButton(selfViewToClose: $showGaugesElementView, showLayerElementView: $showLayerElementView, headerText: "Gauges", systemImage: "arrow.left.circle")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: gaugesIconsArray, iconsArraytext: gaugesIconsArraytext, viewToClose: $showGaugesElementView, viewToOpen: $showAnotherView)
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}
