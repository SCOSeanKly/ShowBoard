//
//  ShowBoardApp.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/06/2023.
//

import SwiftUI

@main
struct ShowBoardApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .small)
                .environment(\.colorScheme, .light)
        }
    }
}
