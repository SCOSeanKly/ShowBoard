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
            
            content
                .opacity(isDragging ? 0.5 : 1.0)
                .position(location)
                .gesture(drag)
                .animation(.easeInOut, value: location)
                .onLongPressGesture {
                 
                        location = CGPoint(x: proxy.size.width * 0.5, y: location.y)
                    
                }
                .onAppear {
                    location = CGPoint(x: proxy.size.width * 0.5, y: proxy.size.height * 0.5)
                }
        }
    }
}




