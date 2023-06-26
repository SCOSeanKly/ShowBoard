//
//  replaceText.swift
//  ShowBoard
//
//  Created by Sean Kelly on 22/06/2023.
//

import SwiftUI

struct DynamicTextView: View {
    
    @State private var userInput: String = ""
    
    var replacedText: String {
        let currentDate = getCurrentDate()
        var text = userInput
        
        let pattern = /\[.*?i\]/
        let regex = Regex(pattern)
        //let line1 = line.replacing(/\s+/,with:",")
        
        
        while true {
            guard let match = userInput.firstMatch(of: regex)
            else { break }
            print()
        }
        
        
        
        /*text = replacePlaceholder("[day]", with: currentDate.day, in: text, options: regexOptions)
        text = replacePlaceholder("[date]", with: currentDate.date, in: text, options: regexOptions)
        text = replacePlaceholder("[month]", with: currentDate.month, in: text, options: regexOptions)
        text = replacePlaceholder("[year]", with: currentDate.year, in: text, options: regexOptions)
        text = replacePlaceholder("[time]", with: currentDate.time, in: text, options: regexOptions)
        text = replacePlaceholder("[daysRemaining]", with: "\(daysRemaining())", in: text, options: regexOptions)
        text = replacePlaceholder("[daysCount]", with: "\(daysCount())", in: text, options: regexOptions)
        text = replacePlaceholder("[timeofday]", with: currentDate.timeOfDay, in: text, options: regexOptions)*/
        
        return text
    }
    
    var body: some View {
        VStack {
            
            HStack{
                Text("Enter text...")
                    .font(.headline.weight(.heavy))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
            
            TextEditor(text: $userInput)
                .frame(height: 150)
                .padding(5)
                .background(.ultraThinMaterial)
                .padding(.horizontal)
            
            HStack{
                Text("Dymanic Abbreviations: ")
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(.black) +
                
            Text("[day], [date], [month], [year], [time], [daysRemaining], [daysCount], [timeofday]")
                                .font(.system(size: 10))
                                .foregroundColor(.black)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 5)
          

//        
//            Text(replacedText)
//                .font(.custom("Autone", size: 26))
//                .multilineTextAlignment(.center)
//                .padding()
            
            
        }
        .padding(.horizontal)
    }
    
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

struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}



