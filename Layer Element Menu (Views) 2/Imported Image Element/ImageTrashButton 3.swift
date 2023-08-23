//
//  ImageTrashButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/06/2023.
//

import SwiftUI

struct ImageTrashButtonView: View {
    @Binding var buttonIsPressedAnimation: Bool
    @Binding var settingButtonIsPressedAnimation: Bool
    @State var buttonIsPressedAlert: Bool = false
    @Binding var importedImage: UIImage?
    @State private var showAlert = false
    
    var body: some View {
        HStack {
            if importedImage != nil {
                HStack {
                    
                    Image(systemName: "gearshape")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .scaleEffect(settingButtonIsPressedAnimation ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: settingButtonIsPressedAnimation)
                        .scaleEffect(buttonIsPressedAnimation ? 0.0 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 50), value: buttonIsPressedAnimation)
                        .offset(y: 70)
                        .onTapGesture {
                            settingButtonIsPressedAnimation.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                settingButtonIsPressedAnimation.toggle()
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    // Close view and show settings
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        // Button action
                                    }
                                }
                            }
                        }
                    
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .scaleEffect(buttonIsPressedAnimation ? 0.0 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 50), value: buttonIsPressedAnimation)
                        .scaleEffect(buttonIsPressedAlert ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: buttonIsPressedAlert)
                        .foregroundColor(.red)
                        .offset(y: 70)
                        .onTapGesture(count: 1) {
                            buttonIsPressedAlert = true
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                buttonIsPressedAlert.toggle()
                            }
                            showAlert = true
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Confirmation"),
                                message: Text("Are you sure you want to delete the image?"),
                                primaryButton: .cancel(Text("Cancel")),
                                secondaryButton: .destructive(Text("Delete")) {
                                    buttonIsPressedAnimation.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        importedImage = nil
                                    }
                                }
                            )
                        }
                }
            }
        }
    }
}
