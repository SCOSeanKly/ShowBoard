//
//  TextObjectView.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.07.23.
//

import SwiftUI


struct TextObjectView: View {
    
    @StateObject var text: TextObject
    
    var body: some View {
        Text(text.dynamicText)
            .shadow(
                radius: text.appearance.shadow.radius,
                x: text.appearance.shadow.offset.x,
                y: text.appearance.shadow.offset.y
            )
            .font(text.font)
            .tracking(text.fontTracking)
            .multilineTextAlignment(text.textAlignment)
            .fontWeight(text.fontWeight)
            .foregroundColor(text.fontColor)
            .blendMode(text.appearance.blendMode)
            .rotationEffect(text.appearance.rotation)
            .opacity(text.appearance.opacity)
            .blur(radius: text.appearance.blur)
    }
}
