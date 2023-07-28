//
//  LayerBackButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//
import SwiftUI

struct LayerBackButton: View {
    
    let selfViewToClose: Binding<Bool>
    let viewToOpen: Binding<Bool>
    let showLayerElementView: Binding<Bool>
    let headerText: String
    let systemImage: String
    let systemImage2: String?
    @State private var isPressingSysImage: Bool = false
    @State private var isPressingSysImage2: Bool = false
    
    var body: some View {
        HStack {
            Button {
                
                isPressingSysImage.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isPressingSysImage.toggle()
                }
                
                selfViewToClose.wrappedValue.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    showLayerElementView.wrappedValue.toggle()
                    
                }
            } label: {
                Image(systemName: systemImage)
                    .font(.title3)
                    .scaleEffect(isPressingSysImage ? 0.8 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressingSysImage)
            }
            
            HStack {
                Text(headerText)
                    .font(.headline.weight(.semibold))
                 
            }
            
            Spacer()
            
            if let systemImage2 = systemImage2 {
                Button {
                    
                    isPressingSysImage2.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        isPressingSysImage2.toggle()
                    }
                    
                    selfViewToClose.wrappedValue.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        viewToOpen.wrappedValue.toggle()
                    }
                    
                } label: {
                    Image(systemName: systemImage2)
                        .font(.title3)
                        .scaleEffect(isPressingSysImage2 ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressingSysImage2)
                    
                }
            }
        }
        .buttonStyle(.plain)
        .padding()
      
    }
}


