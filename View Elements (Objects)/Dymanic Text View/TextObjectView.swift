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
    @Binding var showMicroControls: Bool
    
    
    
    var alignment: Alignment {
        switch text.appearance.textAlignment {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
    
    var body: some View {
        ZStack {
            if !text.appearance.isCircleText {
                Text(text.appearance.dynamicText(wk: wObserver).dropLast(Int(text.appearance.dropLast)))
                 .shadow(color: Color.black.opacity(text.appearance.shadowOpacity), radius: text.appearance.shadow.radius, x: text.appearance.shadow.offset.x, y: text.appearance.shadow.offset.y)
                 .multilineTextAlignment(text.appearance.textAlignment)
                 .frame(width: text.appearance.fontFrameWidth, alignment: alignment)
                 .font(text.appearance.font)
                 .tracking(text.appearance.fontTracking)
                 .fontWeight(text.appearance.fontWeight)
                 .foregroundColor(text.appearance.fontColor)
                 .blendMode(text.appearance.blendMode)
                 .rotationEffect(text.appearance.rotation)
                 .opacity(text.appearance.opacity)
                 .blur(radius: text.appearance.blur)
                 .rotation3DEffect(.degrees(text.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
                 .rotation3DEffect(.degrees(text.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
                 .background{
                 Rectangle()
                 .fill(Color.white.opacity(0.00001))
                 }
                 .overlay {
                 MarchingAntsBorder(opacity: text.appearance.showSettings ? 1 : 0)
                 .frame(width: text.appearance.fontFrameWidth, alignment: alignment)
                 .rotationEffect(text.appearance.rotation)
                 }
                 .offset(x: text.appearance.offsetX, y: text.appearance.offsetY)
                 .scaleEffect(x: text.appearance.scaleWidth, y: text.appearance.scaleHeight, anchor: .center)
                 
                 
                
            } else {
                
                let rotationAngleInDegrees = text.appearance.rotation.degrees
                CircularTextView(
                    title: text.appearance.dynamicText(wk: wObserver),
                    radius: text.appearance.fontFrameWidth,
                    height: text.appearance.fontFrameWidth,
                    rotationAngle: rotationAngleInDegrees,
                    text: text
                )
                .background{
                    Rectangle()
                        .fill(Color.white.opacity(0.00001))
                }
            }
        }
        .if(text.appearance.showReflection) { view in
            view.reflection(offsetY: text.appearance.reflectionOffset)
        }
        
        .onTapGesture {
            text.appearance.showSettings.toggle()
        }
        .sheet(isPresented: $text.appearance.showSettings){
            DynamicTextEditViewSettings(text: text, showMicroControls: $showMicroControls)
        }
    }
    
}

