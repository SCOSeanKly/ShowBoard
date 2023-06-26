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
    
    let mapsIconsArray = ["", "", "", "", "", ""]
    let mapsIconsArraytext = ["Style1", "Style2", "Style3", "Style4", "Style5", "Style6"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showMapsElementView.toggle()
                        
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
                    Text("Maps")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(mapsIconsArray.indices, id: \.self) { index in
                        ZStack {
                            
                            VStack {
                                    Image(mapsIconsArray[index])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .scaleEffect(pressedButtonIndex == index ? 0.8 : 1)
                                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: pressedButtonIndex)
                                    
                                    Text(mapsIconsArraytext[index])
                                        .font(.caption)
                                        .foregroundColor(.primary)
                                        .padding(.top, -2)
                                        .frame(width: 60)
                                        .lineLimit(1)
                                        .scaleEffect(pressedButtonIndex == index ? 0.9 : 1)
                                        .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: pressedButtonIndex)
                                }
                            }
                        .onTapGesture {
                            if pressedButtonIndex == index {
                                pressedButtonIndex = nil
                            } else {
                                pressedButtonIndex = index
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    pressedButtonIndex = nil
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    
                                    showMapsElementView.toggle()
                                    
                                }
                            }
                        }
                        .padding(10)
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(pressedButtonIndex == index ? 0.3 : 0.2), radius: pressedButtonIndex == index ? 1 : 5, x: 0, y: pressedButtonIndex == index ? 0 : 4)
                        .tint(.black)
                        .scaleEffect(pressedButtonIndex == index ? 0.95 : 1)
                        .animation(.easeIn(duration: 0.1), value: pressedButtonIndex)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
