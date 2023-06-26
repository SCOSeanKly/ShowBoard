//
//  CircleProgress.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct BatteryCircularGuageView: View {
    @ObservedObject var batteryViewModel: BatteryViewModel
    @State private var batteryLevel = 0.0
    
    let minValue = 0.0
    let maxValue = 100.0

    let currentValueLabelFontSize: CGFloat
    let minimumValueLabelFontSize: CGFloat
    let maximumValueLabelFontSize: CGFloat
    let gaugeColor: Color
    let opacity: CGFloat
 
    var body: some View {
        ZStack {
            VStack {
                Gauge(value: Double(batteryViewModel.batteryLevel), in: minValue...maxValue) {
                    Label("\(batteryViewModel.batteryLevel)", systemImage: "battery.50percent")
                } currentValueLabel: {
                    Text("\(batteryViewModel.batteryLevel)")
                        .font(.system(size: currentValueLabelFontSize))
                        .foregroundColor(gaugeColor)
                    
                } minimumValueLabel: {
                    Text("0")
                        .font(.system(size: minimumValueLabelFontSize))
                        .foregroundColor(gaugeColor)
                } maximumValueLabel: {
                    Text("100")
                        .font(.system(size: maximumValueLabelFontSize))
                        .foregroundColor(gaugeColor)
                }

            }
            .frame(width: 150, height: 150)
            .contentShape(Circle())
            .opacity(opacity)
            .gaugeStyle(.accessoryCircular)
            .tint(gaugeColor)
        }
        
    }
}

