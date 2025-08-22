//
//  LayerObject+Appearance.swift
//  ShowBoard
//
//  Created by Szigeti József on 28.06.23.
//

import SwiftUI


// MARK: - Codable wrappers and extensions for non-Codable types
// These wrappers and extensions enable encoding and decoding of types like Color, BlendMode, Angle, Font.Weight, TextAlignment, ShadowSettings

// MARK: Color Codable Wrapper
/// Wraps SwiftUI Color to encode/decode as RGBA components
struct CodableColor: Codable, Equatable {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat

    init(_ color: Color) {
        let uiColor = UIColor(color)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        red = r
        green = g
        blue = b
        alpha = a
    }

    var color: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

// MARK: Angle Codable Wrapper
/// Encodes Angle as degrees Double value
struct CodableAngle: Codable, Equatable {
    let degrees: Double

    init(_ angle: Angle) {
        self.degrees = angle.degrees
    }

    var angle: Angle {
        Angle(degrees: degrees)
    }
}

// MARK: BlendMode Codable Wrapper
/// Encodes BlendMode as raw String value
struct CodableBlendMode: Codable, Equatable {
    let rawValue: String

    init(_ blendMode: BlendMode) {
        self.rawValue = blendMode.rawValue
    }

    var blendMode: BlendMode {
        BlendMode(rawValue)
    }
}

// MARK: Font.Weight Codable Wrapper
/// Encodes Font.Weight as raw String value
struct CodableFontWeight: Codable, Equatable {
    let rawValue: String

    init(_ fontWeight: Font.Weight) {
        self.rawValue = Font.Weight.toString(fontWeight)
    }

    var fontWeight: Font.Weight {
        Font.Weight.fromString(rawValue)
    }
}

extension Font.Weight {
    // Mapping Font.Weight to String for Codable support
    static func toString(_ weight: Font.Weight) -> String {
        switch weight {
        case .ultraLight: return "ultraLight"
        case .thin: return "thin"
        case .light: return "light"
        case .regular: return "regular"
        case .medium: return "medium"
        case .semibold: return "semibold"
        case .bold: return "bold"
        case .heavy: return "heavy"
        case .black: return "black"
        default: return "regular"
        }
    }

    static func fromString(_ string: String) -> Font.Weight {
        switch string {
        case "ultraLight": return .ultraLight
        case "thin": return .thin
        case "light": return .light
        case "regular": return .regular
        case "medium": return .medium
        case "semibold": return .semibold
        case "bold": return .bold
        case "heavy": return .heavy
        case "black": return .black
        default: return .regular
        }
    }
}

// MARK: TextAlignment Codable Wrapper
/// Encodes TextAlignment as raw String value
struct CodableTextAlignment: Codable, Equatable {
    let rawValue: String

    init(_ alignment: TextAlignment) {
        switch alignment {
        case .leading: rawValue = "leading"
        case .center: rawValue = "center"
        case .trailing: rawValue = "trailing"
        default: rawValue = "center"
        }
    }

    var textAlignment: TextAlignment {
        switch rawValue {
        case "leading": return .leading
        case "center": return .center
        case "trailing": return .trailing
        default: return .center
        }
    }
}

// MARK: ShadowSettings Codable Wrapper
/// Encodes ShadowSettings struct by encoding its properties including Color as CodableColor
struct CodableShadowSettings: Codable, Equatable {
    let color: CodableColor
    let radius: CGFloat
    let offset: CGPoint

    init(_ shadow: ShadowSettings) {
        self.color = CodableColor(shadow.color)
        self.radius = shadow.radius
        self.offset = shadow.offset
    }

    var shadowSettings: ShadowSettings {
        ShadowSettings(radius: radius, offset: offset, color: color.color, opcaity: 1)
    }
}

// MARK: BlendMode Codable conformance extension (optional fallback)
extension BlendMode {
    var rawValue: String {
        switch self {
        case .normal: return "normal"
        case .multiply: return "multiply"
        case .screen: return "screen"
        case .overlay: return "overlay"
        case .darken: return "darken"
        case .lighten: return "lighten"
        case .colorDodge: return "colorDodge"
        case .colorBurn: return "colorBurn"
        case .softLight: return "softLight"
        case .hardLight: return "hardLight"
        case .difference: return "difference"
        case .exclusion: return "exclusion"
        case .hue: return "hue"
        case .saturation: return "saturation"
        case .color: return "color"
        case .luminosity: return "luminosity"
        default: return "normal"
        }
    }

    init(_ rawValue: String) {
        switch rawValue {
        case "normal": self = .normal
        case "multiply": self = .multiply
        case "screen": self = .screen
        case "overlay": self = .overlay
        case "darken": self = .darken
        case "lighten": self = .lighten
        case "colorDodge": self = .colorDodge
        case "colorBurn": self = .colorBurn
        case "softLight": self = .softLight
        case "hardLight": self = .hardLight
        case "difference": self = .difference
        case "exclusion": self = .exclusion
        case "hue": self = .hue
        case "saturation": self = .saturation
        case "color": self = .color
        case "luminosity": self = .luminosity
        default: self = .normal
        }
    }
}

// MARK: - Main Struct Codable conformance and implementation

struct LayerObjectAppearance: Codable {

    // MARK: Global
    var showSettings: Bool
    var position: CGPoint
    var sliderSpecifier: Int
    var sliderStep: CGFloat
    var originalSize: CGSize
    var scales: CGFloat
    var rotation: Angle
    var blendMode: BlendMode
    var shadow: ShadowSettings
    var blur: CGFloat
    var glassBlur: CGFloat
    var opacity: CGFloat
    var cornerRadius: CGFloat
    var offsetX: CGFloat
    var offsetY: CGFloat
    var scaleHeight: CGFloat
    var scaleWidth: CGFloat
    var skewX: CGFloat
    var skewY: CGFloat
    var shadowOpacity: CGFloat
    var darkMode: Bool
    var invert: Bool
    var width: CGFloat
    var height: CGFloat
    var overlayColor: Color
    var showReflection: Bool
    var reflectionOffset: CGFloat

    // MARK: Custom Shape
    var shapeGrain: Bool
    var showBorder: Bool
    var borderWidth: CGFloat
    var shapePointCount: CGFloat
    var shapeRatio: CGFloat
    var fillColor: Color
    var fillColor2: Color
    var strokeWidth: CGFloat
    var strokeDash: CGFloat

    // MARK: Circle Gauge
    var minValue: CGFloat
    var maxValue: CGFloat
    var currentValueLabelFontSize: CGFloat
    var minMaxValueLabelFontSize: CGFloat
    var gaugeColor: Color
    var showCurrentValueLabel: Bool
    var showMinMaxValueLabels: Bool
    var currentValueLabelColor: Color
    var minMaxValueLabelColor: Color
    var gaugeScale: CGFloat

    // MARK: WavyDock
    var xAngle: CGFloat
    var amplitude : CGFloat

    // MARK: Calendar
    var daysTextSize: CGFloat
    var daysColor: Color
    var dateTextColor: Color
    var dateTextSize: CGFloat
    var dateBackgroundColor: Color
    var dateBackgroundCornerRadius: CGFloat
    var calendarBackgroundColor: Color
    var calendarBackgroundColor2: Color
    var calendarBackgroundCornerRadius: CGFloat
    var todayIndicator: Color
    var todayIndicatorStyle: Bool

    // MARK: Dynamic Text
    var fontTracking: CGFloat
    var fontFrameWidth: CGFloat
    var dropLast: CGFloat
    var fontColor: Color
    var fontSize: CGFloat
    // var selectedFontName: String
    @AppStorage("selectedFontName") var selectedFontName: String = "Apple SF"
    var fontWeight: Font.Weight
    var textAlignment: TextAlignment
    var inputText: String
    var isCircleText: Bool
    var isKeyboardPresented: Bool
    var useGradientColors: Bool

    // MARK: Rain Effect
    var showRainBounce: Bool
    var addGaradientMask: Bool

    // MARK: Plus7 Days
    var showHorizontal: Bool
    var spacing: CGFloat
    var daysToShow: CGFloat
    var showForecastTempString: Bool
    var weatherIconAssetStyle: Int
    var labelsOffset: CGFloat
    var showDayNames: Bool

    // MARK: Wallpaper Settings
    var hue: Double
    var contrast: CGFloat
    var saturation: CGFloat
    var pixellate: Float
    var speed: Float
    var frequency: Float
    var amplitudeMetal: Float

    /// The list of the avaliable blend modes
    static let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]

    // TODO: Blend mode labels
    static func labelForBlendMode(_ blendMode: BlendMode) -> String {

        switch blendMode {
        case .normal:
            return "Normal"
        case .multiply:
            return "Multiply"
        case .screen:
            return "Screen"
        case .overlay:
            return "Overlay"
        case .darken:
            return "Darken"
        case .lighten:
            return "Lighten"
        case .colorDodge:
            return "Color Dodge"
        case .colorBurn:
            return "Color Burn"
        case .softLight:
            return "Soft Light"
        case .hardLight:
            return "Hard Light"
        case .difference:
            return "Difference"
        case .exclusion:
            return "Exclusion"
        case .hue:
            return "Hue"
        case .saturation:
            return "Saturation"
        case .color:
            return "Color"
        case .luminosity:
            return "Luminosity"
        default:
            return "Unknown Blend Mode"
        }
    }


    init() {
        self.position = .zero
        self.originalSize = .zero
        self.scales = 1
        self.rotation = .zero
        self.blendMode = .normal
        self.shadow = ShadowSettings()
        self.blur = 0.0
        self.opacity = 1.0
        self.cornerRadius = 0.0
        self.skewX = 0.0
        self.skewY = 0.0
        self.shadowOpacity = 0.0
        self.darkMode = false
        self.invert = false
        self.showSettings = false
        self.width = UIScreen.main.bounds.width * 0.85
        self.height = UIScreen.main.bounds.width * 0.7
        self.overlayColor = .clear
        self.shapeGrain = false
        self.showBorder = true
        self.borderWidth = 0.5
        self.shapePointCount = 5
        self.shapeRatio = 1
        self.fillColor = .white
        self.glassBlur = 5
        self.minValue = 0.0
        self.maxValue = 100
        self.currentValueLabelFontSize = 12
        self.minMaxValueLabelFontSize = 6
        self.gaugeColor = .blue
        self.showCurrentValueLabel = true
        self.showMinMaxValueLabels = true
        self.currentValueLabelColor = .white
        self.minMaxValueLabelColor = .white
        self.gaugeScale = 1.0
        self.showReflection = false
        self.reflectionOffset = 5
        self.offsetX = 0
        self.offsetY = 0
        self.scaleWidth = 1
        self.scaleHeight = 1
        self.xAngle = 360
        self.amplitude = 0.15

        self.daysTextSize = 15
        self.daysColor = .white
        self.dateTextColor = .white
        self.dateTextSize = 15
        self.dateBackgroundColor = .clear
        self.dateBackgroundCornerRadius = 10
        self.calendarBackgroundColor = .clear
        self.calendarBackgroundColor2 = .clear
        self.calendarBackgroundCornerRadius = 10
        self.todayIndicator = .red

        self.fontTracking = 0
        self.fontFrameWidth = 200
        self.dropLast = 0
        self.fontColor = .white
        self.fontSize = 16
        self.fontWeight = .medium
        self.textAlignment = .center
        self.inputText = "ShowBoard - Good [timeOfDay]"
        self.isCircleText = false
        self.isKeyboardPresented = false
        self.fillColor2 = .white
        self.useGradientColors = false
        self.todayIndicatorStyle = false
        self.showRainBounce = false
        self.addGaradientMask = true

        self.showHorizontal = true
        self.showDayNames = true
        self.spacing = -10
        self.daysToShow = 5
        self.showForecastTempString = false
        self.weatherIconAssetStyle = 1
        self.labelsOffset = 10
        self.sliderSpecifier = 2
        self.sliderStep = 0.05


        self.hue = 0.0
        self.contrast = 1.0
        self.saturation = 1.0
        self.pixellate = 1
        self.speed = 1
        self.frequency = 15
        self.amplitudeMetal = 0
        self.strokeWidth = 5
        self.strokeDash = 5
    }

    init(position: CGPoint,
         originalSize: CGSize,
         scales: CGFloat,
         rotation: Angle,
         blendMode: BlendMode,
         shadow: ShadowSettings,
         blur: CGFloat,
         opacity: CGFloat,
         cornerRadius: CGFloat,
         skewX: CGFloat, skewY: CGFloat,
         shadowOpacity: CGFloat,
         darkMode: Bool, invert: Bool,
         showSettings: Bool,
         width: CGFloat,
         height: CGFloat,
         overlayColor: Color,
         shapeGrain: Bool,
         showBorder: Bool,
         borderWidth: CGFloat,
         shapePointCount: CGFloat,
         shapeRatio: CGFloat,
         fillColor: Color,
         glassBlur: CGFloat,
         minValue: CGFloat,
         maxValue: CGFloat,
         currentValueLabelFontSize: CGFloat,
         minMaxValueLabelFontSize: CGFloat,
         gaugeColor: Color,
         showCurrentValueLabel: Bool,
         showMinMaxValueLabels: Bool,
         currentValueLabelColor: Color,
         minMaxValueLabelColor: Color,
         gaugeScale: CGFloat,
         showReflection: Bool = false,
         reflectionOffset: CGFloat,
         offsetX: CGFloat,
         offsetY: CGFloat,
         scaleWidth: CGFloat,
         scaleHeight: CGFloat,
         xAngle: CGFloat,
         amplitide: CGFloat,
         daysTextSize: CGFloat,
         daysColor: Color,
         dateTextColor: Color,
         dateTextSize: CGFloat,
         dateBackgroundColor: Color,
         dateBackgroundCornerRadius: CGFloat,
         calendarBackgroundColor: Color,
         calendarBackgroundColor2: Color,
         calendarBackgroundCornerRadius: CGFloat,
         todayIndicator: Color,
         fontTracking: CGFloat,
         fontFrameWidth: CGFloat,
         dropLast: CGFloat,
         fontColor: Color,
         fontSize: CGFloat,
         selectedFontName: String,
         fontWeight: Font.Weight,
         textAlignment: TextAlignment,
         inputText: String,
         isCircleText: Bool,
         isKeyboardPresented: Bool,
         fillColor2: Color,
         useGradientColors: Bool,
         todayIndicatorStyle: Bool,
         showRainBounce: Bool,
         addGaradientMask: Bool,
         showHorizontal: Bool,
         spacing: CGFloat,
         daysToShow: CGFloat,
         showForecastTempString: Bool,
         weatherIconAssetStyle: Int,
         labelsOffset: CGFloat,
         sliderSpecifier: Int,
         sliderStep: CGFloat,
         customSliderStep: CGFloat,
         hue: Double,
         contrast: CGFloat,
         saturation: CGFloat,
         pixellate: Float,
         speed: Float,
         frequency: Float,
         amplitudeMetal: Float,
         strokeWidth: CGFloat,
         strokeDash: CGFloat,
         showDayNames: Bool
    ) {

        self.position = position
        self.originalSize = originalSize
        self.scales = scales
        self.rotation = rotation
        self.blendMode = blendMode
        self.shadow = shadow
        self.blur = blur
        self.opacity = opacity
        self.cornerRadius = cornerRadius
        self.skewX = skewX
        self.skewY = skewY
        self.shadowOpacity = shadowOpacity
        self.darkMode = darkMode
        self.invert = invert
        self.showSettings = showSettings
        self.width = width
        self.height = height
        self.overlayColor = overlayColor
        self.shapeGrain = shapeGrain
        self.showBorder = showBorder
        self.borderWidth = borderWidth
        self.shapePointCount = shapePointCount
        self.shapeRatio = shapeRatio
        self.fillColor = fillColor
        self.glassBlur = glassBlur
        self.minValue = minValue
        self.maxValue = maxValue
        self.currentValueLabelFontSize = currentValueLabelFontSize
        self.minMaxValueLabelFontSize = minMaxValueLabelFontSize
        self.gaugeColor = gaugeColor
        self.showCurrentValueLabel = showCurrentValueLabel
        self.showMinMaxValueLabels = showCurrentValueLabel
        self.currentValueLabelColor = currentValueLabelColor
        self.minMaxValueLabelColor = minMaxValueLabelColor
        self.gaugeScale = gaugeScale
        self.showReflection = showReflection
        self.reflectionOffset = reflectionOffset
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.scaleWidth = scaleWidth
        self.scaleHeight = scaleHeight
        self.xAngle = xAngle
        self.amplitude = amplitide
        self.daysTextSize = daysTextSize
        self.daysColor = daysColor
        self.dateTextColor = dateTextColor
        self.dateTextSize = dateTextSize
        self.dateBackgroundColor = dateBackgroundColor
        self.dateBackgroundCornerRadius = dateBackgroundCornerRadius
        self.calendarBackgroundColor = calendarBackgroundColor
        self.calendarBackgroundColor2 = calendarBackgroundColor2
        self.calendarBackgroundCornerRadius = calendarBackgroundCornerRadius
        self.todayIndicator = todayIndicator
        self.fontTracking = fontTracking
        self.fontFrameWidth = fontFrameWidth
        self.dropLast = dropLast
        self.fontColor = fontColor
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.textAlignment = textAlignment
        self.inputText = inputText
        self.isCircleText = isCircleText
        self.isKeyboardPresented = isKeyboardPresented
        self.fillColor2 = fillColor2
        self.useGradientColors = useGradientColors
        self.todayIndicatorStyle = todayIndicatorStyle
        self.showRainBounce = showRainBounce
        self.addGaradientMask = addGaradientMask
        self.showHorizontal = showHorizontal
        self.spacing = spacing
        self.daysToShow = daysToShow
        self.showForecastTempString = showForecastTempString
        self.weatherIconAssetStyle = weatherIconAssetStyle
        self.labelsOffset = labelsOffset
        self.sliderSpecifier = sliderSpecifier
        self.sliderStep = sliderStep
        self.hue = hue
        self.contrast = contrast
        self.saturation = saturation
        self.pixellate = pixellate
        self.speed = speed
        self.frequency = frequency
        self.amplitudeMetal = amplitudeMetal
        self.strokeWidth = strokeWidth
        self.strokeDash = strokeDash
        self.showDayNames = showDayNames

    }

    // MARK: - Coding Keys
    // Exclude computed properties and AppStorage wrapped properties
    enum CodingKeys: String, CodingKey {
        // Global
        case showSettings
        case position
        case sliderSpecifier
        case sliderStep
        case originalSize
        case scales
        case rotation
        case blendMode
        case shadow
        case blur
        case glassBlur
        case opacity
        case cornerRadius
        case offsetX
        case offsetY
        case scaleHeight
        case scaleWidth
        case skewX
        case skewY
        case shadowOpacity
        case darkMode
        case invert
        case width
        case height
        case overlayColor
        case showReflection
        case reflectionOffset

        // Custom Shape
        case shapeGrain
        case showBorder
        case borderWidth
        case shapePointCount
        case shapeRatio
        case fillColor
        case fillColor2
        case strokeWidth
        case strokeDash

        // Circle Gauge
        case minValue
        case maxValue
        case currentValueLabelFontSize
        case minMaxValueLabelFontSize
        case gaugeColor
        case showCurrentValueLabel
        case showMinMaxValueLabels
        case currentValueLabelColor
        case minMaxValueLabelColor
        case gaugeScale

        // WavyDock
        case xAngle
        case amplitude

        // Calendar
        case daysTextSize
        case daysColor
        case dateTextColor
        case dateTextSize
        case dateBackgroundColor
        case dateBackgroundCornerRadius
        case calendarBackgroundColor
        case calendarBackgroundColor2
        case calendarBackgroundCornerRadius
        case todayIndicator
        case todayIndicatorStyle

        // Dynamic Text
        case fontTracking
        case fontFrameWidth
        case dropLast
        case fontColor
        case fontSize
        case fontWeight
        case textAlignment
        case inputText
        case isCircleText
        case isKeyboardPresented
        case useGradientColors

        // Rain Effect
        case showRainBounce
        case addGaradientMask

        // Plus7 Days
        case showHorizontal
        case spacing
        case daysToShow
        case showForecastTempString
        case weatherIconAssetStyle
        case labelsOffset
        case showDayNames

        // Wallpaper Settings
        case hue
        case contrast
        case saturation
        case pixellate
        case speed
        case frequency
        case amplitudeMetal
    }

    // MARK: - Codable Implementation

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.showSettings = try container.decode(Bool.self, forKey: .showSettings)
        self.position = try container.decode(CGPoint.self, forKey: .position)
        self.sliderSpecifier = try container.decode(Int.self, forKey: .sliderSpecifier)
        self.sliderStep = try container.decode(CGFloat.self, forKey: .sliderStep)
        self.originalSize = try container.decode(CGSize.self, forKey: .originalSize)
        self.scales = try container.decode(CGFloat.self, forKey: .scales)
        let rotationCodable = try container.decode(CodableAngle.self, forKey: .rotation)
        self.rotation = rotationCodable.angle

        let blendModeCodable = try container.decode(CodableBlendMode.self, forKey: .blendMode)
        self.blendMode = blendModeCodable.blendMode

        let shadowCodable = try container.decode(CodableShadowSettings.self, forKey: .shadow)
        self.shadow = shadowCodable.shadowSettings

        self.blur = try container.decode(CGFloat.self, forKey: .blur)
        self.glassBlur = try container.decode(CGFloat.self, forKey: .glassBlur)
        self.opacity = try container.decode(CGFloat.self, forKey: .opacity)
        self.cornerRadius = try container.decode(CGFloat.self, forKey: .cornerRadius)
        self.offsetX = try container.decode(CGFloat.self, forKey: .offsetX)
        self.offsetY = try container.decode(CGFloat.self, forKey: .offsetY)
        self.scaleHeight = try container.decode(CGFloat.self, forKey: .scaleHeight)
        self.scaleWidth = try container.decode(CGFloat.self, forKey: .scaleWidth)
        self.skewX = try container.decode(CGFloat.self, forKey: .skewX)
        self.skewY = try container.decode(CGFloat.self, forKey: .skewY)
        self.shadowOpacity = try container.decode(CGFloat.self, forKey: .shadowOpacity)
        self.darkMode = try container.decode(Bool.self, forKey: .darkMode)
        self.invert = try container.decode(Bool.self, forKey: .invert)
        self.width = try container.decode(CGFloat.self, forKey: .width)
        self.height = try container.decode(CGFloat.self, forKey: .height)
        let overlayColorCodable = try container.decode(CodableColor.self, forKey: .overlayColor)
        self.overlayColor = overlayColorCodable.color
        self.showReflection = try container.decode(Bool.self, forKey: .showReflection)
        self.reflectionOffset = try container.decode(CGFloat.self, forKey: .reflectionOffset)

        self.shapeGrain = try container.decode(Bool.self, forKey: .shapeGrain)
        self.showBorder = try container.decode(Bool.self, forKey: .showBorder)
        self.borderWidth = try container.decode(CGFloat.self, forKey: .borderWidth)
        self.shapePointCount = try container.decode(CGFloat.self, forKey: .shapePointCount)
        self.shapeRatio = try container.decode(CGFloat.self, forKey: .shapeRatio)
        let fillColorCodable = try container.decode(CodableColor.self, forKey: .fillColor)
        self.fillColor = fillColorCodable.color
        let fillColor2Codable = try container.decode(CodableColor.self, forKey: .fillColor2)
        self.fillColor2 = fillColor2Codable.color
        self.strokeWidth = try container.decode(CGFloat.self, forKey: .strokeWidth)
        self.strokeDash = try container.decode(CGFloat.self, forKey: .strokeDash)

        self.minValue = try container.decode(CGFloat.self, forKey: .minValue)
        self.maxValue = try container.decode(CGFloat.self, forKey: .maxValue)
        self.currentValueLabelFontSize = try container.decode(CGFloat.self, forKey: .currentValueLabelFontSize)
        self.minMaxValueLabelFontSize = try container.decode(CGFloat.self, forKey: .minMaxValueLabelFontSize)
        let gaugeColorCodable = try container.decode(CodableColor.self, forKey: .gaugeColor)
        self.gaugeColor = gaugeColorCodable.color
        self.showCurrentValueLabel = try container.decode(Bool.self, forKey: .showCurrentValueLabel)
        self.showMinMaxValueLabels = try container.decode(Bool.self, forKey: .showMinMaxValueLabels)
        let currentValueLabelColorCodable = try container.decode(CodableColor.self, forKey: .currentValueLabelColor)
        self.currentValueLabelColor = currentValueLabelColorCodable.color
        let minMaxValueLabelColorCodable = try container.decode(CodableColor.self, forKey: .minMaxValueLabelColor)
        self.minMaxValueLabelColor = minMaxValueLabelColorCodable.color
        self.gaugeScale = try container.decode(CGFloat.self, forKey: .gaugeScale)

        self.xAngle = try container.decode(CGFloat.self, forKey: .xAngle)
        self.amplitude = try container.decode(CGFloat.self, forKey: .amplitude)

        self.daysTextSize = try container.decode(CGFloat.self, forKey: .daysTextSize)
        let daysColorCodable = try container.decode(CodableColor.self, forKey: .daysColor)
        self.daysColor = daysColorCodable.color
        let dateTextColorCodable = try container.decode(CodableColor.self, forKey: .dateTextColor)
        self.dateTextColor = dateTextColorCodable.color
        self.dateTextSize = try container.decode(CGFloat.self, forKey: .dateTextSize)
        let dateBackgroundColorCodable = try container.decode(CodableColor.self, forKey: .dateBackgroundColor)
        self.dateBackgroundColor = dateBackgroundColorCodable.color
        self.dateBackgroundCornerRadius = try container.decode(CGFloat.self, forKey: .dateBackgroundCornerRadius)
        let calendarBackgroundColorCodable = try container.decode(CodableColor.self, forKey: .calendarBackgroundColor)
        self.calendarBackgroundColor = calendarBackgroundColorCodable.color
        let calendarBackgroundColor2Codable = try container.decode(CodableColor.self, forKey: .calendarBackgroundColor2)
        self.calendarBackgroundColor2 = calendarBackgroundColor2Codable.color
        self.calendarBackgroundCornerRadius = try container.decode(CGFloat.self, forKey: .calendarBackgroundCornerRadius)
        let todayIndicatorCodable = try container.decode(CodableColor.self, forKey: .todayIndicator)
        self.todayIndicator = todayIndicatorCodable.color
        self.todayIndicatorStyle = try container.decode(Bool.self, forKey: .todayIndicatorStyle)

        self.fontTracking = try container.decode(CGFloat.self, forKey: .fontTracking)
        self.fontFrameWidth = try container.decode(CGFloat.self, forKey: .fontFrameWidth)
        self.dropLast = try container.decode(CGFloat.self, forKey: .dropLast)
        let fontColorCodable = try container.decode(CodableColor.self, forKey: .fontColor)
        self.fontColor = fontColorCodable.color
        self.fontSize = try container.decode(CGFloat.self, forKey: .fontSize)
        let fontWeightCodable = try container.decode(CodableFontWeight.self, forKey: .fontWeight)
        self.fontWeight = fontWeightCodable.fontWeight
        let textAlignmentCodable = try container.decode(CodableTextAlignment.self, forKey: .textAlignment)
        self.textAlignment = textAlignmentCodable.textAlignment
        self.inputText = try container.decode(String.self, forKey: .inputText)
        self.isCircleText = try container.decode(Bool.self, forKey: .isCircleText)
        self.isKeyboardPresented = try container.decode(Bool.self, forKey: .isKeyboardPresented)
        self.useGradientColors = try container.decode(Bool.self, forKey: .useGradientColors)

        self.showRainBounce = try container.decode(Bool.self, forKey: .showRainBounce)
        self.addGaradientMask = try container.decode(Bool.self, forKey: .addGaradientMask)

        self.showHorizontal = try container.decode(Bool.self, forKey: .showHorizontal)
        self.spacing = try container.decode(CGFloat.self, forKey: .spacing)
        self.daysToShow = try container.decode(CGFloat.self, forKey: .daysToShow)
        self.showForecastTempString = try container.decode(Bool.self, forKey: .showForecastTempString)
        self.weatherIconAssetStyle = try container.decode(Int.self, forKey: .weatherIconAssetStyle)
        self.labelsOffset = try container.decode(CGFloat.self, forKey: .labelsOffset)
        self.showDayNames = try container.decode(Bool.self, forKey: .showDayNames)

        self.hue = try container.decode(Double.self, forKey: .hue)
        self.contrast = try container.decode(CGFloat.self, forKey: .contrast)
        self.saturation = try container.decode(CGFloat.self, forKey: .saturation)
        self.pixellate = try container.decode(Float.self, forKey: .pixellate)
        self.speed = try container.decode(Float.self, forKey: .speed)
        self.frequency = try container.decode(Float.self, forKey: .frequency)
        self.amplitudeMetal = try container.decode(Float.self, forKey: .amplitudeMetal)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(showSettings, forKey: .showSettings)
        try container.encode(position, forKey: .position)
        try container.encode(sliderSpecifier, forKey: .sliderSpecifier)
        try container.encode(sliderStep, forKey: .sliderStep)
        try container.encode(originalSize, forKey: .originalSize)
        try container.encode(scales, forKey: .scales)
        try container.encode(CodableAngle(rotation), forKey: .rotation)
        try container.encode(CodableBlendMode(blendMode), forKey: .blendMode)
        try container.encode(CodableShadowSettings(shadow), forKey: .shadow)
        try container.encode(blur, forKey: .blur)
        try container.encode(glassBlur, forKey: .glassBlur)
        try container.encode(opacity, forKey: .opacity)
        try container.encode(cornerRadius, forKey: .cornerRadius)
        try container.encode(offsetX, forKey: .offsetX)
        try container.encode(offsetY, forKey: .offsetY)
        try container.encode(scaleHeight, forKey: .scaleHeight)
        try container.encode(scaleWidth, forKey: .scaleWidth)
        try container.encode(skewX, forKey: .skewX)
        try container.encode(skewY, forKey: .skewY)
        try container.encode(shadowOpacity, forKey: .shadowOpacity)
        try container.encode(darkMode, forKey: .darkMode)
        try container.encode(invert, forKey: .invert)
        try container.encode(width, forKey: .width)
        try container.encode(height, forKey: .height)
        try container.encode(CodableColor(overlayColor), forKey: .overlayColor)
        try container.encode(showReflection, forKey: .showReflection)
        try container.encode(reflectionOffset, forKey: .reflectionOffset)

        try container.encode(shapeGrain, forKey: .shapeGrain)
        try container.encode(showBorder, forKey: .showBorder)
        try container.encode(borderWidth, forKey: .borderWidth)
        try container.encode(shapePointCount, forKey: .shapePointCount)
        try container.encode(shapeRatio, forKey: .shapeRatio)
        try container.encode(CodableColor(fillColor), forKey: .fillColor)
        try container.encode(CodableColor(fillColor2), forKey: .fillColor2)
        try container.encode(strokeWidth, forKey: .strokeWidth)
        try container.encode(strokeDash, forKey: .strokeDash)

        try container.encode(minValue, forKey: .minValue)
        try container.encode(maxValue, forKey: .maxValue)
        try container.encode(currentValueLabelFontSize, forKey: .currentValueLabelFontSize)
        try container.encode(minMaxValueLabelFontSize, forKey: .minMaxValueLabelFontSize)
        try container.encode(CodableColor(gaugeColor), forKey: .gaugeColor)
        try container.encode(showCurrentValueLabel, forKey: .showCurrentValueLabel)
        try container.encode(showMinMaxValueLabels, forKey: .showMinMaxValueLabels)
        try container.encode(CodableColor(currentValueLabelColor), forKey: .currentValueLabelColor)
        try container.encode(CodableColor(minMaxValueLabelColor), forKey: .minMaxValueLabelColor)
        try container.encode(gaugeScale, forKey: .gaugeScale)

        try container.encode(xAngle, forKey: .xAngle)
        try container.encode(amplitude, forKey: .amplitude)

        try container.encode(daysTextSize, forKey: .daysTextSize)
        try container.encode(CodableColor(daysColor), forKey: .daysColor)
        try container.encode(CodableColor(dateTextColor), forKey: .dateTextColor)
        try container.encode(dateTextSize, forKey: .dateTextSize)
        try container.encode(CodableColor(dateBackgroundColor), forKey: .dateBackgroundColor)
        try container.encode(dateBackgroundCornerRadius, forKey: .dateBackgroundCornerRadius)
        try container.encode(CodableColor(calendarBackgroundColor), forKey: .calendarBackgroundColor)
        try container.encode(CodableColor(calendarBackgroundColor2), forKey: .calendarBackgroundColor2)
        try container.encode(calendarBackgroundCornerRadius, forKey: .calendarBackgroundCornerRadius)
        try container.encode(CodableColor(todayIndicator), forKey: .todayIndicator)
        try container.encode(todayIndicatorStyle, forKey: .todayIndicatorStyle)

        try container.encode(fontTracking, forKey: .fontTracking)
        try container.encode(fontFrameWidth, forKey: .fontFrameWidth)
        try container.encode(dropLast, forKey: .dropLast)
        try container.encode(CodableColor(fontColor), forKey: .fontColor)
        try container.encode(fontSize, forKey: .fontSize)
        try container.encode(CodableFontWeight(fontWeight), forKey: .fontWeight)
        try container.encode(CodableTextAlignment(textAlignment), forKey: .textAlignment)
        try container.encode(inputText, forKey: .inputText)
        try container.encode(isCircleText, forKey: .isCircleText)
        try container.encode(isKeyboardPresented, forKey: .isKeyboardPresented)
        try container.encode(useGradientColors, forKey: .useGradientColors)

        try container.encode(showRainBounce, forKey: .showRainBounce)
        try container.encode(addGaradientMask, forKey: .addGaradientMask)

        try container.encode(showHorizontal, forKey: .showHorizontal)
        try container.encode(spacing, forKey: .spacing)
        try container.encode(daysToShow, forKey: .daysToShow)
        try container.encode(showForecastTempString, forKey: .showForecastTempString)
        try container.encode(weatherIconAssetStyle, forKey: .weatherIconAssetStyle)
        try container.encode(labelsOffset, forKey: .labelsOffset)
        try container.encode(showDayNames, forKey: .showDayNames)

        try container.encode(hue, forKey: .hue)
        try container.encode(contrast, forKey: .contrast)
        try container.encode(saturation, forKey: .saturation)
        try container.encode(pixellate, forKey: .pixellate)
        try container.encode(speed, forKey: .speed)
        try container.encode(frequency, forKey: .frequency)
        try container.encode(amplitudeMetal, forKey: .amplitudeMetal)
    }

    // The font computed property is excluded from Codable conformance since it depends on selectedFontName (AppStorage)
    var font: Font {
        Font.custom(selectedFontName, size: fontSize)
            .weight(fontWeight)
    }
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]

    @MainActor public func dynamicText(wk: WeatherObserver) -> String {
        DynamicText.convert(input: inputText, wk: wk)
    }
}
