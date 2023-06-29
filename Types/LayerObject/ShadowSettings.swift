//
//  ShadowSettings.swift
//  ShowBoard
//
//  Created by Szigeti József on 29.06.23.
//

import SwiftUI


struct ShadowSettings {
    
    /// The radius of the shadow effect in points
    var radius: CGFloat = 0
    
    
    /// This point contains the x and y offset of the shadow effect
    var offset: CGPoint = .zero
    
    
    /// The color of the shadow effect.
    var color: Color = .clear
}
