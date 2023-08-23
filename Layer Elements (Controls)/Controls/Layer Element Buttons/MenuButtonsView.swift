//
//  MenuButtonsView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct MenuButtonsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    @Binding var hideMenuButtons: Bool
    @Binding var showClipboardAlert: Bool
    @Binding var showAdjustmentsView: Bool
    @Binding var showLayerEditView: Bool
    @Binding var showMicroContols: Bool
    
    @State private var numberOfShakes: CGFloat = 0
    @State private var isPressing: Bool = false
    @State private var isPressingLayers: Bool = false
    @State private var isPressingExport: Bool = false
    
    @Binding var placedObjects: [LayerObject]
    
    
    var body: some View {
        Group {
            ZStack {
                VStack {
                    HStack {
                        microControlsButton()
                        Spacer()
                        
                        layersButton()
                        
                        clipboardButton()
                        
                    }
                    Spacer()
                }
                .padding()
                .padding(.top)
                .opacity(hideMenuButtons ? 0.0 : 1.0)
            }
        }
    }
    
    private func microControlsButton() -> some View {
        Image(systemName: showMicroContols ? "arrow.up.and.down.and.arrow.left.and.right" : "square.grid.2x2")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .shadow(radius: 5)
            .contentShape(Circle())
            .scaleEffect(isPressing ? 0.8 : 1)
            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
            .onTapGesture(count: 2) {
                showMicroContols.toggle()
            }
            .onTapGesture {
                handleMicroControlsTap()
            }
    }
    
    private func handleMicroControlsTap() {
        isPressing.toggle()
        
        if !showMicroContols {
            showAdjustmentsView.toggle()
        } else {
            showMicroContols.toggle()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            isPressing.toggle()
        }
    }
    
    private func layersButton() -> some View {
        
        HStack (spacing: -15){
            if placedObjects.count >= 1 {
                Text("\(placedObjects.count)")
                    .font(.footnote)
                    .foregroundColor(.black)
                    .padding(.vertical, 1)
                    .padding(.horizontal, 5)
                    .background{
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(.white)
                    }
                    .offset(x: -4)
                  
            }
            
            Image(systemName: "square.3.layers.3d.top.filled")
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .contentShape(Circle())
        }
        .shadow(radius: 5)
        .offset(y: 2)
        .scaleEffect(isPressingLayers ? 0.8 : 1)
        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressingLayers)
        .onTapGesture {
            showLayerEditView.toggle()
            isPressingLayers.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressingLayers.toggle()
            }
        }
        .offset(x: 15)
        .transition(.opacity)
    }
    
    private func clipboardButton() -> some View {
        Image(systemName: "square.and.arrow.up")
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .shadow(radius: 5)
            .contentShape(Circle())
            .onTapGesture {
                
                hideMenuButtons = true
                
                performDelayedAction(after: 0.2) {
                    copyImageToClipboard()
                    
                    performDelayedAction(after: 0.2) {
                        showClipboardAlert = true
                    }
                    
                    performDelayedAction(after: 0.2) {
                        hideMenuButtons = false
                    }
                }  
            }
            .disabled(placedObjects.count == 0)
            .opacity(placedObjects.count == 0 ? 0.5 : 1)
    }
    
}
