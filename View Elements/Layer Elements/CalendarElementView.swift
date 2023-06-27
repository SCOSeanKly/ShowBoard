//
//  CalendarElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI


struct CalendarElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showCalendarElementView: Bool
    
    let calendarIconsArray = ["calendar", "calendar.day.timeline.left"]
    let calendarIconsArraytext = ["Calendar", "Timeline"]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State private var pressedButtonIndex: Int?
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showCalendarElementView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showLayerElementView.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
                
                HStack{
                    Text("Calendar")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
         LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: calendarIconsArray, iconsArraytext: calendarIconsArraytext, viewToClose: $showCalendarElementView)
                 
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
