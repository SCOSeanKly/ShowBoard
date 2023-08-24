//
//  DynamicText.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//

import Foundation


struct DynamicText {
    
    @MainActor static func convert(input: String, wk: WeatherObserver) -> String {
        var text = input
        let pattern = "\\[.*?\\]"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
        
        
        for match in matches {
            let range = match.range
            let tag = String(input[Range(range, in: input)!])
            
            guard let placeholder = DynamicText.Placeholder(rawValue: tag) else {
                continue
            }
            
            var replacement = ""
            
            switch placeholder {
            case .condition:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .temp:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .conditionAsset:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .dayLight:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .cloudCover:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .visibility:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .dewPoint:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .humidity:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .pressure:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .uvIndex:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .apparentTemperature:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            case .wind:
                replacement = placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            
            case .highTemp:
                replacement = placeholder.withDayWeather(
                    wk.weather?.dailyForecast.first,
                    unit: .celsius, conditionAssetStyle: 1
                )
            case .lowTemp:
                replacement = placeholder.withDayWeather(
                    wk.weather?.dailyForecast.first,
                    unit: .celsius, conditionAssetStyle: 1
                )
                
            case .conditionSymbol:
                replacement = placeholder.withDayWeather(
                    wk.weather?.dailyForecast.first,
                    unit: .celsius, conditionAssetStyle: 1
                )
                
            case .precipation:
                replacement = placeholder.withDayWeather(
                    wk.weather?.dailyForecast.first,
                    unit: .celsius, conditionAssetStyle: 1)
                
            case .precipationChance:
                replacement = placeholder.withDayWeather(
                    wk.weather?.dailyForecast.first,
                    unit: .celsius, conditionAssetStyle: 1)
                
            case .batteryLevel:
                replacement = placeholder.withBatteryInfo(BatteryViewModel())
                
            case .batteryStatus:
                replacement = placeholder.withBatteryInfo(BatteryViewModel())
                
            case .upcomingAppointments:
                replacement = placeholder.withUpcomingAppointments(appointmentManager: AppointmentManager())
                
            default:
                replacement = placeholder.withCurrentDate()
            }
            
            text = text.replacingOccurrences(of: tag, with: replacement)
        }


        
        return text
    }

}
