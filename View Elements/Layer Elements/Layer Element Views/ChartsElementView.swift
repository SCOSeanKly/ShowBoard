//
//  ChartsElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct ChartsElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showChartsElementView: Bool
    let chartsIconsArray = ["chart.xyaxis.line", "chart.bar"]
    let chartsIconsArraytext = ["Line", "Bar"]
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView{
            LayerBackButton(selfViewToClose: $showChartsElementView, showLayerElementView: $showLayerElementView, headerText: "Charts", systemImage: "arrow.left.circle")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: chartsIconsArray, iconsArraytext: chartsIconsArraytext, viewToClose: $showChartsElementView, viewToOpen: $showAnotherView)
            
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}
