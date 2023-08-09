//
//  FadeOnAppear.swift
//  ShowBoard
//
//  Created by Sean Kelly on 30/06/2023.
//

import SwiftUI

extension View {
    func fadeOnAppear(duration: TimeInterval = 0.5) -> some View {
        modifier(FadeOnAppearModifier(duration: duration))
    }
}

struct FadeOnAppearModifier: ViewModifier {
    let duration: TimeInterval
    
    @State private var isAppeared = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isAppeared ? 1.0 : 0.0)
            .scaleEffect(isAppeared ? 1.0 : 0)
            .animation(.interpolatingSpring(stiffness: 300, damping: 20), value: isAppeared)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        isAppeared = true
                    }
                }
            }
    }
}
