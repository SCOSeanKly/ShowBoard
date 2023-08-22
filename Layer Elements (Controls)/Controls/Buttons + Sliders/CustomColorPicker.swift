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
    let pickerBindingValue2: Binding<Color>?
    @State private var useGradient: Bool = false
    
    var body: some View {
        HStack {
            Text(titleText)
                .titleFont()
            Spacer()
            
           
            if useGradient {
                if let bindingValue2 = pickerBindingValue2 {
                    ColorPicker("", selection: bindingValue2)
                        .scaleEffect(0.9)
                        .frame(width: 30)
                        .offset(x: 15)
                }
                
                ColorPicker("", selection: pickerBindingValue)
                    .scaleEffect(0.9)
                    .frame(width: 25)
                    .offset(x: 15)
            } else {
                ColorPicker("", selection: Binding(
                    get: { pickerBindingValue.wrappedValue },
                    set: { newValue in
                        pickerBindingValue.wrappedValue = newValue
                        pickerBindingValue2?.wrappedValue = newValue
                    })
                )
                .scaleEffect(0.9)
                .frame(width: 25)
                .offset(x: 15)
            }
            
            CustomToggle(showTitleText: false, titleText: "", bindingValue: $useGradient, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                .offset(x: 10)
                .onChange(of: useGradient, perform: { newValue in
                    // Update the colors when the toggle is switched
                    if !newValue, let _ = pickerBindingValue2 {

                        pickerBindingValue2?.wrappedValue = pickerBindingValue.wrappedValue
                    }
                })
        }
        .frame(height: 30)
        .padding(.horizontal)
    }
}





