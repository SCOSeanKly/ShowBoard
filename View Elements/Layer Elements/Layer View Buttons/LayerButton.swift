//
//  LayerButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//
import SwiftUI

struct LayerButton: View {
    
    let pressedButtonIndex: Binding<Int?>
    let iconsArray: [String]
    let iconsArraytext: [String]
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let viewToClose: Binding<Bool>
    let viewToOpen: Binding<Bool>
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 16) {
            ForEach(iconsArray.indices, id: \.self) { index in
                
                ZStack {
                    VStack {
                        ZStack {
                            Image(systemName: iconsArray[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .scaleEffect(pressedButtonIndex.wrappedValue == index ? 0.8 : 1)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: pressedButtonIndex.wrappedValue)
                            
                            Image(iconsArray[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .scaleEffect(pressedButtonIndex.wrappedValue == index ? 0.8 : 1)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: pressedButtonIndex.wrappedValue)
                        }
                        
                        Text(iconsArraytext[index])
                            .font(.caption)
                            .foregroundColor(.primary)
                            .padding(.top, -2)
                            .frame(width: 60)
                            .minimumScaleFactor(0.01)
                            .lineLimit(1)
                            .scaleEffect(pressedButtonIndex.wrappedValue == index ? 0.9 : 1)
                            .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: pressedButtonIndex.wrappedValue)
                    }
                }
                
                .onTapGesture {
                    if pressedButtonIndex.wrappedValue == index {
                        pressedButtonIndex.wrappedValue = nil
                    } else {
                        pressedButtonIndex.wrappedValue = index
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            pressedButtonIndex.wrappedValue = nil
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            viewToClose.wrappedValue.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            viewToOpen.wrappedValue.toggle()
                        }
                    }
                }
                .padding(10)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(pressedButtonIndex.wrappedValue == index ? 0.3 : 0.2), radius: pressedButtonIndex.wrappedValue == index ? 1 : 5, x: 0, y: pressedButtonIndex.wrappedValue == index ? 0 : 4)
                .tint(.black)
                .scaleEffect(pressedButtonIndex.wrappedValue == index ? 0.95 : 1)
                .animation(.easeIn(duration: 0.1), value: pressedButtonIndex.wrappedValue)
            }
        }
        .padding(.horizontal)
    }
}


