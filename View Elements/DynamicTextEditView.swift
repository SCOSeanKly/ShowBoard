//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI


struct DynamicTextView: View {
    
    @StateObject private var text = TextObject()
    
    //@State private var userInput: String = "day: [day], year: [year]"
    @State private var fontSize: CGFloat = 16
    @State private var fontTracking: CGFloat = 0
    @State private var fontName: String = "Autone"
    @State private var fontWeight: Font.Weight = .black
    @State private var fontColor: Color = .black
    @State private var fontAlignment: TextAlignment = .leading
    
    // Dont forget this is just a helper for the settings view we are currently in
    @State private var rotationDegrees: CGFloat = 0
    
    let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    let fontStyleArray = ["Autone", "ModernAge"]
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    
    var body: some View {
        
       
        ScrollView {
            
            Button(action: { text.appearance.rotation = Angle(degrees: 45) }) { Text("ASD") }
            
            VStack {
                HStack {
                    Text("Enter text...")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                TextEditor(text: $text.inputText)
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
                    Text(String(text.appearance.rotation.degrees))
                        .appearance(text.appearance)
                        .font(.custom(fontName, size: fontSize))
                        .tracking(fontTracking)
                        .multilineTextAlignment(fontAlignment)
                        .fontWeight(fontWeight)
                        .foregroundColor(fontColor)
                        .padding(6)
                        .background(.ultraThinMaterial)
                    
                    Spacer()
                }
                .padding(.leading)
                
                // MARK: Settings for Dynamic Text
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
                        Slider(value: $text.appearance.shadow.radius, in: 0...20)
                        Text("\(text.appearance.shadow.radius, specifier: "%.1f")")
                    }
                    HStack {
                        Text("Shadow Offset: ")
                        Slider(value: $text.appearance.shadow.offset.y, in: 0...30)
                        Text("\(text.appearance.shadow.offset.y, specifier: "%.1f")")
                    }
                    HStack {
                        Text("Rotation: ")
                        Slider(value: $rotationDegrees, in: 0...360)
                        Text("\(rotationDegrees, specifier: "%.1f")")
                    }
                    .onChange(of: rotationDegrees) { text.appearance.rotation.degrees = $0 }
                    
                    HStack {
                        Text("Blend Mode: ")
                        Spacer()
                        Picker("Blend Mode", selection: $text.appearance.blendMode) {
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
        text.appearance.rotation = .zero
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

