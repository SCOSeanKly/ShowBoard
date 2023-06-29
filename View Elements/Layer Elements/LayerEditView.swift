//
//  LayerEditView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/06/2023.
//

import SwiftUI

struct LayerEditView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showLayerEditView: Bool
    @State private var isEditing = false
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showLayerEditView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showLayerElementView.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    Spacer()
                    Button {
                        
                        isEditing.toggle()
                        
                    } label: {
                        Image(systemName: isEditing ? "xmark.circle" : "ellipsis.circle")
                            .font(.title)
                            .tint(.black)
                    }
                }
                .padding()
                .padding(.horizontal)
                
                HStack{
                    Text("Edit Layers")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                LayerItems(isEditing: $isEditing)
            }
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}

