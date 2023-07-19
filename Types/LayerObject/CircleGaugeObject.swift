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
    
    /// Show current value label
    @Published var showCurrentValueLabel: Bool
    
    /// Show Min and Max value labels
    @Published var showMinMaxValueLabels: Bool
    
    /// Current value label color
    @Published var currentValueLabelColor: Color
    
    /// Min Max value label colour
    @Published var minMaxValueLabelColor: Color
    

    
    
    
    
    // MARK: - Public Methods
    
    
    init(
        id: UUID = UUID(),
        appearance: LayerObjectAppearance = LayerObjectAppearance(),
        minValue: CGFloat = 0.0,
        maxValue: CGFloat = 100.0,
        currentValueLabelFontSize: CGFloat = 12,
        minMaxValueLabelFontSize: CGFloat = 6,
        gaugeColor: Color = Color.blue,
        showCurrentValueLabel: Bool = true,
        showMinMaxValueLabels: Bool = true,
        currentValueLabelColor: Color = Color.blue,
        minMaxValueLabelColor: Color = Color.blue) {
            
        self.id = id
        self.appearance = appearance
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentValueLabelFontSize = currentValueLabelFontSize
        self.minMaxValueLabelFontSize = minMaxValueLabelFontSize
        self.gaugeColor = gaugeColor
        self.showCurrentValueLabel = showCurrentValueLabel
        self.showMinMaxValueLabels = showCurrentValueLabel
        self.currentValueLabelColor = currentValueLabelColor
        self.minMaxValueLabelColor = minMaxValueLabelColor
    }
}
