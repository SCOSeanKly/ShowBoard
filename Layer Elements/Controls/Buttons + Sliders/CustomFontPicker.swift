//
//  CustomFontPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct CustomFontPicker: View {
    @Binding var bindingValue: String
    
    var body: some View {
        HStack {
            Text("Font Style:")
                .titleFont()
            Spacer()
            Picker("Font Style", selection: $bindingValue) {
                ForEach(TextObject.fontList, id: \.self) { style in
                    Text(style ?? "System Font")
                }
            }
            .pickerStyle(.menu)
            .scaleEffect(0.8)
            .offset(x: 20)
        } 
    }
}



