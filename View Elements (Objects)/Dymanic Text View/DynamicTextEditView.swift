//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

import SwiftUI
import UIKit


struct DynamicTextView: View {
    
    @StateObject var text: TextObject
    @State private var showSettings: Bool = false
    
    @Binding var isKeyboardPresented: Bool
    @State private var isPressing: Bool = false
   
    
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                    if !isKeyboardPresented {
                        HStack {
                          
                            Text("Enter text...")
                                .font(.headline.weight(.heavy))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Spacer()
                        }
                    } else {
                        Button {
                           hideKeyboard()
                        } label: {
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                        Text("\(Image(systemName: "keyboard.chevron.compact.down")) Hide Keyboard")
                                            .font(.system(size: 14).weight(.semibold))
                                }
                                
                                HStack {
                                    Text("Enter text...")
                                        .font(.headline.weight(.heavy))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                        }
                    }
                   
                    Spacer()
                }
                .padding(.horizontal)
                
                TextEditor(text: $text.inputText)
                .frame(height: isKeyboardPresented ? 100 : 40)
                                  .padding(5)
                                  .background(.ultraThinMaterial)
                                  .padding(.horizontal)
                                  .scrollDismissesKeyboard(.immediately)
                                  .onReceive(keyboardPublisher) { value in
                                       isKeyboardPresented = value
                                     }
                                 
                if isKeyboardPresented {
                    VStack {
                        // Dynamic Abbreviations Section
                        Group {
                            HStack {
                                Text("Dynamic Abbreviations:")
                                    .font(.system(size: 14).weight(.semibold))
                                
                                Spacer()
                            }
                            .padding(.bottom, 1)
                        }
                        
                        // Dynamic Date Section
                        Group {
                            HStack {
                                Text("Date:")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .font(.system(size: 10))
                                +
                                Text("[day], [date], [month], [year], [time], [daysRemaining], [daysCount], [timeOfDay]")
                                    .font(.system(size: 10))
                                
                                Spacer()
                            }
                            .padding(.bottom, 1)
                        }
                        
                        // Dynamic Weather Section
                        Group {
                            HStack {
                                Text("Weather:")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .font(.system(size: 10))
                                +
                                Text("[condition], [temp], [dayLight], [cloudCover], [visibility], [dewPoint], [humidity], [pressure], [uvIndex], [apparentTemperature], [wind]")
                                    .font(.system(size: 10))
                                
                                Spacer()
                            }
                            .padding(.bottom, 1)
                        }
                        
                    }
                    .padding(.horizontal)
                }
                   
              

                
                    Spacer()
     
            }
        
        }
    }


extension Text {
    func fontStyle(_ style: Font.TextStyle) -> Text {
        return self.font(.system(style))
    }
}


#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif



