//
//  performDelayedAction.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

extension View {
    
        //Adds a delay function when taking a snapshot of the screen
    
        func performDelayedAction(after interval: TimeInterval, action: @escaping () -> Void) {
            DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: action)
        }
}
