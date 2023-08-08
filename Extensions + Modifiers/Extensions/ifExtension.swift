//
//  ifExtension.swift
//  ShowBoard
//
//  Created by Sean Kelly on 08/08/2023.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, modifier: (Self) -> Content) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
}
