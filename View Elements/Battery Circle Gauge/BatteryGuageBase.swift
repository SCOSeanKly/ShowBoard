//
//  CircleProgress.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct BatteryGuageBase: View {
    @ObservedObject var batteryViewModel: BatteryViewModel
    
    @State private var batteryLevel = 0.0
    
    let minValue: CGFloat = 0
    let maxValue: CGFloat = 100
    
    let currentValueLabelFontSize: CGFloat
    let minMaxValueLabelFontSize: CGFloat
    let gaugeColor: Color
    let opacity: CGFloat
    
    let showCurrentValueLabel: Bool
    let showMinMaxValueLabels: Bool
    let scaleEffect: CGFloat
    let currentValueLabelColor: Color
    let minMaxValueLabelColor: Color
    let shadowRadius: CGFloat
    let shadowOffset: CGFloat
    let shadowOpacity: CGFloat
    
    
    var body: some View {
        ZStack {
            VStack {
                Gauge(value: Double(batteryViewModel.batteryLevel), in: minValue...maxValue) {
                    Label("\(batteryViewModel.batteryLevel)", systemImage: "battery.50percent")
                } currentValueLabel: {
                    if showCurrentValueLabel { // Show only if true
                        Text("\(batteryViewModel.batteryLevel)")
                            .font(.system(size: currentValueLabelFontSize))
                            .foregroundColor(currentValueLabelColor)
                    }
                } minimumValueLabel: {
                    if showMinMaxValueLabels { // Show only if true
                        Text("0")
                            .font(.system(size: minMaxValueLabelFontSize))
                            .foregroundColor(minMaxValueLabelColor)
                    }
                } maximumValueLabel: {
                    if showMinMaxValueLabels { // Show only if true
                        Text("100")
                            .font(.system(size: minMaxValueLabelFontSize))
                            .foregroundColor(minMaxValueLabelColor)
                    }
                }
            }
            .frame(width: 300, height: 300)
            .contentShape(Circle())
            .opacity(opacity)
            .gaugeStyle(.accessoryCircular)
            .tint(gaugeColor)
            .scaleEffect(scaleEffect)
            .shadow(color: .black.opacity(shadowOpacity), radius: shadowRadius, y: shadowOffset)
        }        
    }
}


