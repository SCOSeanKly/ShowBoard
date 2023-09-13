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
    
    @State private var showSettings: Bool = false
    
    let hints = [
        "Double Tap the canvas to import a wallpaper",
        "Tap the menu icon in the top left to get started adding objects to the canvas",
        "Tap the layers icon to edit and delete layers from the canvas",
        "Use Dynamic Text to string data and user text together",
        "When using Dynamic Text make sure to pay close attention to text case",
        "An iOS Shortcut is required to set the wallpaper",
        "Use Shortcut automations to periodically set your wallpaper",
        "Long press the wallpaper image to show additional settings"
        
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
    
    let randomImageNames = [
        "bg1",
        "bg2",
        "bg3",
        "bg4",
        "bg5",
        "bg6",
        "bg7",
        "bg8",
        "bg9"
    ]
    
    var randomImageName: String {
        randomImageNames.randomElement() ?? "sky"
    }
    
    @StateObject var wall =  WallpaperObject()
    
    var body: some View {
        ZStack{
            
            Image("bg7")
                .resizable()
                .ignoresSafeArea()
            
            
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
                        .blur(radius: rainOrSnow ? 2 : 0)
                        .blendMode(.luminosity)
                }
                
                VStack {
                    HStack {
                        HStack {
                            Text("Welcome to ShowBoard")
                                .font(.custom("Rajdhani-Medium", size: 23))
                                .shadow(radius: 1)
                            
                            Spacer()
                        }
                        
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
                        
                        Spacer ()
                    }
                    .frame(height: 50)
                    .shadow(radius: 1)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 100)
                .padding()
                .background {
                    ZStack {
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: 15, opaque: true)
                            .background(.white.opacity(0.05))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.9), Color.white.opacity(0.2), Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3), Color.white.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 0.2)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2.0)
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
                        .ignoresSafeArea()
                        .animation(.spring(), value: wall.appearance.pixellate)
                        .hueRotation(Angle(degrees: wall.appearance.hue))
                        .contrast(wall.appearance.contrast)
                        .saturation(wall.appearance.saturation)
                        .applyPixellateEffect(layer: wall)
              
                
                TransparentBlurView(removeAllFilters: true)
                    .blur(radius: wall.appearance.blur, opaque: true)
                    .ignoresSafeArea()
                    .opacity(wall.appearance.blur >= 0 ? 1: 0)
            }
        }
        .sheet(isPresented: $showSettings){
            WallpaperSettings(layer: wall)
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
        .onLongPressGesture {
            showSettings.toggle()
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 20, repeats: true) { _ in
            currentHintIndex = (currentHintIndex + 1) % hints.count
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}

extension View {
    func applyPixellateEffect(layer: LayerObject) -> some View {
        self.modifier(PixellateEffectModifier(layer: layer))
    }
}


struct PixellateEffectModifier: ViewModifier {
    @StateObject var layer: LayerObject

    func body(content: Content) -> some View {
        if #available(iOS 17.0, *) {
            return AnyView(content
                .distortionEffect(
                    .init(
                        function: .init(library: .default, name: "pixellate"),
                        arguments: [.float(layer.appearance.pixellate)]
                    ),
                    maxSampleOffset: .zero
                )
            )
        } else {
          
            return AnyView(content)
        }
    }
}


