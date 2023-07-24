//
//  CustomToggle.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct CustomToggle: View {
    let titleText: String
    let bindingValue: Binding<Bool>
    let onSymbol: String
    let offSymbol: String
    let rotate: Bool
    @State private var rotationAngle: Angle = .degrees(0)
    
    var body: some View {
        
      
      
            HStack {
                
                Text(titleText)
                    .titleFont()
                
                Spacer()
                
                ZStack {
                    Capsule()
                        .frame(width: 40, height: 24)
                        .foregroundColor(Color(bindingValue.wrappedValue ? .systemGreen : .systemGray))
                        .animation(.easeInOut, value: bindingValue.wrappedValue)
                      
                    
                    LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.1), Color.white.opacity(0.1), Color.white.opacity(0.1)]), startPoint: .top, endPoint: .bottom)
                        .frame(width: 40, height: 24)
                        .cornerRadius(100)
                    
                    ZStack {
                        
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.15), radius: 1, x: 2, y: 2)
                          
                        
                        Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.clear)
                            .background(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.1), .white.opacity(0.1), .white]), startPoint: .top, endPoint: .bottom))
                            .clipShape(Circle())
                         
                        
                        ZStack {
                            Image(systemName: bindingValue.wrappedValue ? onSymbol : offSymbol)
                                .scaleEffect(0.6)
                                .rotationEffect(rotationAngle)
                                .foregroundColor(.white.opacity(0.6))
                                .offset(x: -0.5, y: -0.5)
                            
                            Image(systemName: bindingValue.wrappedValue ? onSymbol : offSymbol)
                                .scaleEffect(0.6)
                                .rotationEffect(rotationAngle)
                                .foregroundColor(.gray.opacity(0.5))
                                .offset(x: 0.5, y: 0.5)
                            
                            Image(systemName: bindingValue.wrappedValue ? onSymbol : offSymbol)
                                .scaleEffect(0.6)
                                .rotationEffect(rotationAngle)
                                .foregroundColor(.black)
                        }
                        .shadow(color: .black.opacity(0.15), radius: 0.2, x: 0.25, y: 1.0)
                        
                    }
                    .offset(x: bindingValue.wrappedValue ? 9 : -9)
                    .scaleEffect(bindingValue.wrappedValue ? 1.0 : 1.0)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 20))
                }
                .onTapGesture {
                    feedback()
                    bindingValue.wrappedValue.toggle()
                    if rotate {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            rotationAngle = bindingValue.wrappedValue ? .degrees(90) : .degrees(0)
                        }
                    }
                    
                }
        }
       
    }
}

struct ToggleView: View {
    
    @State private var toggleTest: Bool = false
    var body: some View {
        CustomToggle(titleText: "Test Toggle View", bindingValue: $toggleTest, onSymbol: "circle", offSymbol: "xmark", rotate: true)
            .padding()
    }
}





