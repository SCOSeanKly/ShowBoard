//
//  DateFormatter.swift
//  ShowBoard
//
//  Created by Sean Kelly on 22/06/2023.
//
/*
import SwiftUI

//MARK: Used in Dynamic Text View

extension View {
    
    func replacePlaceholder(_ placeholder: String, with replacement: String, in text: String, options: NSRegularExpression.Options) -> String {
        do {
            let pattern = NSRegularExpression.escapedPattern(for: placeholder)
            let regex = try NSRegularExpression(pattern: pattern, options: options)
            let range = NSRange(location: 0, length: text.utf16.count)
            return regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: replacement)
        } catch {
            print("Error replacing placeholder: \(error)")
            return text
        }
    }
    
    func getCurrentDate() -> (day: String, date: String, month: String, year: String, time: String, timeOfDay: String) {
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
    
    func daysRemaining() -> Int {
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
    
    func daysCount() -> Int {
        let calendar = Calendar.current
        let currentDate = calendar.startOfDay(for: Date())
        guard let startOfYear = calendar.date(from: calendar.dateComponents([.year], from: currentDate)) else {
            return 0
        }
        let components = calendar.dateComponents([.day], from: startOfYear, to: currentDate)
        return (components.day ?? 0) + 1
    }
}
*/
