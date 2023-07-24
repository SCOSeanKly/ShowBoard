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
    @State private var showSettings: Bool = false
    
    
    var body: some View {
        VStack {
            BatteryGuageBase(batteryViewModel: batteryViewModel, currentValueLabelFontSize: bat.currentValueLabelFontSize, minMaxValueLabelFontSize: bat.minMaxValueLabelFontSize, gaugeColor: bat.gaugeColor, opacity: bat.appearance.opacity, showCurrentValueLabel: bat.showCurrentValueLabel, showMinMaxValueLabels: bat.showMinMaxValueLabels, scaleEffect: bat.appearance.scales.y, currentValueLabelColor: bat.currentValueLabelColor, minMaxValueLabelColor: bat.minMaxValueLabelColor, shadowRadius: bat.appearance.shadow.radius, shadowOffset: bat.appearance.shadow.offset.y, shadowOpacity: bat.appearance.shadowOpacity)
                .animation(.spring())
                .onTapGesture {
                    showSettings.toggle()
                }
            
            Spacer()
        }
        .sheet(isPresented: $showSettings){
          BatteryCircleGaugeSettings(bat: bat)
        }
    }

}

struct BatteryCircleGauge_Previews: PreviewProvider {
    static var previews: some View {
        BatteryCircleGauge(batteryViewModel: BatteryViewModel())
    }
}


