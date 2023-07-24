//
//  VerticalDragModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct VerticalDragModifier: ViewModifier {
    
    @State private var location: CGPoint = .zero

    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                let newY = max(min(value.location.y, UIScreen.main.bounds.height * 0.85), 0) // Restrict movement vertically
                self.location.y = newY
            }
            .onEnded { _ in
               // Nothing
            }
    }
    
    func body(content: Content) -> some View {
        GeometryReader { proxy in
            let minY = max(0, proxy.safeAreaInsets.top) // Minimum Y position taking into account safe area
            let maxY = proxy.size.height - proxy.safeAreaInsets.bottom // Maximum Y position taking into account safe area
            
            content
                .frame(width: UIScreen.main.bounds.width)
                .position(x: proxy.size.width * 0.5, y: location.y.clamped(to: minY...maxY)) // Clamp Y position within the valid range
                .gesture(drag)
                .onTapGesture(count: 2) {
                    location = CGPoint(x: location.x, y: proxy.size.height * 0.85)
                }
                .onAppear {
                    location = CGPoint(x: proxy.size.width * 0.5, y: proxy.size.height * 0.85)
                }
        }
    }
}

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}


