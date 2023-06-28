//
//  CustomShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//


import SwiftUI

public struct CustomShapeView: View {
    
    @State private var count: CGFloat = 5
    @State private var ratio: CGFloat = 1
    @State private var isPresented: Bool = true
    @State private var scale: CGFloat = 0.5
    @State private var rotation: Angle = Angle(degrees: 0)
    @State private var bgColor = Color.blue
    @State private var shadowRadius: CGFloat = 0
    @State private var shadowOffset: CGFloat = 0
    @State private var blur: CGFloat = 0
    @State private var opacity: CGFloat = 1
    
    private let defaultCount: CGFloat = 5
    private let defaultRatio: CGFloat = 1
    private let defaultScale: CGFloat = 0.5
    private let defaultRotation: Angle = Angle(degrees: 0)
    private let defaultBgColor: Color = Color.blue
    private let defaultShadowRadius: CGFloat = 0
    private let defaultShadowOffset: CGFloat = 0
    private let defaultBlur: CGFloat = 0
    private let defaultOpacity: CGFloat = 1
    
    @State private var isDragging = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            
            VStack {
                GeometryReader { proxy in
                    let min = min(proxy.size.width, proxy.size.height)
                    ZStack {
                      
                        Star(count: round(count), innerRatio: ratio)
                            .fill(bgColor)
                            .background(.ultraThinMaterial.opacity(opacity))
                            .clipShape(Star(count: round(count), innerRatio: ratio))
                            .frame(width: min, height: min)
                            .scaleEffect(scale)
                            .rotationEffect(rotation)
                            .shadow(radius: shadowRadius, y: shadowOffset)
                            .blur(radius: blur)
                            .opacity(opacity)
                    }
                }
            }
            .padding()
            .animation(.easeInOut, value: count)
            .animation(.easeInOut, value: ratio)
            .offset(y: 50)
            
            // MARK: Settings
            VStack {
                HStack {
                
                    Spacer()
                    
                    Button {
                        square()
                    }label: {
                        Image(systemName: "square")
                            .padding(.trailing)
                    }
                    Button {
                        triangle()
                    }label: {
                        Image(systemName: "triangle")
                            .padding(.trailing)
                    }
                    Button {
                        circle()
                    }label: {
                        Image(systemName: "circle")
                            .padding(.trailing)
                    }
                    Button {
                        resetValues()
                    }label: {
                        Image(systemName: "star")
                           
                    }
                    
                }
                HStack {
                    Text("Count: ")
                    Slider(value: $count, in: 2...30)
                    Text("\(count, specifier: "%.0f")")
                }
                HStack {
                    Text("Inner Ratio: ")
                    Slider(value: $ratio, in: 0...2)
                    Text("\(ratio, specifier: "%.2f")")
                }
                HStack {
                    Text("Scale: ")
                    Slider(value: $scale, in: 0...5)
                    Text("\(scale, specifier: "%.1f")")
                }
                HStack {
                    Text("Rotation: ")
                    Slider(value: Binding<Double>(
                        get: { rotation.degrees },
                        set: { rotation = Angle(degrees: $0) }
                    ), in: 0...360)
                    Text("\(rotation.degrees, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Radius: ")
                    Slider(value: $shadowRadius, in: 0...20)
                    Text("\(shadowRadius, specifier: "%.1f")")
                }
                HStack {
                    Text("Shadow Offset: ")
                    Slider(value: $shadowOffset, in: 0...30)
                    Text("\(shadowOffset, specifier: "%.1f")")
                }
                HStack {
                    Text("Blur Radius: ")
                    Slider(value: $blur, in: 0...50)
                    Text("\(blur, specifier: "%.0f")")
                }
                
                ColorPicker("Set the background color", selection: $bgColor)
                
                HStack {
                    Text("Opacity: ")
                    Slider(value: $opacity, in: 0...1)
                    Text("\(opacity, specifier: "%.0f")")
                }
            }
            .padding()
            .offset(y: 300)
            .scaleEffect(0.8)
        }
    }
    
    private func resetValues() {
        count = defaultCount
        ratio = defaultRatio
        scale = defaultScale
        rotation = defaultRotation
        bgColor = defaultBgColor
        shadowRadius = defaultShadowRadius
        shadowOffset = defaultShadowOffset
        blur = defaultBlur
        opacity = defaultOpacity
    }
    
    private func square() {
        count = 4
        ratio = 1.4
        scale = defaultScale
        rotation = Angle(degrees: 45)
        bgColor = defaultBgColor
        shadowRadius = defaultShadowRadius
        shadowOffset = defaultShadowOffset
        blur = defaultBlur
        opacity = defaultOpacity
    }
    
    private func triangle() {
        count = 3
        ratio = defaultRatio
        scale = defaultScale
        rotation = defaultRotation
        bgColor = defaultBgColor
        shadowRadius = defaultShadowRadius
        shadowOffset = defaultShadowOffset
        blur = defaultBlur
        opacity = defaultOpacity
    }
    
    private func circle() {
        count = 30
        ratio = 2
        scale = defaultScale
        rotation = defaultRotation
        bgColor = defaultBgColor
        shadowRadius = defaultShadowRadius
        shadowOffset = defaultShadowOffset
        blur = defaultBlur
        opacity = defaultOpacity
    }
}


fileprivate
struct Star: Shape {
    
    var count: CGFloat
    var innerRatio: CGFloat
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(count, innerRatio) }
        set {
            count = newValue.first
            innerRatio = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let pointAngle = .pi / count
        
        let innerPoint = CGPoint(x: center.x * innerRatio * 0.5, y: center.y * innerRatio * 0.5)
        let totalPoints = Int(count * 2.0)
        
        var currentAngle = CGFloat.pi * -0.5
        var currentBottom: CGFloat = 0
        
        var path = Path()
        path.move(to: CGPoint(x: center.x * cos(currentAngle),
                              y: center.y * sin(currentAngle)))
        
        let correction = count != round(count) ? 1 : 0
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


