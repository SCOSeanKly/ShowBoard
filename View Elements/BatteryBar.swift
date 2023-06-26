//
//  BatteryBar.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//
import SwiftUI

struct BatteryBar: View {
    let barWidth: CGFloat // Width of the battery bar
    let barHeight: CGFloat // Height of the battery bar
    let batteryLevel: CGFloat
    let batteryBarBackgroundColour: Color
    let batteryBarColourleading: Color
    let batteryBarColourTrailing: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 100)
                .frame(width: barWidth, height: barHeight)
                .foregroundColor(batteryBarBackgroundColour)
            
            LinearGradient(
                gradient: Gradient(colors: [batteryBarColourTrailing, batteryBarColourleading]),
                startPoint: .trailing,
                endPoint: .leading
            )
            .frame(width: barWidth * (batteryLevel / 100), height: barHeight)
        }
    }
}
