//
//  SquareShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI

class CalendarViewModel: LayerObject {
    
    var calendar = Calendar.current
    @Published var date = Date()
    
    @Published var firstDate: Date? = nil
    @Published var secondDate: Date? = nil
    
    @Published var daysTextSize: CGFloat = 12
    @Published var daysColor: Color = Color.white
    @Published var dateTextColor: Color = Color.white
    @Published var dateTextSize: CGFloat = 12
    @Published var dateBackgroundColor: Color = Color.gray.opacity(0.5)
    @Published var dateBackgroundCornerRadius: CGFloat = 50
    @Published var calendarBackgroundColor: Color = Color.clear
    @Published var calendarBackgroundCornerRadius: CGFloat = 20
    @Published var todayIndicator: Color = Color.red
    
    
    
    var weeks: [[Date]] {
        calendar.firstWeekday = 2
        var weeks = [[Date]]()
        let range = calendar.range(of: .weekOfYear, in: .month, for: date)!
        for week in range {
            var weekDays = [Date]()
            for day in 1...7 {
                let date = calendar.date(byAdding: .day, value: day-1, to: date.startOfMonth(calendar).startOfWeek(week, calendar: calendar))!
                weekDays.append(date)
            }
            weeks.append(weekDays)
        }
        
        if weeks.count == 5 {
            let startDate = calendar.date(byAdding: .day, value: 1, to: weeks.last!.last!)!
            var weekDays = [startDate]
            for day in 1...6 {
                let date = calendar.date(byAdding: .day, value: day, to: startDate)!
                weekDays.append(date)
            }
            weeks.append(weekDays)
        }
        
        return weeks
    }
    
    var days: [String] {
        ["MO", "TU", "WE", "TH", "FR", "SA", "SU"]
    }
    
    
    
    var selectedDateRange: ClosedRange<Date>? {
        if let firstDate = firstDate, let secondDate = secondDate {
            return firstDate...secondDate
        }
        return nil
    }
    
    init(_ currentDate: Date = Date()) {
        date = currentDate
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .calendar
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        self.objectType = .calendar
    }
    
    func selectDay(_ day: Date) {
        if firstDate == nil {
            firstDate = day
        } else if secondDate == nil {
            if let first = firstDate {
                if first > day {
                    secondDate = first
                    firstDate = day
                } else {
                    secondDate = day
                }
            }
        } else {
            firstDate = day
            secondDate = nil
        }
    }
    
    func isToday(day: Date) -> Bool {
        return calendar.isDateInToday(day)
    }
    
    func isDateInRange(day: Date) -> Bool {
        if secondDate == nil {
            if let firstDate {
                return firstDate == day
            }
        } else {
            if let firstDate = firstDate, let secondDate = secondDate {
                return day >= firstDate && day <= secondDate
            }
        }
        return false
    }
    
    func isDateSelected(day: Date) -> Bool {
        if secondDate == nil {
            if let firstDate {
                return firstDate == day
            }
        } else {
            if let firstDate, let secondDate {
                return ((firstDate == day) || (secondDate == day))
            }
        }
        return false
    }
    
    func isFirstDayOfMonth(date: Date) -> Bool {
        let components = calendar.dateComponents([.day], from: date)
        return components.day == 1
    }
    
    func isLastDayOfMonth(date: Date) -> Bool {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let lastDayOfMonth = calendar.range(of: .day, in: .month, for: date)!.upperBound - 1
        return components.day == lastDayOfMonth
    }
    
    func dateToStr(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    func titleForMonth() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date).uppercased()
    }
    
    func titleForYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    
    func selectBackMonth() {
        date = calendar.date(byAdding: .month, value: -1, to: date) ?? Date()
    }
    
    func selectForwardMonth() {
        date = calendar.date(byAdding: .month, value: 1, to: date) ?? Date()
    }
    
    func selectBackYear() {
        date = calendar.date(byAdding: .year, value: -1, to: date) ?? Date()
    }
    
    func selectForwardYear() {
        date = calendar.date(byAdding: .year, value: 1, to: date) ?? Date()
    }
}

extension Date {
    func startOfMonth(_ calendar: Calendar) -> Date {
        return calendar.date(from: calendar.dateComponents([.year, .month], from: calendar.startOfDay(for: self)))!
    }
    
    func startOfWeek(_ week: Int, calendar: Calendar) -> Date {
        var components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        components.weekOfYear = week
        components.weekday = calendar.firstWeekday
        return calendar.date(from: components)!
    }
}
