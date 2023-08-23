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
            return 0.2
        case .medium:
            return 0.4
        case .large:
            return 0.9
        }
    }
}

extension View {
    func customPresentationWithBlur(detent: DetentType, detent2: DetentType, blurRadius: CGFloat, backgroundColorOpacity: Double) -> some View {
        self.presentationDetents([
            .fraction(detent.fractionValue),
            .fraction(detent2.fractionValue)
        ])
        .presentationBackground {
            TransparentBlurView(removeAllFilters: true)
                .blur(radius: blurRadius, opaque: true)
                .background(Color.primary.opacity(backgroundColorOpacity).colorInvert())
        }
        .presentationCornerRadius(15)
        .presentationDragIndicator(.visible)
        .ignoresSafeArea()
    }
    
    
    // Overload the function with a version that accepts only one fraction
    func customPresentationWithBlur(detent: DetentType, blurRadius: CGFloat, backgroundColorOpacity: Double) -> some View {
        self.customPresentationWithBlur(detent: detent, detent2: detent, blurRadius: blurRadius, backgroundColorOpacity: backgroundColorOpacity)
    }
    
    func customPresentationWithPrimaryBackground(detent: DetentType, detent2: DetentType, backgroundColorOpacity: Double) -> some View {
        self.presentationDetents([
            .fraction(detent.fractionValue),
            .fraction(detent2.fractionValue)
        ])
        .presentationBackground {
            Color.primary.opacity(backgroundColorOpacity).colorInvert()
        }
        .presentationCornerRadius(15)
        .presentationDragIndicator(.visible)
        .ignoresSafeArea()
    }
    
    // Overload the function with a version that accepts only one fraction
    func customPresentationWithPrimaryBackground(detent: DetentType, backgroundColorOpacity: Double) -> some View {
        self.customPresentationWithPrimaryBackground(detent: detent, detent2: detent, backgroundColorOpacity: backgroundColorOpacity)
    }
}





