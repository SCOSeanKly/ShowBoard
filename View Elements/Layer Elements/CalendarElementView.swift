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
 
         ScrollView{
                LayerBackButton(selfViewToClose: $showCalendarElementView, showLayerElementView: $showLayerElementView, headerText: "Calendar")
                
                LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: calendarIconsArray, iconsArraytext: calendarIconsArraytext, viewToClose: $showCalendarElementView)
            }
        .presentationDetents([.fraction(0.4)])
        .presentationDragIndicator(.visible)
    }
}
