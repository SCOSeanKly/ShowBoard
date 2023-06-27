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
                HStack {
                    Button {
                        
                        showGaugesElementView.toggle()
                        
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
                    Text("Gauges")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
          LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: gaugesIconsArray, iconsArraytext: gaugesIconsArraytext, viewToClose: $showGaugesElementView)
                
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
