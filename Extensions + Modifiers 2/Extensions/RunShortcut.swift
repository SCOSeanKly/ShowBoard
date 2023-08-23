//
//  RunShortcut.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

extension View {

    //Opens and runs the shortcut "SetWall"
    func runShortcut() {
        guard let shortcutURL = URL(string: "shortcuts://run-shortcut?name=SetWall") else {
            return
        }
        UIApplication.shared.open(shortcutURL)
    }
}

