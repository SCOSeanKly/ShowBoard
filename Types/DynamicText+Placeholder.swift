//
//  DynamicText+Placeholder.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//

import Foundation
import WeatherKit
import UIKit


extension DynamicText {
    
    enum Placeholder: String {
        
        // Calendar stuff
        case day = "[day]"
        case date = "[date]"
        case month = "[month]"
        case monthShort = "[monthShort]"
        case monthNumber = "[monthNumber]"
        case year = "[year]"
        case time = "[time]"
        case daysRemaining = "[daysRemaining]"
        case daysCount = "[daysCount]"
        case timeOfDay = "[timeOfDay]"
        case upcomingAppointments = "[upcomingAppointments]"
        
        
        
        
        // ForeCast (DayWeather)
        case highTemp = "[hi]"
        case lowTemp = "[lo]"
        case precipation = "[precip]"
        case precipationChance = "[precipChance]"
        case conditionSymbol = "[conditionSymbol]"
      
        
        // Current weather
        case temp = "[temp]"
        case condition = "[condition]"
        case conditionAsset = "[conditionAsset]"
        case conditionAsset2 = "[conditionaAsset2]"
        case conditionAsset3 = "[conditionaAsset3]"
        case conditionAsset4 = "[conditionaAsset4]"
        case conditionAsset5 = "[conditionaAsset5]"
        case conditionAsset6 = "[conditionaAsset6]"
        
        case dayLight = "[dayLight]"
        case cloudCover = "[cloudCover]"
        case visibility = "[visibility]"
        case dewPoint = "[dewPoint]"
        case humidity = "[humidity]"
        case pressure = "[pressure]"
        case uvIndex = "[uvIndex]"
        case wind = "[wind]"
        case apparentTemperature = "[feelsLike]"
        case location = "[location]"
        
        
        // Battery info
        case batteryLevel = "[batteryLevel]"
        case batteryStatus = "[batteryStatus]"
        
        
        
        public func withCurrentDate() -> String {
            let currentDate = getCurrentDate()
            
            switch self {
            case .day:
                return currentDate.day
            case .date:
                return currentDate.date
            case .month:
                return currentDate.month
            case .monthShort:
                return currentDate.monthShort
            case .monthNumber:
                return currentDate.monthNumber
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
        
        
        public func withUpcomingAppointments(appointmentManager: AppointmentManager) -> String {
            switch self {
              
                case .upcomingAppointments:
                    var upcomingAppointmentsCount = 0
                    appointmentManager.fetchUpcomingAppointments { count in
                        upcomingAppointmentsCount = count
                    }
                    return "\(upcomingAppointmentsCount)"
                default:
                    return "NO DATA"
            }
        }

        
        public func withBatteryInfo(_ batteryViewModel: BatteryViewModel) -> String {
          
               switch self {
               case .batteryLevel:
                   return "\(batteryViewModel.batteryLevel)%"
               case .batteryStatus:
                   return "\(batteryViewModel.batteryStateDescription)"
               default:
                   return ""
               }
           }
        
    
        public func withDayWeather(_ data: DayWeather?, unit: UnitTemperature, useMiles: Bool = false, conditionAssetStyle: Int) -> String {
            
            guard let val = data else { return "-" }
            
            switch self {
            case .lowTemp:
                return self.tempteratureToString(value: val.lowTemperature, unit)
            case .highTemp:
                return self.tempteratureToString(value: val.highTemperature, unit)
            case .precipation:
                  return "\(val.precipitationAmount)"
              case .precipationChance:
                  return String(format: "%.0f%%", val.precipitationChance * 100)
            case .conditionSymbol:
                return String(val.symbolName)
            case .conditionAsset:
                switch conditionAssetStyle {
                case 1:
                    return val.condition.asset
                case 2:
                    return val.condition.asset2
                case 3:
                    return val.condition.asset3
                case 4:
                    return val.condition.asset4
                case 5:
                    return val.condition.asset5
                case 6:
                    return val.condition.asset6
                default:
                    return ""
                }
            default:
                return ""
            }
        }
      
    
        public func withCurrentWeather(_ data: CurrentWeather?, unit: UnitTemperature, useMiles: Bool = false) -> String {
            
            guard let v = data else { return "-" }
            
            switch self {
            case .temp:
                return self.tempteratureToString(value: v.temperature , unit)
            case .condition:
                return v.condition.description
            case .conditionAsset:
                return v.condition.asset
            case .conditionAsset2:
                return v.condition.asset2
            case .conditionAsset3:
                return v.condition.asset3
            case .conditionAsset4:
                return v.condition.asset4
            case .conditionAsset5:
                return v.condition.asset5
            case .conditionAsset6:
                return v.condition.asset6
            case .dayLight:
                return v.isDaylight ? "Day Time" : "Night Time"
            case .cloudCover:
                return String(round(v.cloudCover * 100)) + " %"
            case .visibility:
                return self.lengthToString(value: v.visibility, useMiles: useMiles)
            case .dewPoint:
                return self.tempteratureToString(value: v.dewPoint, unit)
            case .humidity:
                return String(round(v.humidity * 100)) + " %"
            case .pressure:
                return "\(v.pressure)" + " mbar"
            case .uvIndex:
                return "\(v.uvIndex)"
            case .apparentTemperature:
                return self.tempteratureToString(value: v.apparentTemperature, unit)
            case .wind:
                return self.speedToString(value: v.wind.speed, useMiles: useMiles)
          
            default:
                return ""
            }
        }
        
        
       
        private func tempteratureToString(value: Measurement<UnitTemperature>, _ unit: UnitTemperature) -> String {
            var ret: String = ""
            let convertedTemp = value.converted(to: unit)
            
            let formatter = MeasurementFormatter()
            formatter.unitStyle = .short
            
            let temperatureUnit: UnitTemperature = {
                if Locale.current.measurementSystem == .metric {
                    return .celsius
                } else {
                    return .fahrenheit
                }
            }()
            
            formatter.numberFormatter.maximumFractionDigits = (temperatureUnit == .celsius) ? 0 : 0
           
            ret = formatter.string(from: convertedTemp)
            
            return ret
        }


        private func lengthToString(value: Measurement<UnitLength>, useMiles: Bool = false) -> String {
            let val = value.converted(to: useMiles ? .miles : .kilometers).value
            return String(format: "%.1f", val) + (useMiles ? "mile" : "km")
        }
        
        
        private func speedToString(value: Measurement<UnitSpeed>, useMiles: Bool = false) -> String {
            let val = value.converted(to: useMiles ? .milesPerHour : .kilometersPerHour).value
            return String(round(val)) + (useMiles ? "mph" : "km/h")
        }
        
        private func getCurrentDate() -> (day: String, date: String, month: String, monthShort: String, monthNumber: String, year: String, time: String, timeOfDay: String) {
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
            
            formatter.dateFormat = "MMM"
            let monthShort = formatter.string(from: Date())
            
            formatter.dateFormat = "M"
            let monthNumber = formatter.string(from: Date())
            
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
            
            return (day, date, month, monthShort, monthNumber, year, time, timeOfDay)
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
