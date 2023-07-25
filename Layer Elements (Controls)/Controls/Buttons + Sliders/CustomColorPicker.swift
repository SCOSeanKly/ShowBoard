//
//  CustomColorPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct CustomColorPicker: View {
    let titleText: String
    let pickerBindingValue: Binding<Color>

    var body: some View {
        HStack {
            Text(titleText)
                .titleFont()
            Spacer()
            ColorPicker("", selection: pickerBindingValue)
                .scaleEffect(0.9)
                .offset(x: 10)
        }
        .frame(height: 30)
        .padding(.horizontal)
    }
}



