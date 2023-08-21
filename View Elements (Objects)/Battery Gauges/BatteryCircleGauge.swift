//
//  BatteryCircleGauge.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct BatteryCircleGauge: View {
    
    @ObservedObject var batteryViewModel: BatteryViewModel
    @StateObject var bat = CircleGaugeObject()
    @Binding var showMicroControls: Bool
    
    
    
    var body: some View {
        Gauge(value: Double(batteryViewModel.batteryLevel), in: bat.appearance.minValue...bat.appearance.maxValue) {
            Label("\(batteryViewModel.batteryLevel)", systemImage: "battery.50percent")
        } currentValueLabel: {
            if bat.appearance.showCurrentValueLabel {
                Text("\(batteryViewModel.batteryLevel)")
                    .font(.system(size: bat.appearance.currentValueLabelFontSize))
                    .foregroundColor(bat.appearance.currentValueLabelColor)
            }
        } minimumValueLabel: {
            if bat.appearance.showMinMaxValueLabels {
                Text("0")
                    .font(.system(size: bat.appearance.minMaxValueLabelFontSize))
                    .foregroundColor(bat.appearance.minMaxValueLabelColor)
            }
        } maximumValueLabel: {
            if bat.appearance.showMinMaxValueLabels {
                Text("100")
                    .font(.system(size: bat.appearance.minMaxValueLabelFontSize))
                    .foregroundColor(bat.appearance.minMaxValueLabelColor)
            }
        }
        .scaleEffect(1.5)
        .tint(bat.appearance.gaugeColor)
        .opacity(bat.appearance.opacity)
        .gaugeStyle(.accessoryCircular) //MARK: how do I add a picker to change the gauge style?
        .scaleEffect(bat.appearance.gaugeScale)
        .objectAppearanceModifier(layer: bat, systemImageName: "circle", systemImage2: "", titleText: "Battery Circle Gauge", showMicroControls: $showMicroControls)
        .background{
            Circle()
                .fill(Color.white.opacity(0.00001))
        }
      
    }
       
}

