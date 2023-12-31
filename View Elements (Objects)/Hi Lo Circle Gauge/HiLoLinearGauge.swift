//
//  HiLoLinearGauge.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/08/2023.
//

import SwiftUI
import WeatherKit

struct HiLoLinearGauge: View {
    
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var hiLo = HiLoGaugeObject()
    @Binding var showMicroControls: Bool
       
       var currentWeather: CurrentWeather? {
           wObserver.weather?.currentWeather
       }
       
       var todaysForecast: DayWeather? {
           wObserver.getGorecast(offset: 0)
       }
    
    
    var body: some View {
        
        let temperatureString = DynamicText.Placeholder.temp.withCurrentWeather(currentWeather, unit: .celsius)
        let highTempString = DynamicText.Placeholder.highTemp.withDayWeather(todaysForecast, unit: .celsius, conditionAssetStyle: 1)
        let lowTempString = DynamicText.Placeholder.lowTemp.withDayWeather(todaysForecast, unit: .celsius, conditionAssetStyle: 1)
     
        
        VStack {
          
            
            Gauge(value: Double(temperatureString.dropLast(1)) ?? 0, in: (Double(lowTempString.dropLast(1)) ?? 0)...(Double(highTempString.dropLast(1)) ?? 0)) {

                         
                       } currentValueLabel: {
                           
                           
                            if hiLo.appearance.showCurrentValueLabel {
                            Text(temperatureString.dropLast(0))
                                    .font(.system(size: hiLo.appearance.currentValueLabelFontSize))
                                    .foregroundColor(hiLo.appearance.currentValueLabelColor)
                            }
                            
                         
                       } minimumValueLabel: {
                           
                            if hiLo.appearance.showMinMaxValueLabels {
                            Text(lowTempString.dropLast(0))
                                    .font(.system(size: hiLo.appearance.minMaxValueLabelFontSize))
                                    .foregroundColor(hiLo.appearance.minMaxValueLabelColor)
                            }
                            
                          
                           
                       } maximumValueLabel: {
                           
                            if hiLo.appearance.showMinMaxValueLabels {
                            Text(highTempString.dropLast(0))
                                    .font(.system(size: hiLo.appearance.minMaxValueLabelFontSize))
                                    .foregroundColor(hiLo.appearance.minMaxValueLabelColor)
                            }
                            
                         
                       }
                       .tint(hiLo.appearance.fillColor)
                       .opacity(hiLo.appearance.opacity)
                       .gaugeStyle(.accessoryLinearCapacity)//MARK: how do I add a picker to change the gauge style?
                       .scaleEffect(hiLo.appearance.gaugeScale)
                       .if(hiLo.appearance.showReflection) { view in
                           view.reflection(offsetY: hiLo.appearance.reflectionOffset)
                       }
                       .objectAppearanceModifier(layer: hiLo, systemImageName: "chart.line.flattrend.xyaxis", systemImage2: "", titleText: "Hi/Lo Weather Linear Gauge", showMicroControls: $showMicroControls)
                       .background{
                           Circle()
                               .fill(Color.white.opacity(0.00001))
                       }
                   }
     
            
        }
    }
