//
//  BackgroundView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI
import SpriteKit

struct BackgroundView: View {
    @Binding var showBgPickerSheet: Bool
    @Binding var importedBackground: UIImage?
    @Binding var hideMenuButtons: Bool
    @State private var isDragging: Bool = false
    @State private var isPressing: Bool = false
    
    @State private var isRectangleAnimating = false
    @State private var xOffset: CGFloat = -UIScreen.main.bounds.width
    
    let hints = [
        "Double Tap the canvas to import a wallpaper",
        "Tap the menu icon in the top left to get started adding objects to the canvas",
        "Tap the layers icon to edit and delete layers from the canvas",
        "Use Dynamic Text to string Data and User text together",
        "When using Dynamic Text make sure to pay close attention to text case"
        // Add more hints here...
    ]
    
    @State private var currentHintIndex = 0 // Track current hint index
    @State private var timer: Timer? // Timer property
    
    var randomHint: String {
        hints[currentHintIndex]
    }
    
    @Binding var placedObjects: [LayerObject]
    
    @AppStorage("rainOrSnow") private var rainOrSnow: Bool = true
    @ObservedObject var manager = MotionManager()
    
    
    var body: some View {
        ZStack{
            
            Image("sky")
                .resizable()
                .ignoresSafeArea()
                .overlay {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 50, opaque: true)
                }
            
            if (placedObjects.count == 0) {
                
                if rainOrSnow {
                    SpriteView(scene: RainFall(),options: [.allowsTransparency])
                        .mask{
                            LinearGradient(gradient: Gradient(colors: [.black, .black, .clear]), startPoint: .top, endPoint: .bottom)
                        }
                        .blur(radius: rainOrSnow ? 2 : 0)
                        .blendMode(.luminosity)
                    
                    SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                        .offset(y: UIScreen.main.bounds.height * 0.99)
                        .blendMode(.luminosity)
                        .blur(radius: rainOrSnow ? 2 : 0)
                }
                
                
                VStack {
                    HStack {
                        Text("Welcome to ShowBoard")
                            .font(.custom("Rajdhani-Medium", size: 23))
                            .shadow(radius: 1)
                        
                        CustomToggle(showTitleText: false, titleText: "", bindingValue: $rainOrSnow, onSymbol: "snowflake", offSymbol: "xmark", rotate: false)
                            .scaleEffect(0.8)
                            .frame(width: 30)
                            .padding(.horizontal)
                    }
                    .frame(height: 20)
                    
                    
                    HStack {
                        Text("HINT: ")
                            .font(.custom("Rajdhani-Medium", size: 18))
                        +
                        Text(randomHint)
                            .font(.custom("Rajdhani-Medium", size: 14))
                    }
                    .frame(height: 50)
                    .padding(.horizontal, 10)
                    .shadow(radius: 1)
                  
                  
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 100)
                .padding()
                .background {
                    ZStack {
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: 5, opaque: true)
                            .background(.white.opacity(0.05))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.9), Color.white.opacity(0.2), Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3), Color.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.2)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2.0)
               // .modifier(ParallaxMotionModifier(manager: manager, magnitude: 20))
                .scaleEffect(isPressing ? 0.9 : 1.0)
                .animation(.interpolatingSpring(stiffness: 300, damping: 20), value: isPressing)
                .gesture(
                    TapGesture(count: 1)
                        .onEnded { _ in
                          
                            isPressing.toggle()
                            
                            feedback()
                            
                            currentHintIndex = (currentHintIndex + 1) % hints.count
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressing.toggle()
                                stopTimer()
                                startTimer()
                            }
                        }
                )
            }
            
            
            
            if let importedBackground = importedBackground {
                Image(uiImage: importedBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
            }
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
        .onTapGesture(count: 2) {
            showBgPickerSheet = true
        }
    }
    // New functions to manage the timer
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            currentHintIndex = (currentHintIndex + 1) % hints.count
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

