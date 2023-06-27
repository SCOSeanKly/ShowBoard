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
            ZStack {
                VStack{
                    HStack {
                        Button {
                            
                            showChartsElementView.toggle()
                            
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
                        Text("Weather Charts")
                            .font(.headline.weight(.heavy))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.horizontal)
            
                    
                    LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: chartsIconsArray, iconsArraytext: chartsIconsArraytext, viewToClose: $showChartsElementView)
                     
                    
                    Spacer()
                }
            }
            .presentationDetents([.fraction(0.4)])
            .presentationDragIndicator(.visible)
        }
    }
