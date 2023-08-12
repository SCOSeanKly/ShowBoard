//
//  CustomShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//


import SwiftUI

public struct CustomShapeView: View {
    
    @StateObject var shape = CustomShapeObject()
    @State private var isSliderMode = true
    @Binding var showMicroControls: Bool
    
    
   //public init() {}
    
    public var body: some View {
        
        Star(shapePointCount: shape.appearance.shapePointCount, shapeRatio: shape.appearance.shapeRatio)
                .fill(shape.appearance.fillColor)
                .background {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 10, opaque: true)
                }
                .clipShape(Star(shapePointCount: shape.appearance.shapePointCount, shapeRatio: shape.appearance.shapeRatio))
                .objectAppearanceModifier(layer: shape, systemImageName: "star", systemImage2: "", titleText: "Custom Shape Object", showMicroControls: $showMicroControls)
    }
}

