//
//  AdjustmentsView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct LayerElementView: View {
    //MARK: Show other element views
    @Binding var showLayerElementView: Bool
    @Binding var showWeatherElementView: Bool
    @Binding var showTextElementView: Bool
    @Binding var showGaugesElementView: Bool
    @Binding var showChartsElementView: Bool
    @Binding var showShapesElementView: Bool
    @Binding var showCalendarElementView: Bool
    @Binding var showMapsElementView: Bool
    @Binding var showImportImageElementView: Bool
    
    //Arrays
    let sfSybolsArray = ["character.textbox", "barometer", "cloud.sun", "chart.xyaxis.line", "dot.squareshape", "calendar",  "photo.badge.plus", "map"]
    let sySymbolsText = ["Text", "Gauges", "Weather", "Charts", "Shapes", "Calendar", "Image", "Maps"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Binding var pressedButtonObjectIndex: Int?
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(sfSybolsArray.indices, id: \.self) { index in
                        ZStack {
                            VStack {
                                            Image(systemName: sfSybolsArray[index])
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 40, height: 40)
                                                .scaleEffect(pressedButtonObjectIndex == index ? 0.8 : 1)
                                                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: pressedButtonObjectIndex)
                                            
                                            Text(sySymbolsText[index])
                                                .font(.caption)
                                                .foregroundColor(.primary)
                                                .padding(.top, -2)
                                                .frame(width: 60)
                                                .minimumScaleFactor(0.01)
                                                .lineLimit(1)
                                                .scaleEffect(pressedButtonObjectIndex == index ? 0.9 : 1)
                                                .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: pressedButtonObjectIndex)
                                        }
                                         
                                    }
                        .onTapGesture {
                            if pressedButtonObjectIndex == index {
                                pressedButtonObjectIndex = nil
                            } else {
                                pressedButtonObjectIndex = index
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    pressedButtonObjectIndex = nil
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    if sySymbolsText[index] == "Weather" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showWeatherElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Text" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showTextElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Gauges" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showGaugesElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Charts" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showChartsElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Shapes" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showShapesElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Calendar" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showCalendarElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Image" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showImportImageElementView.toggle()
                                        }
                                    }
                                    else if sySymbolsText[index] == "Maps" {
                                        showLayerElementView.toggle()
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            showMapsElementView.toggle()
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(pressedButtonObjectIndex == index ? 0.3 : 0.2),
                                radius: pressedButtonObjectIndex == index ? 1 : 5,
                                x: 0,
                                y: pressedButtonObjectIndex == index ? 0 : 4)
                        .tint(.black)
                        .scaleEffect(pressedButtonObjectIndex == index ? 0.95 : 1)
                        .animation(.easeIn(duration: 0.1), value: pressedButtonObjectIndex)
                    }
                }
                .padding()
                .padding(.top)
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}








