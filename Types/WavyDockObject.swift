//
//  WavyDockObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

    class WavyDockObject: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        @Published var graphWidth: CGFloat
        @Published var amplitude: CGFloat
        @Published var xAngle: CGFloat
        @Published var offsetY: CGFloat
        @Published var shadowOffsetY: CGFloat
        @Published var shadowRadius: CGFloat
        @Published var wavyDockColor: Color
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), graphWidth: CGFloat = 1.0, amplitude: CGFloat = 0.15, xAngle: CGFloat = 360, offsetY: CGFloat = 200, shadowOffsetY: CGFloat = 0, shadowRadius:CGFloat = 0, wavyDockColor:Color = .blue) {

            
            self.graphWidth = graphWidth
            self.amplitude = amplitude
            self.xAngle = xAngle
            self.offsetY = offsetY
            self.shadowOffsetY = shadowOffsetY
            self.shadowRadius = shadowRadius
            self.wavyDockColor = wavyDockColor
           
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .wavyDock //MARK: remember and update this!
        }
    }
