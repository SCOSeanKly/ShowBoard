//
//  CustomShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//


import SwiftUI

public struct CustomShapeView: View {

    @StateObject var shape = CustomShapeObject()

    public init() {}

    public var body: some View {
        ZStack {

            VStack {
                GeometryReader { proxy in
                    let min = min(proxy.size.width, proxy.size.height)
                    ZStack {
                        Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio)
                            .fill(shape.shapeColor)
                            .background(.ultraThinMaterial.opacity(shape.appearance.opacity))
                            .clipShape(Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio))
                            .frame(width: min, height: min)
                            .scaleEffect(
                                x: shape.appearance.scales.x,
                                y: shape.appearance.scales.y
                            )
                            .rotationEffect(shape.appearance.rotation)
                            .blendMode(shape.appearance.blendMode)
                            .shadow(
                                radius: shape.appearance.shadow.radius,
                                x: shape.appearance.shadow.offset.x,
                                y: shape.appearance.shadow.offset.y
                            )
                            .blur(radius: shape.appearance.blur)
                            .opacity(shape.appearance.opacity)
                          
                    }
                }
            }
            .padding()
            .animation(.spring())
            .offset(y: 50)

            VStack {
                HStack {
                    Text("Count: ")
                    Slider(value: $shape.shapePointCount, in: 2...30, step: 1.0)
                    Text("\(shape.shapePointCount, specifier: "%.1f")")
                }
                HStack {
                    Text("Inner Ratio: ")
                    Slider(value: $shape.shapeRatio, in: 0...2)
                    Text("\(shape.shapeRatio, specifier: "%.1f")")
                }
                HStack {
                    Text("Scale: ")
                    Slider(value: $shape.appearance.scales.x, in: 0...5)
                    Text("\(shape.appearance.scales.x, specifier: "%.1f")")
                        .onChange(of: shape.appearance.scales) { _ in
                            shape.appearance.scales.y =
                            shape.appearance.scales.x
                        }
                }
                HStack {
                    Text("Rotation: ")
                    Slider(value: $shape.appearance.rotation.degrees, in: 0...360)
                    Text("\(shape.appearance.rotation.degrees, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Radius: ")
                    Slider(value: $shape.appearance.shadow.radius, in: 0...20)
                    Text("\(shape.appearance.shadow.radius, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Offset: ")
                    Slider(value: $shape.appearance.shadow.offset.y, in: 0...30)
                    Text("\(shape.appearance.shadow.offset.y, specifier: "%.1f")")
                }
                HStack {
                    Text("Blur Radius: ")
                    Slider(value: $shape.appearance.blur, in: 0...50)
                    Text("\(shape.appearance.blur, specifier: "%.0f")")
                }

                ColorPicker("Set the background color", selection: $shape.shapeColor)
                
                HStack {
                    Text("Blend Mode: ")
                    Spacer()
                    Picker("Blend Mode", selection: $shape.appearance.blendMode) {
                        ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                            Text(LayerObjectAppearance.labelForBlendMode(mode))
                                .tag(mode)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    
                    
                }

                HStack {
                    Text("Opacity: ")
                    Slider(value: $shape.appearance.opacity, in: 0...1)
                    Text("\(shape.appearance.opacity, specifier: "%.1f")")
                }

            }
            .padding()
            .offset(y: 300)
            .scaleEffect(0.8)
        }
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



