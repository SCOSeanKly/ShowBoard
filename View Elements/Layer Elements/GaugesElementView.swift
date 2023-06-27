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
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            VStack{
                
                LayerBackButton(selfViewToClose: $showGaugesElementView, showLayerElementView: $showLayerElementView, headerText: "Gauges")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: gaugesIconsArray, iconsArraytext: gaugesIconsArraytext, viewToClose: $showGaugesElementView)
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
