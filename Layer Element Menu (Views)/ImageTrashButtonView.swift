//
//  ImageTrashButtonView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ImageTrashButtonView: View {
   
    @State var buttonIsPressedAlert: Bool = false
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
                        .scaleEffect(isPressing ? 0.0 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 50), value: isPressing)
                        .scaleEffect(buttonIsPressedAlert ? 0.8 : 1)
                    //    .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: buttonIsPressedAlert)
                        .foregroundColor(.red)
                        .padding(5)
                        .background{
                            Circle()
                                .foregroundColor(.white)
                        }
                        .onTapGesture(count: 1) {
                            
                            isPressing.toggle()
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressing.toggle()
                            }
                            
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
                                  
                                        importedImage = nil
                                    
                                }
                            )
                        }
                        .offset(x: 28, y: -32)
                        .shadow(radius: 2, y: 1.5)
                }
            }
        }
    }
}
/*
 .onTapGesture {
     isPressing.toggle()
     
     DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
         isPressing.toggle()
         
         
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
             showLayerElementView = false
             
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                 buttonAction.toggle()
             }
             
         }
         
     }
 }
 */
