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
    
    let minValue: CGFloat
    let maxValue: CGFloat
    
    let currentValueLabelFontSize: CGFloat
    let minMaxValueLabelFontSize: CGFloat
    let gaugeColor: String
    let opacity: CGFloat
    
    let showCurrentValueLabel: Bool
    let showMinMaxValueLabels: Bool
    let scaleEffect: CGFloat
    let currentValueLabelColor: String
    let minMaxValueLabelColor: String
    let shadowRadius: CGFloat
    let shadowOffset: CGFloat
    
    
    var body: some View {
        ZStack {
            VStack {
                Gauge(value: Double(batteryViewModel.batteryLevel), in: minValue...maxValue) {
                    Label("\(batteryViewModel.batteryLevel)", systemImage: "battery.50percent")
                } currentValueLabel: {
                    if showCurrentValueLabel { // Show only if true
                        Text("\(batteryViewModel.batteryLevel)")
                            .font(.system(size: currentValueLabelFontSize))
                            .foregroundColor(Color(currentValueLabelColor))
                    }
                } minimumValueLabel: {
                    if showMinMaxValueLabels { // Show only if true
                        Text("0")
                            .font(.system(size: minMaxValueLabelFontSize))
                            .foregroundColor(Color(minMaxValueLabelColor))
                    }
                } maximumValueLabel: {
                    if showMinMaxValueLabels { // Show only if true
                        Text("100")
                            .font(.system(size: minMaxValueLabelFontSize))
                            .foregroundColor(Color(minMaxValueLabelColor))
                    }
                }
            }
            .frame(width: 150, height: 150)
            .contentShape(Circle())
            .opacity(opacity)
            .gaugeStyle(.accessoryCircular)
            .tint(Color(gaugeColor))
            .scaleEffect(scaleEffect)
            .shadow(radius: shadowRadius, y: shadowOffset)
        }
        
    }
}


