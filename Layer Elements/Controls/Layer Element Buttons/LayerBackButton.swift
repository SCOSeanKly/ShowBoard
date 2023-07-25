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
    
    var body: some View {
        HStack {
            Button {
                selfViewToClose.wrappedValue.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    showLayerElementView.wrappedValue.toggle()
                }
            } label: {
                Image(systemName: systemImage)
                    .font(.title3)
                  //  .tint(.black)
            }
            
            HStack {
                Text(headerText)
                    .font(.headline.weight(.heavy))
                    .fontWeight(.semibold)
                 //   .foregroundColor(.black)
            }
            
            Spacer()
            
            if let systemImage2 = systemImage2 {
                Button {
                    selfViewToClose.wrappedValue.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        viewToOpen.wrappedValue.toggle()
                    }
                } label: {
                    Image(systemName: systemImage2)
                        .font(.title3)
                      //  .tint(.black)
                }
            }
        }
        .buttonStyle(.plain)
        .padding(.vertical)
      
    }
}


