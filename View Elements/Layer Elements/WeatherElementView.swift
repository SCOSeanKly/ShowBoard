//
//  WeatherElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct WeatherElementView: View {
    
    @Binding var showWeatherElementView: Bool
    @Binding var showLayerElementView: Bool
    let weatherIconsArray = ["weather1", "weather2", "weather3", "weather4", "weather5", "weather6"]
    let weatherIconsArraytext = ["Style1", "Style2", "Style3", "Style4", "Style5", "Style6"]
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
 
            ScrollView {
                LayerBackButton(selfViewToClose: $showWeatherElementView, showLayerElementView: $showLayerElementView, headerText: "Weather")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: weatherIconsArray, iconsArraytext: weatherIconsArraytext, viewToClose: $showWeatherElementView)
            }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}



