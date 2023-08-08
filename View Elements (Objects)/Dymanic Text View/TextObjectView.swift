//
//  TextObjectView.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.07.23.
//

import SwiftUI


struct TextObjectView: View {
    
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var text: TextObject
  
    
    var alignment: Alignment {
        switch text.textAlignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
    
    var body: some View {
        
        Text(text.dynamicText(wk: wObserver))
            .shadow(
                radius: text.appearance.shadow.radius,
                x: text.appearance.shadow.offset.x,
                y: text.appearance.shadow.offset.y
            )
            .multilineTextAlignment(text.textAlignment)
            .frame(width: text.fontFrameWidth, alignment: alignment)
            .font(text.font)
            .tracking(text.fontTracking)
            .fontWeight(text.fontWeight)
            .foregroundColor(text.fontColor)
            .blendMode(text.appearance.blendMode)
            .rotationEffect(text.appearance.rotation)
            .opacity(text.appearance.opacity)
            .blur(radius: text.appearance.blur)
        //MARK: Testing purposes only - will be removed
            .onTapGesture {
                text.appearance.showSettings.toggle()
            }
            .sheet(isPresented: $text.appearance.showSettings){
                DynamicTextEditViewSettings(text: text)
            }
        
    }
    
}

