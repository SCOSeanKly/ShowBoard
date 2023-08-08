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
    
    
    var body: some View {
        Gauge(value: Double(batteryViewModel.batteryLevel), in: bat.minValue...bat.maxValue) {
            Label("\(batteryViewModel.batteryLevel)", systemImage: "battery.50percent")
        } currentValueLabel: {
            if bat.showCurrentValueLabel {
                Text("\(batteryViewModel.batteryLevel)")
                    .font(.system(size: bat.currentValueLabelFontSize))
                    .foregroundColor(bat.currentValueLabelColor)
            }
        } minimumValueLabel: {
            if bat.showMinMaxValueLabels {
                Text("0")
                    .font(.system(size: bat.minMaxValueLabelFontSize))
                    .foregroundColor(bat.minMaxValueLabelColor)
            }
        } maximumValueLabel: {
            if bat.showMinMaxValueLabels {
                Text("100")
                    .font(.system(size: bat.minMaxValueLabelFontSize))
                    .foregroundColor(bat.minMaxValueLabelColor)
            }
        }
        .contentShape(Circle())
        .opacity(bat.appearance.opacity)
        .gaugeStyle(.accessoryCircular) //MARK: how do I add a picker to change the gauge style?
        .tint(bat.gaugeColor)
        .scaleEffect(bat.appearance.scales.x)
        .shadow(color: .black.opacity(bat.appearance.shadowOpacity), radius: bat.appearance.shadow.radius, y: bat.appearance.shadow.offset.y)
        .animation(.spring())
        
        //MARK: Testing purposes only - will be removed into own section.
        .onTapGesture {
            bat.appearance.showSettings.toggle()
        }
        .sheet(isPresented: $bat.appearance.showSettings){
            BatteryCircleGaugeSettings(bat: bat)
        }
    }
}

struct BatteryCircleGauge_Previews: PreviewProvider {
    static var previews: some View {
        BatteryCircleGauge(batteryViewModel: BatteryViewModel())
    }
}


