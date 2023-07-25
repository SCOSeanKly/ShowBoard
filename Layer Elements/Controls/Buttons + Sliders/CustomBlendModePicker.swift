//
//  CustomMenuPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct CustomBlendModePicker: View {
    
    let bindingValue: Binding<BlendMode>
    
    var body: some View {
        HStack {
            Text("Blend Mode:")
                .titleFont()
            Spacer()
            Picker("Blend Mode", selection: bindingValue) {
                ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                    Text(LayerObjectAppearance.labelForBlendMode(mode))
                        .tag(mode)
                }
            }
            .pickerStyle(.menu)
            .scaleEffect(0.8)
            .offset(x: 20)
        }
        .frame(height: 30)
    }
}





