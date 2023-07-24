//
//  CustomPresentation.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

enum DetentType {
    case small
    case medium
    case large

    var fractionValue: CGFloat {
        switch self {
        case .small:
            return 0.1
        case .medium:
            return 0.45
        case .large:
            return 0.9
        }
    }
}

extension View {
    func customPresentation(detent: DetentType, detent2: DetentType) -> some View {
        self.presentationDetents([
            .fraction(detent.fractionValue),
            .fraction(detent2.fractionValue)
        ])
        .padding(.horizontal)
        .presentationBackground{
            TransparentBlurView(removeAllFilters: true)
                .blur(radius: 9, opaque: true)
                .background(.white.opacity(0.05))
        }
        .presentationCornerRadius(15)
        .presentationDragIndicator(.visible)
        .ignoresSafeArea()
    }
    
    // Overload the function with a version that accepts only one fraction
    func customPresentation(detent: DetentType) -> some View {
        self.customPresentation(detent: detent, detent2: detent)
    }
}



