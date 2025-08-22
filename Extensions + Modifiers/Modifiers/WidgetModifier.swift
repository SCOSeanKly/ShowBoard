//
//  WidgetModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//


import SwiftUI

struct WidgetModifier: ViewModifier {
    @Binding var isDragging: Bool
    @Binding var position: CGPoint

    private var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.position = value.location
                self.isDragging = true
            }
            .onEnded { _ in
                self.isDragging = false
            }
    }

    func body(content: Content) -> some View {
        content
            .opacity(isDragging ? 0.75 : 1.0)
            .position(position)
            .gesture(drag)
            .animation(.easeInOut, value: position)
    }
}
