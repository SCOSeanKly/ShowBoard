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
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
  
          ScrollView{
                LayerBackButton(selfViewToClose: $showChartsElementView, showLayerElementView: $showLayerElementView, headerText: "Charts")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: chartsIconsArray, iconsArraytext: chartsIconsArraytext, viewToClose: $showChartsElementView)

            }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
