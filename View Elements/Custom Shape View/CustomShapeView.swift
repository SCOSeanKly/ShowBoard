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
       
     VStack {
               
                Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio)
                    .fill(shape.shapeColor)
                    .blendMode(shape.appearance.blendMode)
                    .background(.ultraThinMaterial.opacity(shape.appearance.opacity))
                    .clipShape(Star(shapePointCount: shape.shapePointCount, shapeRatio: shape.shapeRatio))
                    .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
                    .scaleEffect(
                        x: shape.appearance.scales.x,
                        y: shape.appearance.scales.y
                    )
                    .rotationEffect(shape.appearance.rotation)
                    .shadow(
                        radius: shape.appearance.shadow.radius,
                        x: shape.appearance.shadow.offset.x,
                        y: shape.appearance.shadow.offset.y
                    )
                    .blur(radius: shape.appearance.blur)
                    .opacity(shape.appearance.opacity)
                    .rotation3DEffect(.degrees(shape.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
                    .rotation3DEffect(.degrees(shape.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
                    .animation(.spring())
                   
         
                // MARK: Settings
         CustomShapeSettings(shape: shape)
         
            }
            .padding()
            .ignoresSafeArea()
           
    }
}



struct CustomShapeView_Previews: PreviewProvider {
    static var previews: some View {
        CustomShapeView()
    }
}



