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
    
    @State private var selectedCase = TextCase.none
    
    var body: some View {
        ZStack {
            if !text.appearance.isCircleText {
                Text(text.appearance.dynamicText(wk: wObserver)
                    .applyTextCase(selectedCase)
                    .dropLast(Int(text.appearance.dropLast)))
                    .multilineTextAlignment(text.appearance.textAlignment)
                    .overlay(
                        LinearGradient(colors: [text.appearance.fillColor, text.appearance.fillColor2], startPoint: .top, endPoint: .bottom)
                       )
                    .mask(
                        Text(text.appearance.dynamicText(wk: wObserver)
                            .applyTextCase(selectedCase)
                            .dropLast(Int(text.appearance.dropLast)))
                            .multilineTextAlignment(text.appearance.textAlignment)
                    )
                 .shadow(color: Color.black.opacity(text.appearance.shadowOpacity), radius: text.appearance.shadow.radius, x: text.appearance.shadow.offset.x, y: text.appearance.shadow.offset.y)
                 .frame(width: text.appearance.fontFrameWidth, alignment: alignment)
                 .font(text.appearance.font)
                 .tracking(text.appearance.fontTracking)
                 .fontWeight(text.appearance.fontWeight)
                 .blendMode(text.appearance.blendMode)
                 .rotationEffect(text.appearance.rotation)
                 .opacity(text.appearance.opacity)
                 .blur(radius: text.appearance.blur)
                 .rotation3DEffect(.degrees(text.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
                 .rotation3DEffect(.degrees(text.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
                 .padding()
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
                    text: text,
                    selectedCase: $selectedCase
                )
            }
        }
        .background{
            Rectangle()
                .fill(Color.white.opacity(0.00001))
        }
        .onTapGesture {
            text.appearance.showSettings.toggle()
        }
        .if(text.appearance.showReflection) { view in
            view.reflection(offsetY: text.appearance.reflectionOffset)
        }
        .sheet(isPresented: $text.appearance.showSettings){
            DynamicTextEditViewSettings(text: text, showMicroControls: $showMicroControls, selectedCase: $selectedCase)
        }
    }
    
}

