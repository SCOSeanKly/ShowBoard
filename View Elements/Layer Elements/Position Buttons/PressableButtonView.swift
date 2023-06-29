//
//  ActionButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct PressableButtonView: View {
    @State private var isPressing = false
    let systemImage: String
    var buttonAction: () -> Void // Change to closure type
    
    var body: some View {
        Button(action: {
            buttonAction() // Invoke the closure
            isPressing.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
            }
        }) {
            SettingsButton(layerFrameSize: 35, cornerRadius: 10, systemImage: systemImage, colour: .gray, lineWidth: 0.5, fontSize: 15)
                .scaleEffect(isPressing ? 0.8 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
        }
    }
}

