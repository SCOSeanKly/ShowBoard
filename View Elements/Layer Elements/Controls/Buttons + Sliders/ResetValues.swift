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
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                isShowingConfirmationAlert = true
            })
            {
                HStack {
                    Text("\(Image(systemName: "arrow.counterclockwise"))")
                        .font(.system(size: 14).weight(.semibold))
                        .rotationEffect(rotationAngle)
                        .animation(isResetConfirmed ? .easeInOut(duration: 0.0) : .easeInOut(duration: 0.5), value: rotationAngle)
                        .scaleEffect(0.75)
                    
                    Text("Reset")
                        .font(.system(size: 14).weight(.semibold))
                }
            }
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



