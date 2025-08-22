//
//  MapObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 18/07/2023.
//

import SwiftUI




#if canImport(UIKit)
extension UIColor {
    // Converts UIColor to RGBA hex string
    func toHex() -> String? {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        guard getRed(&r, green: &g, blue: &b, alpha: &a) else { return nil }
        let value = (Int(a * 255) << 24) | (Int(r * 255) << 16) | (Int(g * 255) << 8) | Int(b * 255)
        return String(format: "%08X", value)
    }
    // Initialize UIColor from RGBA hex string
    convenience init?(hex: String) {
        var hexInt: UInt64 = 0
        guard Scanner(string: hex).scanHexInt64(&hexInt) else { return nil }
        let a = CGFloat((hexInt & 0xFF000000) >> 24) / 255.0
        let r = CGFloat((hexInt & 0x00FF0000) >> 16) / 255.0
        let g = CGFloat((hexInt & 0x0000FF00) >> 8) / 255.0
        let b = CGFloat(hexInt & 0x000000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
#endif


class MapObject: LayerObject {
    
    // MARK: - Public Properties
    
    

    
    /// Map Color Overlay
    @Published var mapOverlayColor: Color
    
    /// Map Image Invert Colors
    @Published var mapInvertColor: Bool
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), mapOverlayColor: Color = Color.clear, mapInvertColor: Bool = false) {


        self.mapOverlayColor = mapOverlayColor
        self.mapInvertColor = mapInvertColor
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .map
    }
    
    enum CodingKeys: String, CodingKey {
        case mapOverlayColor
        case mapInvertColor
    }

    required init(from decoder: Decoder) throws {
        self.mapOverlayColor = .clear
        self.mapInvertColor = false
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mapOverlayColor = (try? container.decode(CodableColor.self, forKey: .mapOverlayColor).color) ?? Color.clear
        self.mapInvertColor = (try? container.decode(Bool.self, forKey: .mapInvertColor)) ?? false
        self.objectType = .map
    }
    
    override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableColor(mapOverlayColor), forKey: .mapOverlayColor)
        try container.encode(mapInvertColor, forKey: .mapInvertColor)
    }
}

