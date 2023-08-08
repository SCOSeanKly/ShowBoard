//
//  ImageTrashButtonView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ImageTrashButtonView: View {
    
    @Binding var importedImage: UIImage?
    @State private var showAlert = false
    @State private var isPressing: Bool = false
    
    var body: some View {
        HStack {
            if importedImage != nil {
                HStack {
                    
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    
                    
                        .foregroundColor(.red)
                        .padding(5)
                        .background{
                            Circle()
                                .foregroundColor(.white)
                                .shadow(radius: 2, y: 1.5)
                        }
                        .scaleEffect(isPressing ? 0.0 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 50), value: isPressing)
                        .onTapGesture(count: 1) {
                            
                            isPressing.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressing.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                showAlert = true
                            }
                            
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Confirmation"),
                                message: Text("Are you sure you want to delete the image?"),
                                primaryButton: .cancel(Text("Cancel")),
                                secondaryButton: .destructive(Text("Delete")) {
                                    
                                    importedImage = nil
                                    
                                }
                            )
                        }
                        .offset(x: 28, y: -32)
                }
            }
        }
    }
}
