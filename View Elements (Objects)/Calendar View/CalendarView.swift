//
//  SquareShapeView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//
import SwiftUI

struct CalendarView: View {
    // MARK: - PROPERTIES
    @StateObject var vm = CalendarViewModel()
    @Binding var showMicroControls: Bool
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            VStack(spacing: 3) {
                
                HStack(spacing: 0) {
                    ForEach(vm.days, id: \.self) { day in
                        Text("\(day)")
                            .frame(height: 34)
                            .frame(maxWidth: .infinity)
                            .font(.system(size: vm.appearance.daysTextSize, weight: .bold))
                    }
                }
                .foregroundColor(vm.appearance.daysColor)
             
                VStack(spacing: 6) {
                    
                    ForEach(vm.weeks, id: \.self) { week in
                        ZStack {
                            HStack(spacing: 0) {
                                ForEach(Array(week.enumerated()), id: \.offset) { index, day in
                                    if vm.calendar.isDate(day, equalTo: vm.date, toGranularity: .month) {
                                        ZStack {
                                            fillRange(day: day, week: week, index: index)
                                            
                                            ZStack {
                                                
                                                Text("\(vm.calendar.component(.day, from: day))")
                                                    .font(.system(size: vm.appearance.dateTextSize, weight: .regular))
                                                    .foregroundColor(vm.appearance.dateTextColor)
                                                
                                                //Today Indicator
                                                Circle()
                                                    .frame(width: 4, height: 4)
                                                    .foregroundColor(vm.isToday(day: day) ? (vm.isDateSelected(day: day) ? Color.black : vm.appearance.todayIndicator) : Color.clear)
                                                    .offset(y: 12)
                                            }
                                            .frame(width: 34, height: 34)
                                            .background{
                                                RoundedRectangle(cornerRadius: vm.appearance.dateBackgroundCornerRadius)
                                                    .fill(vm.appearance.dateBackgroundColor)
                                            }
                                        }
                                        .frame(height: 34)
                                        .frame(maxWidth: .infinity)
                                    } else {
                                        Rectangle()
                                            .foregroundColor(Color.clear)
                                            .frame(height: 34)
                                            .frame(maxWidth: .infinity)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            .background(vm.appearance.calendarBackgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: vm.appearance.calendarBackgroundCornerRadius))
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .scaleEffect(0.8)
            .objectAppearanceModifier(layer: vm, systemImageName: "calendar", systemImage2: "", titleText: "Calendar Object", showMicroControls: $showMicroControls)
        }
       
    }
    
    // MARK: - VARS
    @ViewBuilder
    func fillRange(day: Date, week: [Date], index: Int) -> some View {
        HStack(spacing: 0) {
            if vm.isDateSelected(day: day) {
                if day == vm.firstDate {
                    Color.clear
                } else {
                    Color.black
                }
            } else {
                if vm.isDateInRange(day: day) {
                    if index == 0 {
                        Color.clear
                    } else {
                        if vm.isFirstDayOfMonth(date: day) {
                            Color.clear
                        } else {
                            Color.black
                        }
                    }
                } else {
                    Color.clear
                }
            }
            
            if vm.isDateSelected(day: day) {
                if day == vm.secondDate {
                    Color.clear
                } else {
                    if vm.secondDate == nil {
                        Color.clear
                    } else {
                        Color.black
                    }
                }
            } else {
                if vm.isDateInRange(day: day) {
                    if index == week.count - 1 {
                        Color.clear
                    } else {
                        if vm.isLastDayOfMonth(date: day) {
                            Color.clear
                        } else {
                            Color.black
                        }
                    }
                } else {
                    Color.clear
                }
            }
        }
    }
}

