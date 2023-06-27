//
//  ShapesElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI


struct ShapesElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showShapesElementView: Bool
    
    let shapesIconsArray = ["rectangle", "star"]
    let shapesIconsArraytext = ["Glass", "Custom"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showShapesElementView.toggle()
                        
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
                    Text("Shapes")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
      
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: shapesIconsArray, iconsArraytext: shapesIconsArraytext, viewToClose: $showShapesElementView)
                 
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
