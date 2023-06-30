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
    let systemImage: String
    
    var body: some View {
        
        
        HStack {
            Button {
                
                selfViewToClose.wrappedValue.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLayerElementView.wrappedValue.toggle()
                }
                
            } label: {
                Image(systemName: systemImage)
                    .font(.title3)
                    .tint(.black)
            }
            
            HStack{
                Text(headerText)
                    .font(.headline.weight(.heavy))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            
            Spacer()
          
        }
        .padding()
        .padding(.horizontal)
    
    }
}

