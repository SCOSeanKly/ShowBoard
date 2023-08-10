//
//  SliderToggle.swift
//  ShowBoard
//
//  Created by Sean Kelly on 09/08/2023.
//

import SwiftUI

struct SliderToggle: View {
    
    
    
 
    let color: Color
    private var normalFillColor: Color { color.opacity(0.6) }
    private var emptyColor: Color { color.opacity(0.2) }
    
    let title: String
    let sliderBindingValue: Binding<CGFloat>
    let minValue: Double
    let maxValue: Double
    let step: Double
    let specifier: Int
    var defaultValue: Double
    let buttonColor = Color(.systemBlue)
    let action: Binding<Bool>
    
    
    
    var body: some View {
        
        HStack {
                    HStack {
                        
                        Text(title)
                            .titleFont()
                            .fontWeight(sliderBindingValue.wrappedValue == CGFloat(defaultValue) ? .regular : .semibold)
                            .onTapGesture (count: 2) {
                                feedback()
                                sliderBindingValue.wrappedValue = CGFloat(defaultValue)
                            }
                        
                        CustomSlider(value: sliderBindingValue, inRange: CGFloat(minValue)...CGFloat(maxValue), activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in
                        }
                        .frame(height: 20)
                        .padding(.leading, 5)
                        
                        Spacer()
                        
                        CustomToggle(showTitleText: false, titleText: "", bindingValue: action, onSymbol: "circle", offSymbol: "xmark", rotate: true)
                            .offset(x: 15, y: 0)
                    }
        }
        .frame(height: 30)
        .padding(.horizontal)
    }
    
}



