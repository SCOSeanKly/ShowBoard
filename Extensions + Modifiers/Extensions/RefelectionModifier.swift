//
//  RefelectionModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 09/08/2023.
//

import SwiftUI

private struct GroundReflectionViewModifier: ViewModifier {
    let offsetY: CGFloat
    func body(content: Content) -> some View {
        content
            .background(
                content
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [.init(color: .white, location: 0.0), .init(color: .clear, location: 0.7)]),
                            startPoint: .bottom,
                            endPoint: .top)
                    )
                    .scaleEffect(x: 1.0, y: -1.0, anchor: .bottom)
                    .opacity(0.5)
                    .offset(y: offsetY)
                    .blur(radius: 0.5)
            )
    }
}

extension View {
    func reflection(offsetY: CGFloat = 1) -> some View {
        modifier(GroundReflectionViewModifier(offsetY: offsetY))
    }
}

