//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI
import UIKit


struct DynamicTextView: View {
    
    @StateObject var text: TextObject
    
    @State private var isPressing: Bool = false
    @State private var insertedKeyword: [String] = []

   
    private let placeholdersDate = ["[day]", "[date]", "[month]", "[monthNumber]", "[monthShort]", "[year]", "[time]", "[daysRemaining]", "[daysCount]", "[timeOfDay]"]
    
    private let placeholdersWeather = ["[condition]", "[temp]", "[dayLight]", "[cloudCover]", "[visibility]", "[dewPoint]", "[humidity]", "[pressure]", "[uvIndex]", "[feelsLike]", "[wind]"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                if !text.isKeyboardPresented {
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
                        .padding(.top)
                    }
                   
                    Spacer()
                }
                .padding(.horizontal)
               
            TextEditor(text: $text.inputText)  // Use the published property here
                              .frame(height: text.isKeyboardPresented ? 100 : 40)
                              .padding(5)
                              .background(.ultraThinMaterial)
                              .padding(.horizontal)
                              .scrollDismissesKeyboard(.immediately)
                              .onReceive(keyboardPublisher) { value in
                                  text.isKeyboardPresented = value
                              }

            if text.isKeyboardPresented {
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
                                LazyHGrid(rows: gridItems, spacing: 5) {
                                    Text("Date:")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .font(.system(size: 10))
                                    
                                    ForEach(placeholdersDate, id: \.self) { placeholder in
                                        Button {
                                            text.inputText += placeholder
                                        } label: {
                                            Text("\(placeholder)")
                                                .font(.system(size: 10))
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 5)
                                        }
                                        .fixedSize()
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.bottom, 1)
                                
                                Spacer()
                            }
                        }
                        
                        Divider()
                            .padding(.horizontal)
                        
                        // Dynamic Weather Section
                        Group {
                            HStack {
                                LazyHGrid(rows: gridItems, spacing: 5) {
                                    Text("Weather:")
                                        .fontWeight(.semibold)
                                        .foregroundColor(.black)
                                        .font(.system(size: 10))
                                    
                                    ForEach(placeholdersWeather, id: \.self) { placeholder in
                                        Button {
                                            text.inputText += placeholder
                                        } label: {
                                            Text("\(placeholder)")
                                                .font(.system(size: 10))
                                                .padding(.horizontal, 5)
                                                .padding(.vertical, 5)
                                        }
                                        .fixedSize()
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.bottom, 1)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                   
            Spacer()
                .frame(height: 100)
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



