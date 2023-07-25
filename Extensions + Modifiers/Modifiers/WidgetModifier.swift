//
//  WidgetModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//


import SwiftUI

struct WidgetModifier: ViewModifier {
    @State private var location: CGPoint = .zero
    @Binding var isDragging: Bool
    @State private var angle: CGFloat = 0
    @State private var prevAngle: CGFloat = 0
    let enableZoom: Bool // Variable to enable/disable the zoom modifier
    
    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
                self.isDragging = true
            }
            .onEnded { _ in
                self.isDragging = false
            }
    }
    
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            let min = min(proxy.size.width, proxy.size.height)
            // let size = CGSize(width: min * 0.5, height: min * 0.5)
            content
                .opacity(isDragging ? 0.5 : 1.0)
                .frame(width: UIScreen.main.bounds.width)
                .position(location)
                .gesture(drag)
                .animation(.easeInOut, value: location)
                .if(enableZoom) { view in
                    view.modifier(ZoomModifier(minimum: 0.50, maximum: 1.50))
                }
            // .rotationEffect(.degrees(Double(self.angle)))
            // .gesture(RotateGesture(angle: $angle, prevAngle: $prevAngle, size: size))
                .onTapGesture(count: 2) {
                    location = CGPoint(x: proxy.size.width * 0.5, y: location.y)
                }
                .onAppear {
                    location = CGPoint(x: proxy.size.width * 0.5, y: proxy.size.height * 0.5)
                }
        }
    }
}




