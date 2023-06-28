//
//  MapView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject var locationDataManager: LocationDataManager
    
    @State private var width: CGFloat = 300
    @State private var height: CGFloat = 150
    @State private var cornerRadius: CGFloat = 0
    @State private var shadowRadius: CGFloat = 0
    @State private var shadowOffset: CGFloat = 0
    @State private var blendMode: BlendMode = .normal
    @State private var colorOverlay: Color = .clear
    
    let blendModes: [BlendMode] = [.normal, .multiply, .screen, .overlay, .darken, .lighten, .colorDodge, .colorBurn, .softLight, .hardLight, .difference, .exclusion, .hue, .saturation, .color, .luminosity]
    
    var body: some View {
        ZStack {
            
            MapExtensionView(locationDataManager: locationDataManager)
                .frame(width: width, height: height * 1.3)
                .mask(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: width, height: height)
                        .cornerRadius(cornerRadius)
                )
                .shadow(radius: shadowRadius, y: shadowOffset)
                .blendMode(blendMode)
                .overlay(colorOverlay)
            
            VStack {
                
                HStack {
                    Spacer()
                    
                    Button {
                        resetValues()
                    } label: {
                        Text("Reset")
                    }
                }
                
                HStack {
                    Text("Width: ")
                    Slider(value: $width, in: 0...UIScreen.main.bounds.width)
                    Text("\(width, specifier: "%.0f")")
                }
                
                HStack {
                    Text("Height: ")
                    Slider(value: $height, in: 0...UIScreen.main.bounds.height)
                    Text("\(height, specifier: "%.0f")")
                }
                
                HStack {
                    Text("Corner Radius: ")
                    Slider(value: $cornerRadius, in: 0...200)
                    Text("\(cornerRadius, specifier: "%.0f")")
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
               
                ColorPicker("Color Overlay", selection: $colorOverlay)
                
            }
            .padding()
            .offset(y: 300)
            .scaleEffect(0.8)
        }
        .ignoresSafeArea()
    }
    
    private func resetValues() {
        width = 300
        height = 150
        cornerRadius = 0
        shadowRadius = 0
        shadowOffset = 0
        blendMode = .normal
        colorOverlay = .clear
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

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(locationDataManager: LocationDataManager())
    }
}
