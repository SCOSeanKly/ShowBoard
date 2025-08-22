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
     
    
    
    enum CodingKeys: String, CodingKey {
        case graphWidth, amplitude, xAngle, offsetY, shadowOffsetY, shadowRadius, wavyDockColor
    }
    
    
    
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
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        graphWidth = try container.decode(CGFloat.self, forKey: .graphWidth)
        amplitude = try container.decode(CGFloat.self, forKey: .amplitude)
        xAngle = try container.decode(CGFloat.self, forKey: .xAngle)
        offsetY = try container.decode(CGFloat.self, forKey: .offsetY)
        shadowOffsetY = try container.decode(CGFloat.self, forKey: .shadowOffsetY)
        shadowRadius = try container.decode(CGFloat.self, forKey: .shadowRadius)
        let colorHex = try container.decode(String.self, forKey: .wavyDockColor)
        wavyDockColor = WavyDockObject.color(from: colorHex)
        try super.init(from: decoder)
        self.objectType = .wavyDock
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(graphWidth, forKey: .graphWidth)
        try container.encode(amplitude, forKey: .amplitude)
        try container.encode(xAngle, forKey: .xAngle)
        try container.encode(offsetY, forKey: .offsetY)
        try container.encode(shadowOffsetY, forKey: .shadowOffsetY)
        try container.encode(shadowRadius, forKey: .shadowRadius)
        // Encode the color as hex string representation
        let colorHex = WavyDockObject.hexString(from: wavyDockColor)
        try container.encode(colorHex, forKey: .wavyDockColor)
    }
}


// MARK: - Private Color <-> Hex String Conversion Helpers

private extension WavyDockObject {
    
    static func color(from hex: String) -> Color {
        // Expecting #RRGGBBAA
        let r, g, b, a: CGFloat
        
        var hexColor = hex
        if hexColor.hasPrefix("#") {
            hexColor.removeFirst()
        }
        guard hexColor.count == 8, let hexNumber = UInt64(hexColor, radix: 16) else {
            return Color.clear
        }
        
        r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
        g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
        b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
        a = CGFloat(hexNumber & 0x000000FF) / 255
        
        return Color(.sRGB, red: r, green: g, blue: b, opacity: a)
    }
    
    static func hexString(from color: Color) -> String {
        // Extracts sRGB components and formats as #RRGGBBAA
        
        #if os(iOS) || os(tvOS) || os(watchOS)
        typealias NativeColor = UIColor
        #elseif os(macOS)
        typealias NativeColor = NSColor
        #endif
        
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        let nativeColor = NativeColor(color)
        nativeColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let ri = UInt8(r * 255)
        let gi = UInt8(g * 255)
        let bi = UInt8(b * 255)
        let ai = UInt8(a * 255)
        
        return String(format: "#%02X%02X%02X%02X", ri, gi, bi, ai)
    }
}

