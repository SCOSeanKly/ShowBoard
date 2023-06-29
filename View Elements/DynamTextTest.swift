//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI

extension View {
    func replacePlaceholders(userInput: String) -> some View {
        var text = userInput
        let pattern = "\\[.*?\\]"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: userInput, range: NSRange(userInput.startIndex..., in: userInput))
        
        for match in matches {
            let range = match.range
            let tag = String(userInput[Range(range, in: userInput)!])
            
            guard let placeholder = DynamicText.Placeholder(rawValue: tag) else {
                continue
            }
            
            text = text.replacingOccurrences(
                of: tag,
                with: placeholder.withCurrentDate()
            )
        }
        
        return AnyView(Text(text))
    }
}

struct DynamicTextView: View {
    @State private var userInput: String = "day: [day], year: [year]"
    @State private var fontSize: CGFloat = 16
    @State private var fontTracking: CGFloat = 0
    @State private var fontName: String = "Autone"
    @State private var fontWeight: Font.Weight = .black
    @State private var fontColor: Color = .black
    @State private var fontAlignment: TextAlignment = .leading
    @State private var shadowRadius: CGFloat = 0
    @State private var shadowOffset: CGFloat = 0
    @State private var rotation: Angle = Angle(degrees: 0)
    @State private var blendMode: BlendMode = .normal
    
    let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    let fontStyleArray = ["Autone", "ModernAge"]
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Enter text...")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextEditor(text: $userInput)
                    .frame(height: 100)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .padding(.horizontal)
                
                HStack {
                    Text("Dynamic Abbreviations: ")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .foregroundColor(.black) +
                    
                    Text("[day], [date], [month], [year], [time], [daysRemaining], [daysCount], [timeofday]")
                        .font(.system(size: 10))
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 5)
                
                HStack {
                    Text(userInput)
                        .replacePlaceholders(userInput: userInput)
                        .font(.custom(fontName, size: fontSize))
                        .tracking(fontTracking)
                        .multilineTextAlignment(fontAlignment)
                        .fontWeight(fontWeight)
                        .foregroundColor(fontColor)
                        .blendMode(blendMode)
                        .rotationEffect(rotation)
                        .padding(6)
                        .background(.ultraThinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: shadowRadius, y: shadowOffset)
                    
                    Spacer()
                }
                .padding(.leading)
                
                // MARK: Settings
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button {
                            resetSettings()
                        }label: {
                            Text("Reset")
                        }
                    }
                    
                    HStack {
                        Text("Font Style: ")
                        Spacer()
                        Picker("Font Style", selection: $fontName) {
                            ForEach(fontStyleArray, id: \.self) { style in
                                Text(style ?? "System Font")
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    HStack {
                        Text("Font Size: ")
                        Slider(value: $fontSize, in: 1...200)
                        Text("\(fontSize, specifier: "%.1f")")
                    }
                    
                    HStack {
                        Text("Tracking: ")
                        Slider(value: $fontTracking, in: 0...20)
                        Text("\(fontTracking, specifier: "%.0f")")
                    }
                    
                    HStack {
                        Text("Font Alignment: ")
                        Spacer()
                        Picker("Font Alignment", selection: $fontAlignment) {
                            ForEach(alignmentOptions, id: \.self) { style in
                             //  Text(alignmentOptions)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    HStack {
                        Text("Shadow Radius: ")
                        Slider(value: $shadowRadius, in: 0...20)
                        Text("\(shadowRadius, specifier: "%.1f")")
                    }
                    HStack {
                        Text("Shadow Offset: ")
                        Slider(value: $shadowOffset, in: 0...30)
                        Text("\(shadowOffset, specifier: "%.1f")")
                    }
                    HStack {
                        Text("Rotation: ")
                        Slider(value: Binding<Double>(
                            get: { rotation.degrees },
                            set: { rotation = Angle(degrees: $0) }
                        ), in: 0...360)
                        Text("\(rotation.degrees, specifier: "%.1f")")
                    }
                    
                    HStack {
                        Text("Blend Mode: ")
                        Spacer()
                        Picker("Blend Mode", selection: $blendMode) {
                            ForEach(blendModes, id: \.self) { mode in
                                Text(labelForBlendMode(mode))
                                    .tag(mode)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    ColorPicker("Set the foreground color", selection: $fontColor)
                    
                }
                .padding()
                
                .scaleEffect(0.8)
            }
            .padding(.horizontal)
        }
    }
    
    private func resetSettings() {
        fontName = "Autone"
        fontSize = 26
        fontWeight = .regular
        fontColor = .black
        shadowRadius = 0.0
        shadowOffset = 0.0
        rotation = .zero
    }
    
    private func labelForBlendMode(_ blendMode: BlendMode) -> String {
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
        @unknown default:
            return ""
        }
    }
}

extension Text {
    func fontStyle(_ style: Font.TextStyle) -> Text {
        return self.font(.system(style))
    }
}



struct DynamicTextView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicTextView()
    }
}


