//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

extension View {
    func replacePlaceholders(userInput: String) -> some View {
        var text = userInput
        let pattern = "\\[.*?\\]"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: userInput, range: NSRange(userInput.startIndex..., in: userInput))
        
        for match in matches {
            let range = match.range
            let tag = String(userInput[Range(range, in: userInput)!])
            
            guard let placeholder = DynamicText.Placeholder(rawValue: tag) else {
                continue
            }
            
            text = text.replacingOccurrences(
                of: tag,
                with: placeholder.withCurrentDate()
            )
        }
        
        return AnyView(Text(text))
    }
}

struct DynamicTextView: View {
    @State private var userInput: String = "day: [day], year: [year]"
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
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
                
                HStack {
                    Text("Dynamic Abbreviations: ")
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
                    Text(userInput)
                        .replacePlaceholders(userInput: userInput)
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
    }
}



struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}


