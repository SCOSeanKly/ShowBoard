//
//  SWAWidget3.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

//
//  SWAWidget3.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

import SwiftUI
import WeatherKit

struct SWAWidget3: View {
 
        @ObservedObject var batteryViewModel: BatteryViewModel
        @ObservedObject var locationDataManager: LocationDataManager
        @ObservedObject var weatherKitManager: WeatherKitManager
        
        @Binding var offsetX: CGFloat
        @Binding var offsetY: CGFloat
        @Binding var widthRatio: CGFloat
        @Binding var heightRatio: CGFloat
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
            weatherKitManager.weather?.currentWeather
        }
        
        var todaysForecast: DayWeather? {
            weatherKitManager.getGorecast(offset: 0)
        }
        
        @State private var userInput: String = "Its [day], all day!"
    
    var body: some View {
        ZStack {
            ZStack {
                
                //    Color.yellow
                
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.clear)
                    .frame(width: 250, height: 120)
                    .background(
                        .ultraThinMaterial,
                        in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    )
                    .environment(\.colorScheme, .dark)
                    .shadow(radius: 5)
                
                
                VStack {
                    
                    Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 68, height: 68)
                        .offset(y: -7)
                    
                    HStack{
                        Text(DynamicText.Placeholder.temp.withCurrentWeather(currentWeather, unit: .celsius))
                            .lineLimit(1)
                            .font(.system(size: 12).weight(.light))
                            .tracking(8)
                            .foregroundColor(Color("#b0b0b0"))
                        
                        Text("&")
                            .lineLimit(1)
                            .font(.system(size: 12).weight(.light))
                            .tracking(8)
                            .foregroundColor(Color("#b0b0b0"))
                        
                        Text(DynamicText.Placeholder.condition.withCurrentWeather(currentWeather, unit: .celsius).uppercased())
                            .font(.system(size: 12).weight(.light))
                            .tracking(8)
                            .foregroundColor(Color("#b0b0b0"))
                            .tracking(0)
                    }
                    .offset(y: -13)
                    .shadow(radius: 5, y: 3)
                }
                .offset(x: 0, y: 15)
                
                
                VStack(alignment: .center) {
                    Text(formattedDate(dateFormat: "E, dd, MMM"))
                        .font(.system(size: 12).weight(.medium))
                        .tracking(8)
                        .foregroundColor(Color("#b0b0b0"))
                    
                }
                .foregroundColor(.white)
                .offset(x: 0, y: -40)
                .shadow(radius: 5, y: 3)
                .task {
                    
                    do {
                        try await weatherKitManager.getWeather(locationDataManager.location)
                    }
                    catch { } // handle error here
                }
            }
            .frame(width: UIScreen.main.bounds.width)
            .contentShape(Rectangle())
            
        }
        .scaleEffect(x: widthRatio, y: heightRatio, anchor: .center)
        .offset(x: offsetX, y: offsetY)
        .modifier(WidgetModifier(isDragging: $isDragging))
        .modifier(AlertModifier(showClipboardAlert: $showClipboardAlert, runShortcut: {
            runShortcut() }))
    }
}

struct SWAWidget3_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
    }
}




