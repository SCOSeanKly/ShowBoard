//
//  LayerBackButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

struct LayerBackButton: View {
    
    let selfViewToClose: Binding<Bool>
    let showLayerElementView: Binding<Bool>
    let headerText: String
    
    var body: some View {
        HStack {
            Button {
                
                selfViewToClose.wrappedValue.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLayerElementView.wrappedValue.toggle()
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
            Text(headerText)
                .font(.headline.weight(.heavy))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.horizontal)
    }
}

