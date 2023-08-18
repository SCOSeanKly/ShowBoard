//
//  BatteryBar.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct BatteryLinearGauge: View {
    
    @ObservedObject var batteryViewModel: BatteryViewModel
    @StateObject var bat = LinearGaugeObject()
    @Binding var showMicroControls: Bool
    
    
    var body: some View {
        Gauge(value: Double(batteryViewModel.batteryLevel), in: bat.appearance.minValue...bat.appearance.maxValue) {
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
        .frame(width: bat.appearance.width, height: bat.appearance.height, alignment: .center)
        .tint(bat.appearance.fillColor)
        .opacity(bat.appearance.opacity)
        .gaugeStyle(.accessoryLinearCapacity) //MARK: how do I add a picker to change the gauge style?
        .objectAppearanceModifier(layer: bat, systemImageName: "line", systemImage2: "", titleText: "Battery Linear", showMicroControls: $showMicroControls)
    }
}

struct BatteryLinearGauge_Previews: PreviewProvider {
    static var previews: some View {
        BatteryLinearGauge(batteryViewModel: BatteryViewModel(), showMicroControls: .constant(false))
    }
}

 

