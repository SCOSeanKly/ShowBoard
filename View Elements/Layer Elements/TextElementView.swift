//
//  TextElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct TextElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showTextElementView: Bool
   
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showTextElementView.toggle()
                        
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
                        
                        showTextElementView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                          //MARK: Add text to view
                        }
                        
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    
                    
                }
                .padding()
                .padding(.horizontal)
                
                DynamicTextView()
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}









