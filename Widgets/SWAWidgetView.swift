//
//  WidgetView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI
import WeatherKit

struct SWAWidgetView: View {
    @ObservedObject var batteryViewModel: BatteryViewModel
    @ObservedObject var locationDataManager: LocationDataManager
    @ObservedObject var weatherKitManager: WeatherKitManager
    @Binding var importedBackground: UIImage?
    
    
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
    
    
    var body: some View {
        ZStack {
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 165)
                    .foregroundColor(.black.opacity(0.1))
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotationEffect(Angle(degrees: -20), anchor: .center)
                    .shadow(radius: 5, y: 3)
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 150, height: 165)
                    .foregroundColor(.white)
                    .shadow(radius: 5, y: 3)
                
                RoundedRectangle(cornerRadius: 13)
                    .foregroundColor(.gray)
                    .frame(width: 130, height: 115)
                    .offset(y: -15)
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    
                   MapExtensionView(locationDataManager: locationDataManager)
                        .frame(width: 150, height: 160)
                    
                    /// Frame needs cropped to remove Apple legal info
                    
                }
                .frame(width: 130, height: 115)
                .cornerRadius(13)
                .offset(y: -15)
                
                VStack(alignment: .trailing) {
                    HStack {
                        
                        Spacer()
                        
                        Text("Battery \(batteryViewModel.batteryLevel)%")
                            .font(.custom("Autone", size: 18))
                            .foregroundColor(.white)
                            .foregroundColor(.white.opacity(0.75))
                            .multilineTextAlignment(.trailing)
                            .shadow(radius: 3)
                    }
                }
                .frame(width: 130, height: 115)
                .offset(x: -5, y: 95)
                
                HStack {
                    
                    Spacer()
                    
                    Text(DynamicText.Placeholder.dayLight.withCurrentWeather(currentWeather, unit: .celsius))
                        .lineLimit(1)
                        .font(.custom("Autone", size: 14))
                        .foregroundColor(.black.opacity(0.5))
                    
                    Image("Icon")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .cornerRadius(6)
                }
                .frame(width: 125)
                .offset(y: 62)
            }
            .offset(x: 80)
            
            VStack(alignment: .trailing) {
                Image(DynamicText.Placeholder.conditionAsset.withCurrentWeather(currentWeather, unit: .celsius))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                
                Text(DynamicText.Placeholder.condition.withCurrentWeather(currentWeather, unit: .celsius))
                    .font(.custom("Autone", size: 20))
                    .foregroundColor(.white)
                
                Text(formattedDate(dateFormat: "E. d MMM"))
                    .font(.custom("Autone", size: 26))
                    .foregroundColor(.white)
                
                Text(DynamicText.Placeholder.temp.withCurrentWeather(currentWeather, unit: .celsius))
                    .font(.custom("Autone", size: 24))
                    .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .offset(x: -100)
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
}

struct SWAWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

