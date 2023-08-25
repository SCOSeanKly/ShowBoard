//
//  SliderStepper.swift
//  ShowBoard
//
//  Created by Sean Kelly on 17/07/2023.
//

//TODO: Add logic so that the max cant be less than min and min cant be more than max

import SwiftUI

struct SliderStepper: View {
    
    
    
    @State private var isSliderMode = true
    @State private var buttonPressed = false
    @State private var timer: Timer?
    @State private var sliderTypeOpacity: Bool = false
    
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
    
    
    var body: some View {
        
        HStack {
            
            HStack {
                if isSliderMode {
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

                        Text("\(sliderBindingValue.wrappedValue, specifier: "%.\(specifier)f")")
                            .specifierFont()
                            
                            .frame(width: 45, alignment: .trailing)
                            .offset(x: 10)
                    }
                }
                
                else {
                    HStack {
                        
                        Text(title)
                            .titleFont()
                            .fontWeight(sliderBindingValue.wrappedValue == CGFloat(defaultValue) ? .regular : .semibold)
                            .onTapGesture (count: 2) {
                                sliderBindingValue.wrappedValue = CGFloat(defaultValue)
                            }
                        
                        CustomSlider(value: sliderBindingValue, inRange: CGFloat(minValue)...CGFloat(maxValue), activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in
                        }
                        
                        HStack {
                            if Double(sliderBindingValue.wrappedValue) > minValue {
                                Button(action: {
                                    feedback()
                                    buttonPressed = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        buttonPressed.toggle()
                                    }
                                    let newValue = sliderBindingValue.wrappedValue - CGFloat(step)
                                    sliderBindingValue.wrappedValue = max(newValue, CGFloat(minValue))
                                    resetTimer()
                                }) {
                                    Image(systemName: "chevron.left")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 10)
                                }
                            }
                            
                            Text("\(sliderBindingValue.wrappedValue, specifier: "%.\(specifier)f")")
                                .fontWeight(.semibold)
                                .scaleEffect(buttonPressed ? 1.0 : 0.9)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 20), value: buttonPressed)
                            
                            if Double(sliderBindingValue.wrappedValue) < maxValue {
                                Button(action: {
                                    feedback()
                                    buttonPressed = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        buttonPressed.toggle()
                                    }
                                    let newValue = sliderBindingValue.wrappedValue + CGFloat(step)
                                    sliderBindingValue.wrappedValue = min(newValue, CGFloat(maxValue))
                                    resetTimer()
                                }) {
                                    Image(systemName: "chevron.right")
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 10)
                                }
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                        .fixedSize()
                        .overlay(
                            Capsule()
                                .strokeBorder(lineWidth: 1, antialiased: true)
                                .shadow(color: .black.opacity(0.25), radius: 3, x: 1, y: 1)
                        )
                        .clipShape(Capsule())
                        .padding(.leading, 10)
                    }
                }
            }
            .animation(.easeInOut(duration: 0.1), value: isSliderMode)
       
            ///Button to toggle between Slider and Slider + Stepper
            Button(action: {
                
                feedback()
              
                isSliderMode.toggle()
                if !isSliderMode {
                    resetTimer()
                } else {
                    cancelTimer()
                }
                
            }) {
                Text(isSliderMode ? "\(Image(systemName: "chevron.right"))" : "\(Image(systemName: "xmark"))")
                    .foregroundColor(isSliderMode ? Color.primary : buttonColor)
                    .padding(.leading)
                    .padding(.trailing, 5)
            }
        }
        .frame(height: 30)
        .padding(.horizontal)
        .onAppear(perform: resetTimer) // Reset timer when the view appears
    }
    
    func resetTimer() {
        buttonPressed = false
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            isSliderMode = true
        }
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
}


