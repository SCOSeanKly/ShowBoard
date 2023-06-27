//
//  replaceText.swift
//  ShowBoard
//
//  Created by Sean Kelly on 22/06/2023.
//

import SwiftUI

struct DynamicTextView: View {
    
    @State private var userInput: String = "day: [day], year: [year]"
    
    
    
    var replacedText: String {
        var text = userInput
        let pattern = /\[.*?\]/
        let regex = Regex(pattern)
        let matches = userInput.matches(of: regex)
        
        for i in matches
        {
            let range = i.range
            let tag = userInput.substring(with: range)
            
            guard let placeholder = DynamicText.Placeholder(rawValue: tag)
            else { continue }
            
            text = text.replacingOccurrences(
                of: tag,
                with: placeholder.withCurrentDate()
            )
        }
        return text
    }
    
    
    
    var body: some View {
        ScrollView {
            
            HStack{
                Text("Enter text...")
                    .font(.headline.weight(.heavy))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
            
            TextEditor(text: $userInput)
                .frame(height: 100)
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
            
            HStack {
                Text(replacedText)
                    .font(.custom("Autone", size: 26))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 5)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
            }
            .padding(.leading)
            
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
}

struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}



