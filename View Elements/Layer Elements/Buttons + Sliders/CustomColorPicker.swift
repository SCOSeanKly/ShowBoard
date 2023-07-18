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
            Spacer()
            ColorPicker("", selection: pickerBindingValue)
        }
    }
}



