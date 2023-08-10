//
//  CircleText.swift
//  ShowBoard
//
//  Created by Sean Kelly on 09/08/2023.
//

import SwiftUI

struct CircularTextView: View {
    @State private var letterWidths: [Int:Double] = [:]
    
    @State var title: String
    
    var lettersOffset: [(offset: Int, element: Character)] {
        return Array(title.enumerated())
    }
    
    let radius: CGFloat
    let height: CGFloat
    let rotationAngle: Double
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
        ZStack {
            ForEach(lettersOffset, id: \.offset) { index, letter in // Mark 1
                VStack {
                    Text(String(letter))
                        .shadow(
                            radius: text.appearance.shadow.radius,
                            x: text.appearance.shadow.offset.x,
                            y: text.appearance.shadow.offset.y
                        )
                        .font(text.font)
                        .foregroundColor(text.fontColor)
                        .tracking(text.fontTracking)
                        .background(LetterWidthSize())
                        .opacity(text.appearance.opacity)
                        .blendMode(text.appearance.blendMode)
                        .blur(radius: text.appearance.blur)
                        .onPreferenceChange(WidthLetterPreferenceKey.self, perform: { width in  // Mark 2
                            letterWidths[index] = width
                        })
                    Spacer() // Mark 1
                }
                .rotationEffect(fetchAngle(at: index)) // Mark 3
            }
        }
        .frame(width: text.fontFrameWidth, height: text.fontFrameWidth)
        .rotationEffect(text.appearance.rotation)
        .rotation3DEffect(.degrees(text.appearance.skewY), axis: (x: 0.0, y: 1.0, z: 0.0))
        .rotation3DEffect(.degrees(text.appearance.skewX), axis: (x: 1.0, y: 0.0, z: 0.0))
    }
    
    func fetchAngle(at letterPosition: Int) -> Angle {
        let times2pi: (Double) -> Double = { $0 * 2 * .pi }
        
        let circumference = times2pi(radius)
        
        let finalAngle = times2pi(letterWidths.filter{$0.key <= letterPosition}.map(\.value).reduce(0, +) / circumference)
        
        return .radians(finalAngle)
    }
}

struct WidthLetterPreferenceKey: PreferenceKey {
    static var defaultValue: Double = 0
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

struct LetterWidthSize: View {
    var body: some View {
        GeometryReader { geometry in // using this to get the width of EACH letter
            Color
                .clear
                .preference(key: WidthLetterPreferenceKey.self,
                            value: geometry.size.width)
        }
    }
}
