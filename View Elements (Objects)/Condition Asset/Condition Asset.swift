//
//  Condition Asset.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/08/2023.
//

import SwiftUI
import WeatherKit

struct Condition_Asset: View {
    
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @Binding var showMicroControls: Bool
    @StateObject var conditionAsset = ConditionAssetObject()
    @State private var imageLoaded = false
    
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    var body: some View {
        
        let conditionAssetString = DynamicText.Placeholder.conditionSymbol.withDayWeather(todaysForecast, unit: .celsius)
     
        
        if !imageLoaded {
            ProgressView()
        }
          
        
        Text(Image(systemName: conditionAssetString))
            .font(.system(size: 80).weight(.light))
            .foregroundColor(conditionAsset.appearance.fillColor)
            .onAppear {
                imageLoaded = true
            }
            .objectAppearanceModifier(layer: conditionAsset, systemImageName: "sun.max", systemImage2: "", titleText: "Weather Condition Asset", showMicroControls: $showMicroControls)
        
      
    }
}

