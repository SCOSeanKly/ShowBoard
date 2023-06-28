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
        
        // Calendar stuff
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
        
        
        
        
        public func withCurrentDate() -> String {
            let currentDate = getCurrentDate()
            
            switch self {
                
            case .day:
                return currentDate.day
            case .date:
                return currentDate.date
            case .month:
                return currentDate.month
            case .year:
                return currentDate.year
            case .time:
                return currentDate.time
            case .daysRemaining:
                return String(daysRemaining())
            case .daysCount:
                return String(daysCount())
            case .timeOfDay:
                return currentDate.timeOfDay
            default:
                return ""
            }
        }
        
        
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
            let formattedTemp = String(format: "%.0f", convertedTemp.value) // change format for temp
            ret = "\(formattedTemp)°"
            
            switch unit {
            case .celsius: ret += "" // add C
            case .fahrenheit: ret += "" // add F
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
        
        private func getCurrentDate() -> (day: String, date: String, month: String, year: String, time: String, timeOfDay: String) {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            let day = formatter.string(from: Date())
            
            formatter.dateFormat = "dd"
            let dayNumber = Int(formatter.string(from: Date())) ?? 0
            var dateSuffix = "th"
            switch dayNumber {
            case 1, 21, 31:
                dateSuffix = "st"
            case 2, 22:
                dateSuffix = "nd"
            case 3, 23:
                dateSuffix = "rd"
            default:
                dateSuffix = "th"
            }
            let date = "\(dayNumber)\(dateSuffix)"
            
            formatter.dateFormat = "MMMM"
            let month = formatter.string(from: Date())
            
            formatter.dateFormat = "yyyy"
            let year = formatter.string(from: Date())
            
            formatter.dateFormat = "HH:mm"
            let time = formatter.string(from: Date())
            
            let hour = Calendar.current.component(.hour, from: Date())
            let timeOfDay: String
            switch hour {
            case 6..<12:
                timeOfDay = "Morning"
            case 12..<18:
                timeOfDay = "Afternoon"
            case 18..<22:
                timeOfDay = "Evening"
            default:
                timeOfDay = "Night"
            }
            
            return (day, date, month, year, time, timeOfDay)
        }
        
        private func daysRemaining() -> Int {
            let calendar = Calendar.current
            let currentDate = calendar.startOfDay(for: Date())
            guard let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: currentDate)),
                  let endOfYear = calendar.date(byAdding: DateComponents(year: 1, day: -1), to: startOfYear)
            else {
                return 0
            }
            let components = calendar.dateComponents([.day], from: currentDate, to: endOfYear)
            return components.day ?? 0
        }
        
        private func daysCount() -> Int {
            let calendar = Calendar.current
            let currentDate = calendar.startOfDay(for: Date())
            guard let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: currentDate)) else {
                return 0
            }
            let components = calendar.dateComponents([.day], from: startOfYear, to: currentDate)
            return (components.day ?? 0) + 1
        }
        
    }
    
    
    
}
