//
//  HeartButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/07/2023.
//

import SwiftUI

struct HeartButton: View {
    
    @State private var isPressing: Bool = false
    @State private var showCloseSymbol: Bool = false
    @State private var animateSize: Bool = false
    let cornerRadius: CGFloat
    let onSymbol: String
    let offSymbol: String
    let onColor: Color
    let offColor: Color
    let secondaryColor: Color
    let bindingValue: Binding<Bool>
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
            
            Image(systemName: onSymbol)
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(isPressing ? onColor : offColor)
                .scaleEffect(isPressing ? 6.0 : 1.0)
                .animation(.interpolatingSpring(stiffness: 300, damping: 20), value: isPressing)
            
            
            Image(systemName: offSymbol)
                .resizable()
                .frame(width: 10, height: 10)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(secondaryColor)
                .scaleEffect(showCloseSymbol ? 4.3 : 0.0)
                .opacity(showCloseSymbol ? 1 : 0)
                .animation(.interpolatingSpring(stiffness: 250, damping: 15), value: showCloseSymbol)
             
        }
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .onTapGesture {
            isPressing.toggle()
            showCloseSymbol.toggle()
            animateSize.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animateSize.toggle()
            }
            
            // Add Button Action
            bindingValue.wrappedValue.toggle()
           
        }
        .shadow(radius: animateSize ? 1 : 5, y: animateSize ? 0 : 5)
        .scaleEffect(animateSize ? 0.9 : 1.0)
        .animation(.easeInOut(duration: 0.3), value: animateSize)
    }
}



