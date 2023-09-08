//
//  DOTW.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/09/2023.
//

import SwiftUI

struct DOTWView: View {
    
    @Binding var showMicroControls: Bool
    @StateObject var dotw = DOTWObject()

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EE"
        return formatter
    }()
    
    var body: some View {
        HStack {
            ForEach(1..<8, id: \.self) { index in
                let calendar = Calendar.current
                let currentDay = calendar.component(.weekday, from: Date())
                let day = calendar.date(bySetting: .weekday, value: index, of: Date())!
                let dayName = dateFormatter.string(from: day)
                Text(dayName.dropLast(Int(dotw.appearance.dropLast)))
                    .font(dotw.appearance.font)
                    .textCase(.uppercase)
                    .padding(5)
                    .font(.system(size: dotw.appearance.daysTextSize))
                    .background(index == currentDay ? dotw.appearance.todayIndicator : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: dotw.appearance.dateBackgroundCornerRadius))
                    .foregroundColor(dotw.appearance.daysColor)
            }
        }
        .if(dotw.appearance.showReflection) { view in
            view.reflection(offsetY: dotw.appearance.reflectionOffset)
        }
        .objectAppearanceModifier(layer: dotw, systemImageName: "", systemImage2: "", titleText: "Days Of The Week", showMicroControls: $showMicroControls)
    }
}



   



/*
 #Preview {
 DOTWView()
 }
 */
