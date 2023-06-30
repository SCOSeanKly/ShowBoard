//
//  RotateModifier.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

//MARK: Not used yet

struct RotateGesture: Gesture {
    
    @Binding var angle: CGFloat
    @Binding var prevAngle: CGFloat

    let size: CGSize
    
    var body: some Gesture {
        DragGesture()
            .onChanged{ value in
                let loc = value.location
                let startLoc = value.startLocation
                let locAtan = atan2(loc.x - size.width * 0.5, size.height * 0.5 - loc.y)
                let startLocAtan = atan2(startLoc.x - size.width * 0.5, size.height * 0.5 - startLoc.y)
                let delta = (locAtan - startLocAtan) * 180 / .pi

                self.angle = self.prevAngle + delta
            }
            .onEnded { value in
                self.prevAngle = self.angle
            }
    }
}
