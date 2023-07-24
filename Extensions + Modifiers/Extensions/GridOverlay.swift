//
//  GridOverlay.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct GridOverlay : View {
    var horizontalSpacing: CGFloat = UIScreen.main.bounds.width / 16
    var verticalSpacing: CGFloat = UIScreen.main.bounds.width / 16
    var horizontalSpacing2: CGFloat = UIScreen.main.bounds.width / 4
    var verticalSpacing2: CGFloat = UIScreen.main.bounds.width / 4
    
    let gridColor = Color(.systemBlue)
    @Binding var isDragging: Bool
    @Binding var showMicroContols: Bool
    
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                Path { path in
                    let numberOfHorizontalGridLines = Int(geometry.size.height / self.verticalSpacing)
                    let numberOfVerticalGridLines = Int(geometry.size.width / self.horizontalSpacing)
                    for index in 0...numberOfVerticalGridLines {
                        let vOffset: CGFloat = CGFloat(index) * self.horizontalSpacing
                        path.move(to: CGPoint(x: vOffset, y: 0))
                        path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
                    }
                    for index in 0...numberOfHorizontalGridLines {
                        let hOffset: CGFloat = CGFloat(index) * self.verticalSpacing
                        path.move(to: CGPoint(x: 0, y: hOffset))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
                    }
                }
                .stroke(gridColor.opacity(0.2), lineWidth: 1.0)
            }
            GeometryReader { geometry in
                Path { path in
                    let numberOfHorizontalGridLines = Int(geometry.size.height / self.verticalSpacing2)
                    let numberOfVerticalGridLines = Int(geometry.size.width / self.horizontalSpacing2)
                    for index in 0...numberOfVerticalGridLines {
                        let vOffset: CGFloat = CGFloat(index) * self.horizontalSpacing2
                        path.move(to: CGPoint(x: vOffset, y: 0))
                        path.addLine(to: CGPoint(x: vOffset, y: geometry.size.height))
                    }
                    for index in 0...numberOfHorizontalGridLines {
                        let hOffset: CGFloat = CGFloat(index) * self.verticalSpacing2
                        path.move(to: CGPoint(x: 0, y: hOffset))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: hOffset))
                    }
                }
                .stroke(gridColor.opacity(0.2), lineWidth: 1.0)
            }
        }
        .opacity(isDragging || showMicroContols ? 1 : 0)
        .animation(.easeInOut, value: isDragging)
    }
}




