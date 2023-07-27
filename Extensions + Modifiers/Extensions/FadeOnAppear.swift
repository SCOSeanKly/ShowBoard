//
//  FadeOnAppear.swift
//  ShowBoard
//
//  Created by Sean Kelly on 30/06/2023.
//

import SwiftUI

extension View {
    func fadeOnAppear(duration: TimeInterval = 2.0) -> some View {
        modifier(FadeOnAppearModifier(duration: duration))
    }
}

struct FadeOnAppearModifier: ViewModifier {
    let duration: TimeInterval
    
    @State private var isAppeared = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isAppeared ? 1.0 : 0.0)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        isAppeared = true
                    }
                }
            }
    }
}