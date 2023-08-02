//
//  CustomFontPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct CustomFontPicker: View {
    @Binding var bindingValue: String
    @StateObject var text: TextObject
    
    var body: some View {
        HStack {
            Text("Font Style:")
                .titleFont()
            Spacer()
            Picker("Font Style", selection: $bindingValue) {
                ForEach(TextObject.fontList, id: \.self) { style in
                    Text(style)
                        .font(text.font)
                        .lineLimit(1)
                }
            }
            .pickerStyle(.menu)
        }
        .frame(height: 30)
        .padding(.horizontal)
      
    }
}
 




