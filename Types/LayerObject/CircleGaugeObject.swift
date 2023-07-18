//
//  CircleGaugeObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI


class CircleGaugeObject: LayerObject {
    
    // Conforming LayerObject
    var id: UUID
    
    @Published var appearance: LayerObjectAppearance
    
    
    // MARK: - Public Properties
    

    /// Min Value
    @Published var minValue: CGFloat
    
    /// Max Value
    @Published var maxValue: CGFloat
    
    /// Current Value Label Font Size
    @Published var currentValueLabelFontSize: CGFloat
    
    /// Min Max Value Label Font Size
    @Published var minMaxValueLabelFontSize: CGFloat
    
    /// Gauge Colour
    @Published var gaugeColor: Color
    
    /// Opacity
    @Published var opacity: CGFloat
    
    /// Show current value label
    @Published var showCurrentValueLabel: Bool
    
    /// Show Min and Max value labels
    @Published var showMinMaxValueLabels: Bool
    
    /// Scale Effect
    @Published var scaleEffect: CGFloat
    
    /// Current value label color
    @Published var currentValueLabelColor: Color
    
    /// Min Max value label colour
    @Published var minMaxValueLabelColor: Color
    
    /// ShadowRaadius
    @Published var shadowRadius: CGFloat
    
    /// Shadow Offset
    @Published var shadowOffset: CGFloat
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), minValue: CGFloat = 0.0, maxValue: CGFloat = 100.0, currentValueLabelFontSize: CGFloat = 12, minMaxValueLabelFontSize: CGFloat = 6,  gaugeColor: Color = Color.blue, opacity: CGFloat = 1.0, showCurrentValueLabel: Bool = true, showMinMaxValueLabels: Bool = true, scaleEffect: CGFloat = 1.0, currentValueLabelColor: Color = Color.white, minMaxValueLabelColor: Color = Color.white, shadowRadius: CGFloat = 0.0, shadowOffset: CGFloat = 0.0) {
        self.id = id
        self.appearance = appearance
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentValueLabelFontSize = currentValueLabelFontSize
        self.minMaxValueLabelFontSize = minMaxValueLabelFontSize
        self.gaugeColor = gaugeColor
        self.opacity = opacity
        self.showCurrentValueLabel = showCurrentValueLabel
        self.showMinMaxValueLabels = showCurrentValueLabel
        self.scaleEffect = scaleEffect
        self.currentValueLabelColor = currentValueLabelColor
        self.minMaxValueLabelColor = minMaxValueLabelColor
        self.shadowRadius = shadowRadius
        self.shadowOffset = shadowOffset
    }
}
