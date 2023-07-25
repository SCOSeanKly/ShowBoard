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
            
            Button(action: { text.appearance.rotation = Angle(degrees: 45) }) { Text("ROTATE TEST") }
            
            VStack {
                HStack {
                    Text("Enter text...(Tap to show Settings)")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .onTapGesture {
                            showSettings.toggle()
                        }
                    
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
                    
                    Text("[day], [date], [month], [year], [time], [daysRemaining], [daysCount], [timeofday]")
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 5)
                
                HStack {
                    Text(text.dynamicText)
                        .shadow(
                            radius: text.appearance.shadow.radius,
                            x: text.appearance.shadow.offset.x,
                            y: text.appearance.shadow.offset.y
                        )
                        .font(text.font)
                        .tracking(text.fontTracking)
                        .multilineTextAlignment(text.textAlignment)
                        .fontWeight(text.fontWeight)
                        .foregroundColor(text.fontColor)
                        .blendMode(text.appearance.blendMode)
                        .rotationEffect(text.appearance.rotation)
                        .opacity(text.appearance.opacity)
                        .blur(radius: text.appearance.blur)
                    
                    Spacer()
                }
                .padding(.leading)
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $showSettings){
            // MARK: Settings for Dynamic Text
            DynamicTextEditViewSettings(text: text)
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


