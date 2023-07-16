//
//  DynamTextTest.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI


struct DynamicTextView: View {
    
    @StateObject private var text = TextObject()
    
    let alignmentOptions: [TextAlignment] = [.leading, .center, .trailing]
    
    var body: some View {
        
       
        ScrollView {
            
            Button(action: { text.appearance.rotation = Angle(degrees: 45) }) { Text("TEST") }
            
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
                    Text(text.dynamicText)
                        .shadow(
                            radius: text.appearance.shadow.radius,
                            x: text.appearance.shadow.offset.x,
                            y: text.appearance.shadow.offset.y
                        )
                        .font(text.font)
                        .tracking(text.fontTracking)
                        .multilineTextAlignment(text.textAlignment)
                        .fontWeight(text.fontWeight)
                        .foregroundColor(text.fontColor)
                        .background(.ultraThinMaterial)
                        .blendMode(text.appearance.blendMode)
                        .rotationEffect(text.appearance.rotation)
                    
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
                        Picker("Font Style", selection: $text.selectedFontName) {
                            ForEach(TextObject.fontList, id: \.self) { style in
                                Text(style ?? "System Font")
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    HStack {
                        Text("Font Size: ")
                        Slider(value: $text.fontSize, in: 1...200)
                        Text("\(text.fontSize, specifier: "%.1f")")
                    }
                    
                    HStack {
                        Text("Tracking: ")
                        Slider(value: $text.fontTracking, in: 0...20)
                        Text("\(text.fontTracking, specifier: "%.0f")")
                    }
                    
                    HStack {
                        Text("Font Alignment: ")
                        Spacer()
                        Picker("Font Alignment", selection: $text.textAlignment) {
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
                        Slider(value: $text.appearance.rotation.degrees, in: 0...360)
                        Text("\(text.appearance.rotation.degrees, specifier: "%.1f")")
                    }
                    .onChange(of: text.appearance.rotation) { text.appearance.rotation = $0 }
                    
                    HStack {
                        Text("Blend Mode: ")
                        Spacer()
                        Picker("Blend Mode", selection: $text.appearance.blendMode) {
                            ForEach(LayerObjectAppearance.blendModes, id: \.self) { mode in
                                Text(LayerObjectAppearance.labelForBlendMode(mode))
                                    .tag(mode)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        
                        
                    }
                    
                    ColorPicker("Set the foreground color", selection: $text.fontColor)
                    
                }
                .padding()
                
                .scaleEffect(0.8)
            }
            .padding(.horizontal)
        }
    }
    
    private func resetSettings() {
        /*fontName = "Autone"
        fontSize = 26
        fontWeight = .regular
        fontColor = .black
        text.appearance.rotation = .zero*/
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


