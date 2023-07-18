//
//  ResetValues.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI

struct ResetValues: View {
    
    let resetValues: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                resetValues()
            }) {
                Text("Reset")
            }
        }
    }
}


