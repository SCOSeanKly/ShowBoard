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
    
    public init() {}
    
    public var body: some View {
        
        Star(shapePointCount: shape.appearance.shapePointCount, shapeRatio: shape.appearance.shapeRatio)
                .fill(shape.appearance.fillColor)
        /*
                .background {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: shape.shapeBlur, opaque: true)
                        .opacity(shape.appearance.opacity)
                }
                .clipShape(Star(shapePointCount: shape.appearance.shapePointCount, shapeRatio: shape.appearance.shapeRatio))
         */
                .objectAppearanceModifier(layer: shape, systemImageName: "star", systemImage2: "", titleText: "Custom Shape Object")
    }
}


struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeView()
    }
}



