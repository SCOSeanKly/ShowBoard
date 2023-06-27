//
//  MapsElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI


struct MapsElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showMapsElementView: Bool
    
    let mapsIconsArray = ["map"]
    let mapsIconsArraytext = ["Style1"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            VStack{
                
                LayerBackButton(selfViewToClose: $showMapsElementView, showLayerElementView: $showLayerElementView, headerText: "Maps")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: mapsIconsArray, iconsArraytext: mapsIconsArraytext, viewToClose: $showMapsElementView)
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
