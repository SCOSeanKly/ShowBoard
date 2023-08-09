//
//  SWAWidgetView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 02/08/2023.
//
/*
import SwiftUI
import WeatherKit

struct SWAWidget2: View {
    @ObservedObject var batteryViewModel: BatteryViewModel
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @Binding var isDragging: Bool
    @Binding var showClipboardAlert: Bool
    
    
    //MARK: Date formatter
    private func formattedDate(dateFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.string(from: Date()).uppercased()
    }
    
    @State private var isRefreshing = false // Refresh trigger
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    @State private var userInput: String = "Its [day], all day!"
    
    var body: some View {
        ZStack {
            ZStack {
                
                //    Color.yellow
                
                ZStack {
                    
                    Text(formattedDate(dateFormat: "HH:mm"))
                        .font(.system(size: 50).weight(.heavy))
                        .tracking(0)
                        .foregroundColor(Color("#242424")?.opacity(1.0))
                        .offset(x: 0.5, y: -99.5)
                        .shadow(radius: 3)
                    
                    Text(formattedDate(dateFormat: "HH:mm"))
                        .font(.system(size: 50).weight(.heavy))
                        .tracking(0)
                        .foregroundColor(Color("#f3f3f3")?.opacity(1.0))
                        .offset(x: -0.5, y: -100.5)
                    
                    
                    Text(formattedDate(dateFormat: "HH:mm"))
                        .font(.system(size: 50).weight(.heavy))
                        .tracking(0)
                        .foregroundColor(Color("#b0b0b0")?.opacity(1.0))
                        .offset(y: -100)
                    
                }
                
                Image("vr")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400)
                
                ZStack {
                    /*
                    BatteryCircularGuageView(batteryViewModel: batteryViewModel, minValue: 0, maxValue: 100, currentValueLabelFontSize: 10, minMaxValueLabelFontSize: 6, gaugeColor: "#ff1f28", opacity: 1.0, showCurrentValueLabel: true, showMinMaxValueLabels: true, scaleEffect: 2.0, currentValueLabelColor: "#000000", minMaxValueLabelColor: "#ffffff", shadowRadius: 5, shadowOffset: 5)
                     */
                       
                }
                .offset(y: 155)
                .scaleEffect(0.7)
                
                VStack {
                    Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 38, height: 38)
                        .offset(y: 15)
                    
                    Text(DynamicText.Placeholder.temp.withCurrentWeather(currentWeather, unit: .celsius))
                        .lineLimit(1)
                        .font(.system(size: 24).weight(.heavy))
                        .foregroundColor(Color("#b0b0b0"))
                    
                    Text(DynamicText.Placeholder.condition.withCurrentWeather(currentWeather, unit: .celsius))
                        .font(.system(size: 9).weight(.medium))
                        .foregroundColor(Color("#b0b0b0"))
                        .tracking(0)
                }
                .offset(x: 70, y: -28)
                
                VStack(alignment: .center) {
                    Text(formattedDate(dateFormat: "E"))
                        .font(.system(size: 9).weight(.medium))
                        .tracking(10)
                        .foregroundColor(Color("#929292"))
                    Text(formattedDate(dateFormat: "d"))
                        .font(.system(size: 24).weight(.heavy))
                        .foregroundColor(Color("#b0b0b0"))
                    Text(formattedDate(dateFormat: "MMM"))
                        .font(.system(size: 9).weight(.medium))
                        .tracking(10)
                        .foregroundColor(Color("#929292"))
                }
                .foregroundColor(.white)
                .offset(x: -70, y: -10)
                .shadow(radius: 5, y: 3)
            }
            .frame(width: UIScreen.main.bounds.width)
            .contentShape(Rectangle())
            
        }
     
      
        .modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
        .modifier(AlertModifier(showClipboardAlert: $showClipboardAlert, runShortcut: {
            runShortcut() }))
        
    }
}

struct SWAWidget2_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
    }
}
 */



