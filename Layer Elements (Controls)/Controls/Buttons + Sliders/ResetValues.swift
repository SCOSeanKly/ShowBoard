//
//  ResetValues.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct ResetValues: View {
    
    let resetValues: () -> Void
    @State private var rotationAngle: Angle = .degrees(0)
    @State private var isResetConfirmed: Bool = false
    
    @State private var isShowingConfirmationAlert = false
    @Binding var showMicroControls: Bool
    
    let systemImageName: String
    let titleText: String
    
    var body: some View {
        
        
        VStack {
            
            Divider()
                .padding(.horizontal)
            
            HStack {
                
                Image(systemName: systemImageName)
                    .font(.title3)
                
                Text(titleText)
                    .font(.headline.weight(.semibold))
                
                Spacer()
                
                Button {
                    showMicroControls.toggle()
                } label: {
                    Text("\(Image(systemName: "arrow.up.and.down.and.arrow.left.and.right"))")
                }
                .padding(.trailing)
                
                Button(action: {
                    feedback()
                    isShowingConfirmationAlert = true
                })
                {
                    
                    Text("\(Image(systemName: "arrow.counterclockwise"))")
                        .font(.system(size: 14).weight(.semibold))
                        .rotationEffect(rotationAngle)
                        .animation(isResetConfirmed ? .easeInOut(duration: 0.0) : .easeInOut(duration: 0.5), value: rotationAngle)
                    
                }
                
            }
            .padding(.horizontal)
            .padding(.vertical)
            .alert(isPresented: $isShowingConfirmationAlert) {
                Alert(
                    title: Text("Confirmation"),
                    message: Text("Are you sure you want to reset values?"),
                    primaryButton: .destructive(Text("Reset"), action: {
                        
                        resetValues()
                        rotationAngle = .degrees(360)
                        isResetConfirmed.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                            isResetConfirmed.toggle()
                            rotationAngle = .degrees(0)
                        }
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
            
            
            
        }
    }
}



