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
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        
        ScrollView {
            LayerBackButton(selfViewToClose: $showWeatherElementView, viewToOpen: $showAnotherView, showLayerElementView: $showLayerElementView, headerText: "Weather", systemImage: "arrow.left.circle", systemImage2: "")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: weatherIconsArray, iconsArraytext: weatherIconsArraytext, viewToClose: $showWeatherElementView, viewToOpen: $showAnotherView)
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}



