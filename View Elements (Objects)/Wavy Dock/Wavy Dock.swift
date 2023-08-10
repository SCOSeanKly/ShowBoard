//
//  wave.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

struct WavyDock: Shape {
    
    @StateObject var wavyD:  WavyDockObject
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: 0, y: height * 0.5)
        
        var path = Path()
        path.move(to: origin)
        
        var endY: CGFloat = 0.0
        let step = 5.0
        for angle in stride(from: step, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/wavyD.xAngle) * width * wavyD.graphWidth
            let y = origin.y - CGFloat(sin(angle/180 * Double.pi)) * height * wavyD.amplitude
            path.addLine(to: CGPoint(x: x, y: y))
            endY = y
        }
        path.addLine(to: CGPoint(x: width, y: endY))
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: origin.y))
        
        return path
    }
}

struct WavyDockView: View {
    @StateObject private var wavyD = WavyDockObject()
    @State private var showSettings: Bool = false
    
    
    var body: some View {
        ZStack {

            WavyDock(wavyD: wavyD)
                .foregroundColor(wavyD.wavyDockColor)
                .ignoresSafeArea()
                .offset(y: wavyD.offsetY)
                .shadow(radius: wavyD.shadowRadius, y: -wavyD.shadowOffsetY)
                .onTapGesture {
                    showSettings.toggle()
                }
                .scaleEffect(1.1)
               
        }
        .sheet(isPresented: $showSettings){
            ZStack {
                ScrollView (showsIndicators: false) {
                    
                    ResetValues(resetValues: {}, systemImageName: "water.waves", titleText: "Wavy Dock")
                    
                    SliderStepper(color: .blue, title: "Width", sliderBindingValue: $wavyD.graphWidth, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                    
                    SliderStepper(color: .blue, title: "xAngle", sliderBindingValue: $wavyD.xAngle, minValue: 0, maxValue: 360, step: 0.1, specifier: 1, defaultValue: 360)
                    
                    SliderStepper(color: .blue, title: "Amplitude", sliderBindingValue: $wavyD.amplitude, minValue: -0.5, maxValue: 0.5, step: 0.1, specifier: 1, defaultValue: 0.15)
                    
                    SliderStepper(color: .blue, title: "OffsetY", sliderBindingValue: $wavyD.offsetY, minValue: 85, maxValue: 400, step: 1, specifier: 0, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Radius", sliderBindingValue: $wavyD.shadowRadius, minValue: 0, maxValue: 50, step: 1, specifier: 0, defaultValue: 0)
                    
                    SliderStepper(color: .blue, title: "Shadow Offset", sliderBindingValue: $wavyD.shadowOffsetY, minValue: 0, maxValue: 20, step: 1, specifier: 0, defaultValue: 0)
                    
                    CustomColorPicker(titleText: "Color", pickerBindingValue: $wavyD.wavyDockColor)
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
            .customPresentationWithBlur(detent: .medium, blurRadius: 0, backgroundColorOpacity: 0.75)
        }
       
    }
}

struct WavyDockView_Previews: PreviewProvider {
    static var previews: some View {
        WavyDockView()
    }
}


