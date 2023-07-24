//
//  ZoomModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct ZoomModifier: ViewModifier {
    enum ZoomState {
        case inactive
        case active(scale: CGFloat)

        var scale: CGFloat {
            switch self {
            case .active(let scale):
                return scale
            default:
                return 1.0
            }
        }
    }
    
    var minimum: CGFloat = 1.0
    var maximum: CGFloat = 3.0
    
    @GestureState private var zoomState = ZoomState.inactive
    @State private var currentScale: CGFloat = 1.0
    
    var scale: CGFloat {
        return currentScale * zoomState.scale
    }
    
    var pinchGesture: some Gesture {
        MagnificationGesture()
            .updating($zoomState) { value, state, transaction in
                state = .active(scale: value)
            }.onEnded { value in
                var newValue = self.currentScale * value
                if newValue <= minimum { newValue = minimum }
                if newValue >= maximum { newValue = maximum }
                self.currentScale = newValue
            }
    }
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .gesture(pinchGesture)
            .animation(.easeInOut, value: scale)
    }
}
