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
        ZStack {
            ScrollView {
                HStack {
                    Button {
                        showWeatherElementView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showLayerElementView.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
                
                HStack{
                    Text("Weather")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
       LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: weatherIconsArray, iconsArraytext: weatherIconsArraytext, viewToClose: $showWeatherElementView)
                 
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
/*
struct WeatherElementView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherElementView(showWeatherElementView: .constant(true))
    }
}
 */


