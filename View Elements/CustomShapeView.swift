//
//  CustomShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//


import SwiftUI

public struct CustomShapeView: View {

    @StateObject var shape = CustomShapeObject()
    
    @State private var isSliderMode = true

    public init() {}

    public var body: some View {
        ZStack {
            VStack {
               
                Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio)
                    .fill(shape.shapeColor)
                    .blendMode(shape.appearance.blendMode)
                    .background(.ultraThinMaterial.opacity(shape.appearance.opacity))
                    .clipShape(Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio))
                    .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
                    .scaleEffect(
                        x: shape.appearance.scales.x,
                        y: shape.appearance.scales.y
                    )
                    .rotationEffect(shape.appearance.rotation)
                    .shadow(
                        radius: shape.appearance.shadow.radius,
                        x: shape.appearance.shadow.offset.x,
                        y: shape.appearance.shadow.offset.y
                    )
                    .blur(radius: shape.appearance.blur)
                    .opacity(shape.appearance.opacity)
                    .rotation3DEffect(.degrees(shape.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(shape.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .animation(.spring())
                   
                
                ScrollView {
                    
                  ResetValues(resetValues: resetCustomShapeValues)
                    
                    SliderStepper(title: "Count:", sliderBindingValue: $shape.shapePointCount, minValue: 2, maxValue: 30, step: 1, specifier: 0, defaultValue: 5)
                    
                    SliderStepper(title: "Inner Ratio:", sliderBindingValue: $shape.shapeRatio, minValue: 0.1, maxValue: 2.01, step: 0.01, specifier: 2, defaultValue: 1)
                    
                    SliderStepper(title: "Width:", sliderBindingValue: $shape.shapeFrameWidth, minValue: 0, maxValue: UIScreen.main.bounds.width, step: 1, specifier: 0, defaultValue: 250)
                    
                    SliderStepper(title: "Height:", sliderBindingValue: $shape.shapeFrameHeight, minValue: 0, maxValue: UIScreen.main.bounds.height, step: 1, specifier: 0, defaultValue: 250)
                    
                    // TODO: resetting only resets X and not Y
                    SliderStepper(title: "Scale:", sliderBindingValue: $shape.appearance.scales.x, minValue: 0, maxValue: 5, step: 0.1, specifier: 1, defaultValue: 1)
                        .onChange(of: shape.appearance.scales) { _ in
                            shape.appearance.scales.y =
                            shape.appearance.scales.x
                        }
                    
                    SliderStepper(title: "Skew X", sliderBindingValue: $shape.appearance.skewY, minValue: 0, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(title: "Skew Y", sliderBindingValue: $shape.appearance.skewX, minValue: 0, maxValue: 180, step: 1, specifier: 1, defaultValue: 0)
                    
                    // TODO: Cant get this to work?
                    /*
                     SliderStepper(title: "Rotation: ", sliderBindingValue: $shape.appearance.rotation.degrees, minValue: 0.0, maxValue: 360, step: 1, specifier: 1)
                     */
                     
                    HStack {
                        Text("Rotation:")
                        Slider(value: $shape.appearance.rotation.degrees, in: 0...360)
                        Text("\(shape.appearance.rotation.degrees, specifier: "%.1f")")
                    }
                    
                    SliderStepper(title: "Shadow Radius:", sliderBindingValue: $shape.appearance.shadow.radius, minValue: 0, maxValue: 20, step: 1.0, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(title: "Shadow Offet:", sliderBindingValue: $shape.appearance.shadow.offset.y, minValue: 0, maxValue: 30, step: 1.0, specifier: 1, defaultValue: 0)
                    
                    SliderStepper(title: "Blur Radius:", sliderBindingValue: $shape.appearance.blur, minValue: 0, maxValue: 50, step: 1.0, specifier: 0, defaultValue: 0)
                    
                    CustomColorPicker(titleText: "Set the background color", pickerBindingValue:  $shape.shapeColor)
                    
                    HStack {
                        Text("Blend Mode:")
                        Spacer()
                        Picker("Blend Mode", selection: $shape.appearance.blendMode) {
                            ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                                Text(LayerObjectAppearance.labelForBlendMode(mode))
                                    .tag(mode)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    SliderStepper(title: "Opacity:", sliderBindingValue: $shape.appearance.opacity, minValue: 0, maxValue: 1, step: 0.1, specifier: 1, defaultValue: 1)
                   
                    Spacer()
                        .frame(height: 200)
                }
               
            }
            .padding()
        }
    }
    
    private func resetCustomShapeValues() {
        /*
        width = 300
        height = 150
        cornerRadius = 0
        shadowRadius = 0
        shadowOffset = 0
        blendMode = .normal
        colorOverlay = .clear
         */
    }
}

fileprivate struct Star: Shape {

    var shapePointCount: CGFloat
    var shapeRatio: CGFloat

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let pointAngle = .pi / shapePointCount

        let innerPoint = CGPoint(x: center.x * shapeRatio * 0.5, y: center.y * shapeRatio * 0.5)
        let totalPoints = Int(shapePointCount * 2.0)

        var currentAngle = CGFloat.pi * -0.5
        var currentBottom: CGFloat = 0

        var path = Path()
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        let correction = shapePointCount != round(shapePointCount) ? 1 : 0
        for corner in 0..<totalPoints + correction  {
            var bottom: CGFloat = 0
            let sin = sin(currentAngle)
            let cos = cos(currentAngle)
            if (corner % 2) == 0 {
                bottom = center.y * sin
                path.addLine(to: CGPoint(x: center.x * cos, y: bottom))
            } else {
                bottom = innerPoint.y * sin
                path.addLine(to: CGPoint(x: innerPoint.x * cos, y: bottom))
            }
            currentBottom = max(bottom, currentBottom)
            currentAngle += pointAngle
        }

        let transform = CGAffineTransform(translationX: center.x, y: center.y + ((rect.height * 0.5 - currentBottom) * 0.5))
        return path.applying(transform)
    }
}

struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeView()
    }
}



