//
//  PositionButton.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/06/2023.
//
import SwiftUI

struct PositionButton: View {
    
    @StateObject var layer: LayerObject
    
    let stackSpacing: Double = 10
    @State private var isDragging = false
    @State private var microAdjustment: Bool = false
    @State private var customXValue: String = ""
    @State private var customYValue: String = ""
    @State private var showTextControls: Bool = false
    
    
    var offsetValue: CGFloat {
        return microAdjustment ? 0.5 : 4
    }
    
    func resetValues() {
        layer.appearance.offsetX = 0
        layer.appearance.offsetY = 0
    }
    
    var body: some View {
        ZStack {
            if !showTextControls {
                VStack(spacing: stackSpacing) {
                    
                    HStack {
                        Text("POSITION")
                            .font(.system(size: 10))
                            .textCase(.uppercase)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .offset(x: 22)
                        VStack {
                            Toggle("", isOn: $microAdjustment)
                                .frame(width: 40)
                                .scaleEffect(0.5)
                                .rotationEffect(Angle(degrees: -270))
                            Text("µ")
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .offset(y: -5)
                        }
                        .offset(x: 17, y: 32)
                    }
                    .frame(width: 150, height: 10)
                    
                    ZStack {
                        PressableButtonView(systemImage: "arrow.up") {
                            layer.appearance.offsetY -= offsetValue
                        }
                        VStack {
                            Text("X: \(String(format: "%.1f", layer.appearance.offsetX))")
                                .font(.system(size: 8))
                                .foregroundColor(.black)
                            
                            Text("Y: \(String(format: "%.1f", layer.appearance.offsetY))")
                                .font(.system(size: 8))
                                .foregroundColor(.black)
                            
                        }
                        .offset(x: -50)
                        .onTapGesture {
                            showTextControls.toggle()
                        }
                    }
                    
                    HStack(spacing: stackSpacing) {
                        
                        PressableButtonView(systemImage: "arrow.left") {
                            layer.appearance.offsetX -= offsetValue
                        }
                        PressableButtonView(systemImage: "arrow.counterclockwise") {
                            resetValues()
                        }
                        PressableButtonView(systemImage: "arrow.right") {
                            layer.appearance.offsetX += offsetValue
                        }
                    }
                    
                    PressableButtonView(systemImage: "arrow.down") {
                        layer.appearance.offsetY += offsetValue
                    }
                }
                .scaleEffect(0.9)
                
            } else {
                ZStack {
                    VStack {
                        
                        Text("POSITION")
                            .font(.system(size: 10))
                            .textCase(.uppercase)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        
                        TextField("X", text: $customXValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .keyboardType(.numbersAndPunctuation)
                            .onSubmit {
                                if let customX = Double(customXValue) {
                                    layer.appearance.offsetX = CGFloat(customX)
                                    showTextControls = false
                                }
                            }
                        TextField("Y", text: $customYValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .keyboardType(.numbersAndPunctuation)
                            .onSubmit {
                                if let customY = Double(customYValue) {
                                    layer.appearance.offsetY = CGFloat(customY)
                                    showTextControls = false
                                }
                            }
                    }
                    .frame(width: 150, height: 100)
                    .padding()
                    .background(.white)
                    
                    ZStack {
                        Button {
                            showTextControls = false
                        }label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                    .frame(width: 20, height: 20)
                    .offset(x: 50, y: -50)
                    .tint(.red)
                }
            }
        }
        .frame(width: 150)
    }
}

struct ScaleButton: View {
    @StateObject var layer: LayerObject
    
    let stackSpacing: Double = 10
    @State private var isDragging = false
    @State private var microAdjustment: Bool = false
    
    @State private var customWidthValue: String = ""
    @State private var customHeightValue: String = ""
    @State private var showTextControls: Bool = false
    
    
    var scaleValue: CGFloat {
        return microAdjustment ? 0.01 : 0.1
    }
    
    func resetValues() {
        layer.appearance.scaleWidth = 1
        layer.appearance.scaleHeight = 1
    }
    
    var body: some View {
        ZStack {
            if !showTextControls {
                VStack(spacing: stackSpacing) {
                    
                    HStack {
                        Text("SCALE")
                            .font(.system(size: 10))
                            .textCase(.uppercase)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .offset(x: 22)
                        VStack {
                            Toggle("", isOn: $microAdjustment)
                                .frame(width: 40)
                                .scaleEffect(0.5)
                                .rotationEffect(Angle(degrees: -270))
                            Text("µ")
                                .font(.system(size: 10))
                                .foregroundColor(.black)
                                .offset(y: -5)
                        }
                        .offset(x: 25, y: 32)
                    }
                    .frame(width: 150, height: 10)
                    
                    ZStack {
                        PressableButtonView(systemImage: "plus") {
                            layer.appearance.scaleHeight += scaleValue
                        }
                        
                        VStack {
                            Text("W: \(String(format: "%.2f", layer.appearance.scaleWidth))")
                                .font(.system(size: 8))
                                .foregroundColor(.black)
                            
                            Text("H: \(String(format: "%.2f", layer.appearance.scaleHeight))")
                                .font(.system(size: 8))
                                .foregroundColor(.black)
                            
                        }
                        .offset(x: -50)
                        .onTapGesture {
                            showTextControls.toggle()
                        }
                    }
                    
                    HStack(spacing: stackSpacing) {
                        
                        PressableButtonView(systemImage: "minus") {
                            layer.appearance.scaleWidth -= scaleValue
                        }
                        PressableButtonView(systemImage: "arrow.counterclockwise") {
                            resetValues()
                        }
                        PressableButtonView(systemImage: "plus") {
                            layer.appearance.scaleWidth += scaleValue
                        }
                    }
                    
                    PressableButtonView(systemImage: "minus") {
                        layer.appearance.scaleHeight -= scaleValue
                    }
                }
                .scaleEffect(0.9)
            }
            else {
                ZStack {
                    VStack {
                        
                        Text("SCALE")
                            .font(.system(size: 10))
                            .textCase(.uppercase)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                        
                        TextField("Width", text: $customWidthValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .keyboardType(.numbersAndPunctuation)
                            .onSubmit {
                                if let customWidth = Double(customWidthValue) {
                                    layer.appearance.scaleWidth = CGFloat(customWidth)
                                    showTextControls = false
                                }
                            }
                        
                        TextField("Height", text: $customHeightValue)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 100)
                            .keyboardType(.numbersAndPunctuation)
                            .onSubmit {
                                if let customHeight = Double(customHeightValue) {
                                    layer.appearance.scaleHeight = CGFloat(customHeight)
                                    showTextControls = false
                                }
                            }
                    }
                    .frame(width: 150, height: 100)
                    .padding()
                    .background(.white)
                    
                    ZStack {
                        Button {
                            showTextControls = false
                        }label: {
                            Image(systemName: "xmark.circle.fill")
                        }
                    }
                    .frame(width: 20, height: 20)
                    .offset(x: 50, y: -50)
                    .tint(.red)
                }
               
            }
        }
        .frame(width: 150)
    }
}

struct SettingsButton: View {
    
    var layerFrameSize: Double = 50
    var cornerRadius: Double = 12
    var systemImage:String = "arrow.up.left.and.arrow.down.right"
    var colour:Color = Color.black
    var lineWidth: Double = 0.3
    var fontSize: Double = 20
    @State private var isPressing: Bool = false
    
    
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(colour,  lineWidth: lineWidth)
                .frame(width: layerFrameSize, height: layerFrameSize)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.white)
                }
                .shadow(color: Color.black.opacity(0.2), radius: isPressing ? 0.0 : 2.0, x: 0.0, y: isPressing ? 0.0 : 1.0)
                .scaleEffect(isPressing ? 0.9 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(colour,  lineWidth: lineWidth)
                .frame(width: layerFrameSize, height: layerFrameSize)
                .background {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(.ultraThinMaterial)
                }
                .scaleEffect(isPressing ? 0.8 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
            
            Image(systemName: systemImage)
                .font(.system(size: fontSize))
                .foregroundColor(.black)
                .scaleEffect(isPressing ? 0.7 : 1)
                .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
        }
    }
}





