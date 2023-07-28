//
//  ImportImageButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 30/06/2023.
//

import SwiftUI

struct ImportImageButton: View {
    
    let systemImage: String
    let buttontext: String
    @State private var buttonIsPressedAnimation: Bool = false
    @Binding var buttonAction: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var importedImage: UIImage?
    
    var body: some View {
        ZStack {
            VStack {
                if let image = importedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .scaleEffect(buttonIsPressedAnimation ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: buttonIsPressedAnimation)
                        .animation(.spring(), value: importedImage)
                    
                } else {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .scaleEffect(buttonIsPressedAnimation ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: buttonIsPressedAnimation)
                }
                
                Text(buttontext)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 60)
                    .lineLimit(1)
                    .scaleEffect(buttonIsPressedAnimation ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: buttonIsPressedAnimation)
            }
        }
        .onTapGesture {
            buttonIsPressedAnimation.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                buttonIsPressedAnimation.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showImportImageElementView = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonAction.toggle()
                    }
                }
            }
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(buttonIsPressedAnimation ? 0.3 : 0.2), radius: buttonIsPressedAnimation ? 1 : 5, x: 0, y: buttonIsPressedAnimation ? 0 : 4)
       // .tint(.black)
        .scaleEffect(buttonIsPressedAnimation ? 0.95 : 1)
        .animation(.easeIn(duration: 0.1), value: buttonIsPressedAnimation)
    }
}


