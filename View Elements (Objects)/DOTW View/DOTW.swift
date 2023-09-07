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
    
    let today = Calendar.current.date(bySetting: .weekday, value: 2, of: Date()) // Set the starting day to Monday (2).
    
    var body: some View {
        HStack {
            ForEach(0..<7, id: \.self) { index in
                let day = Calendar.current.date(byAdding: .day, value: index, to: today!)!
                let dayName = dateFormatter.string(from: day)
                Text(dayName.dropLast(Int(dotw.appearance.dropLast)))
                    .textCase(.uppercase)
                    .padding(5)
                    .font(.system(size: dotw.appearance.daysTextSize))
                    .background(index == 3 ? dotw.appearance.todayIndicator : Color.clear)
                    .clipShape(RoundedRectangle(cornerRadius: dotw.appearance.dateBackgroundCornerRadius))
                  //  .foregroundColor(index == 3 ? dotw.appearance.fillColor2 : dotw.appearance.fillColor)
                    .foregroundColor(dotw.appearance.daysColor)
                  
            }
        }
        .objectAppearanceModifier(layer: dotw, systemImageName: "", systemImage2: "", titleText: "Days Of The Week", showMicroControls: $showMicroControls)
    }
}


   



/*
 #Preview {
 DOTWView()
 }
 */
