//
//  DynamicText+Placeholder.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//

import Foundation
import WeatherKit


extension DynamicText {
    
    enum Placeholder: String {
        
        case day = "[day]"
        case date = "[date]"
        case month = "[month]"
        case year = "[year]"
        case time = "[time]"
        case daysRemaining = "[daysRemaining]"
        case daysCount = "[daysCount]"
        case timeOfDay = "[timeOfDay]"
        
        // ForeCast (DayWeather)
        case highTemp = "[hi]"
        case lowTemp = "[lo]"
        case temp = "[temp]"
        
        // Current weather
        case condition = "[condition]"
        case conditionAsset = "[conditionAsset]"
        case dayLight = "[dayLight]"
        case cloudCover = "[cloudCover]"
        case visibility = "[visibility]"
        case dewPoint = "[dewPoint]"
        case humidity = "[humidity]"
        case pressure = "[pressure]"
        case uvIndex = "[uvIndex]"
        case wind = "[wind]"
        case apparentTemperature = "[apparentTemperature]"
        
        
        
        
        public func withDayWeather(_ data: DayWeather?, unit: UnitTemperature) -> String {
            
            guard let v = data else { return "-" }
            
            switch self {
            case .lowTemp:
                return self.tempteratureToSting(value: v.lowTemperature, unit)
            case .highTemp:
                return self.tempteratureToSting(value: v.highTemperature, unit)
            default:
                return ""
            }
        }
        
        
        public func withCurrentWeather(_ data: CurrentWeather?, unit: UnitTemperature, useMiles: Bool = false) -> String {
            
            guard let v = data else { return "-" }
            
            switch self {
            case .temp:
                return self.tempteratureToSting(value: v.temperature , unit)
            case .condition:
                return v.condition.description
            case .conditionAsset:
                return v.condition.asset
            case .dayLight:
                return v.isDaylight ? "Day Time" : "Night Time"
            case .cloudCover:
                return String(round(v.cloudCover))
            case .visibility:
                return self.lengthToSting(value: v.visibility, useMiles: useMiles)
            case .dewPoint:
                return self.tempteratureToSting(value: v.dewPoint, unit)
            case .humidity:
                return String(round(v.humidity * 100)) + " %"
            case .pressure:
                return "\(v.pressure)" + " mbar"
            case .uvIndex:
                return "\(v.uvIndex)"
            case .apparentTemperature:
                return self.tempteratureToSting(value: v.apparentTemperature, unit)
            case .wind:
                return self.speedToSting(value: v.wind.speed, useMiles: useMiles)

            default:
                return ""
            }
        }
        
        
        
        
        
        
        
        
        
        private func tempteratureToSting(value: Measurement<UnitTemperature>, _ unit: UnitTemperature) -> String {
            var ret: String = ""
            let convertedTemp = value.converted(to: unit)
            let formattedTemp = String(format: "%.1f", convertedTemp.value)
            ret = "\(formattedTemp)°"
            
            switch unit {
            case .celsius: ret += "C"
            case .fahrenheit: ret += "F"
            case .kelvin: ret += "K"
            default:
                break // show only raw value
            }
            
            return ret
        }
        
        
        private func lengthToSting(value: Measurement<UnitLength>, useMiles: Bool = false) -> String {
            let val = value.converted(to: useMiles ? .miles : .kilometers).value
            return String(format: "%.1f", val) + (useMiles ? "mile" : "km")
        }
        
        
        private func speedToSting(value: Measurement<UnitSpeed>, useMiles: Bool = false) -> String {
            let val = value.converted(to: useMiles ? .milesPerHour : .kilometersPerHour).value
            return String(round(val)) + (useMiles ? "mph" : "km/h")
        }
        
    }
    
    
    
}
