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
    
    private let placeholdersWeather = ["[condition]", "[temp]", "[feelsLike]", "[hi]", "[lo]", "[precip]", "[precipChance]", "[dayLight]", "[cloudCover]", "[visibility]", "[dewPoint]", "[humidity]", "[pressure]", "[uvIndex]", "[wind]", "[sunrise]", "[sunset]"]
    
    private let plcaeholdersLocation = ["[city]", "[street]", "[state]", "[country]", "[postalCode]", "[latitude]", "[longitude]", "[neighborhood]"]
    
    private let placeholdersBattery = ["[batteryLevel]", "[batteryStatus]", "[batteryColor]"]
    
    private let placeholderCalendar = ["[upcomingAppointments]"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                
                if !text.appearance.isKeyboardPresented {
                        HStack {
                            if text.appearance.inputText.isEmpty {
                                Text("Enter text...")
                                    .font(.headline.weight(.heavy))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                            } else {
                                Button {
                                    text.appearance.inputText = "Enter text..."
                                } label: {
                                    Text("\(Image(systemName: "xmark")) Clear Text")
                                        .font(.system(size: 14).weight(.semibold))
                                      
                                }
                            }
                            
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
                                    if text.appearance.inputText.isEmpty {
                                        Text("Enter text...")
                                            .font(.headline.weight(.heavy))
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    } else {
                                        Button {
                                            text.appearance.inputText = ""
                                        } label: {
                                            Text("\(Image(systemName: "xmark")) Clear Text")
                                                .font(.system(size: 14).weight(.semibold))
                                              
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        .padding(.top)
                    }
                   
                    Spacer()
                }
                .padding(.horizontal)
               
            TextEditor(text: $text.appearance.inputText)
                .frame(height: text.appearance.isKeyboardPresented ? 100 : 40)
                              .padding(5)
                              .background(.ultraThinMaterial)
                              .padding(.horizontal)
                              .scrollDismissesKeyboard(.immediately)
                              .onReceive(keyboardPublisher) { value in
                                  text.appearance.isKeyboardPresented = value
                              }
                             

            if text.appearance.isKeyboardPresented {
                    VStack {
                        // Dynamic Abbreviations Section
                      
                            HStack {
                                Text("Dynamic Abbreviations:")
                                    .font(.system(size: 14).weight(.semibold))
                                
                                Spacer()
                            }
                            .padding(.bottom, 1)
                        
                        createDynamicSection(title: "Date:", placeholders: placeholdersDate, textBinding: $text.appearance.inputText)
                        
                        createDynamicSection(title: "Location:", placeholders: plcaeholdersLocation, textBinding: $text.appearance.inputText)
                                
                        createDynamicSection(title: "Calendar", placeholders: placeholderCalendar, textBinding: $text.appearance.inputText)
                            
                        createDynamicSection(title: "Weather:", placeholders: placeholdersWeather, textBinding: $text.appearance.inputText)
                            
                        createDynamicSection(title: "Battery:", placeholders: placeholdersBattery, textBinding: $text.appearance.inputText)
                        
                        Spacer()
                            .frame(height: UIScreen.main.bounds.height)
                           
                        
                    }
                   
                   
                    .padding(.horizontal)
                }
            }
        }
    
    func createDynamicSection(title: String, placeholders: [String], textBinding: Binding<String>) -> some View {
        VStack {
            HStack {
                LazyHGrid(rows: gridItems) {
                    HStack {
                        Text(title)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.system(size: 11))
                        Spacer()
                    }
                    
                    ForEach(placeholders, id: \.self) { placeholder in
                        Button {
                            textBinding.wrappedValue += placeholder
                        } label: {
                            Text("\(placeholder)")
                                .font(.system(size: 10))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 6)
                        }
                        .fixedSize()
                        
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            Divider()
                .padding(.horizontal)
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



