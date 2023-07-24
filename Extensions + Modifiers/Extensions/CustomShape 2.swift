//
//  CustomShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/07/2023.
//

import SwiftUI

struct Star: Shape {

    var shapePointCount: CGFloat
    var shapeRatio: CGFloat

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        let pointAngle = .pi / shapePointCount

        let innerPoint = CGPoint(x: center.x * shapeRatio * 0.5, y: center.y * shapeRatio * 0.5)
        let totalPoints = Int(shapePointCount * 2.0)

        var currentAngle = CGFloat.pi * -0.5
        var currentBottom: CGFloat = 0

        var path = Path()
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        let correction = shapePointCount != round(shapePointCount) ? 1 : 0
        for corner in 0..<totalPoints + correction  {
            var bottom: CGFloat = 0
            let sin = sin(currentAngle)
            let cos = cos(currentAngle)
            if (corner % 2) == 0 {
                bottom = center.y * sin
                path.addLine(to: CGPoint(x: center.x * cos, y: bottom))
            } else {
                bottom = innerPoint.y * sin
                path.addLine(to: CGPoint(x: innerPoint.x * cos, y: bottom))
            }
            currentBottom = max(bottom, currentBottom)
            currentAngle += pointAngle
        }

        let transform = CGAffineTransform(translationX: center.x, y: center.y + ((rect.height * 0.5 - currentBottom) * 0.5))
        return path.applying(transform)
    }
}
