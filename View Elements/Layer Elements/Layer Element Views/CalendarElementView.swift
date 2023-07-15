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
    @State private var pressedButtonIndex: Int?
    @State private var showAnotherView = false // Dont open a view
    
    var body: some View {
        ScrollView {
            LayerBackButton(selfViewToClose: $showCalendarElementView, viewToOpen: $showAnotherView, showLayerElementView: $showLayerElementView, headerText: "Calendar", systemImage: "arrow.left.circle", systemImage2: "")
            
            LayerButton(pressedButtonIndex: $pressedButtonIndex, iconsArray: calendarIconsArray, iconsArraytext: calendarIconsArraytext, viewToClose: $showCalendarElementView, viewToOpen: $showAnotherView)
        }
        .presentationDragIndicator(.visible)
    }
}

