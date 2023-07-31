//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI


struct DynamicTextView: View {
    
    @StateObject var text: TextObject
    @State private var showSettings: Bool = false
    
    
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
                
                TextEditor(text: $text.inputText)
                    .frame(height: 100)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .padding(.horizontal)
                
                
                HStack {
                    Text("Dynamic Abbreviations: ")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .foregroundColor(.black) +
                    
                    Text("[day], [date], [month], [year], [time], [daysRemaining], [daysCount], [timeOfDay]")
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 5)
            }
        
        }
    }
}

extension Text {
    func fontStyle(_ style: Font.TextStyle) -> Text {
        return self.font(.system(style))
    }
}


struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView(text: TextObject())
    }
}


