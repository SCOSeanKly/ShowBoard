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
    
    @State private var currentImageIndex = 0
    private let images = ["square.3.layers.3d.top.filled", "square.3.layers.3d.middle.filled", "square.3.layers.3d.bottom.filled"]
    
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
        .onAppear {
            startImageTimer()
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
        Image(systemName: images[currentImageIndex])
            .font(.title2)
            .foregroundColor(.white)
            .padding()
            .shadow(radius: 5)
            .contentShape(Circle())
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
            .id(currentImageIndex)
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
                }
                performDelayedAction(after: 0.2) {
                    showClipboardAlert = true
                }
                performDelayedAction(after: 0.2) {
                    hideMenuButtons = false
                }
            }
    }
    
    private func startImageTimer() {
        Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { timer in
            withAnimation {
                currentImageIndex = (currentImageIndex + 1) % images.count
            }
        }
    }
}

struct MenuButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
    }
}
