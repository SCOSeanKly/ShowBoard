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
    
    let title: String
    let sliderBindingValue: Binding<CGFloat>
    let minValue: Double
    let maxValue: Double
    let step: Double
    let specifier: Int
    var defaultValue: Double
    
    var body: some View {
        HStack {
            if isSliderMode {
                HStack {
                    
                    Text(title)
                        .fontWeight(sliderBindingValue.wrappedValue == CGFloat(defaultValue) ? .regular : .semibold)
                        .minimumScaleFactor(0.5)
                        .onTapGesture (count: 2) {
                            feedback()
                            sliderBindingValue.wrappedValue = CGFloat(defaultValue)
                        }
                    
                    Slider(value: sliderBindingValue, in: CGFloat(minValue)...CGFloat(maxValue), step: CGFloat(step))
                        .scaleEffect(0.9)
                    
                    Text("\(sliderBindingValue.wrappedValue, specifier: "%.\(specifier)f")")
                    
                }
            } else {
                HStack {
                    Text(title)
                        .fontWeight(sliderBindingValue.wrappedValue == CGFloat(defaultValue) ? .regular : .semibold)
                        .onTapGesture (count: 2) {
                            sliderBindingValue.wrappedValue = CGFloat(defaultValue)
                        }
                    
                    Slider(value: sliderBindingValue, in: CGFloat(minValue)...CGFloat(maxValue), step: CGFloat(step))
                        .scaleEffect(0.9)
                        .padding(.trailing, 5)
                    
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
                            }
                        }
                        
                        Text("\(sliderBindingValue.wrappedValue, specifier: "%.\(specifier)f")")
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
                    )
                    .clipShape(Capsule())
                }
            }
            
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
                    .foregroundColor(isSliderMode ? Color.primary : Color.red)
                    .padding(.leading)
            }
        }
        .frame(height: 30)
        .animation(.easeInOut(duration: 0.1), value: isSliderMode)
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


