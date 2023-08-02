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
    
    @State private var isRectangleAnimating = false
    @State private var xOffset: CGFloat = -UIScreen.main.bounds.width
    
    let hints = [
        "Double Tap the canvas to import a wallpaper",
        "Tap the menu icon in the top left to get started adding objects to the canvas",
        "Tap the layers icon to edit and delete layers from the canvas",
        // Add more hints here...
    ]
    
    @State private var currentHintIndex = 0 // Track current hint index
    @State private var timer: Timer? // Timer property
    
    var randomHint: String {
        hints[currentHintIndex]
    }
    
    var body: some View {
        ZStack{
            
            Image("sky")
                .resizable()
                .ignoresSafeArea()
                .overlay {
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 50, opaque: true)
                    
                }
            
            SpriteView(scene: RainFall(),options: [.allowsTransparency])
                .blendMode(.luminosity)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 100)
                    .foregroundColor(.clear)
                    .background{
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: 5, opaque: true)
                        
                        SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                            .blendMode(.luminosity)
                        /*
                        LinearGradient(gradient: Gradient(colors: [.white, .clear]), startPoint: .top, endPoint: .bottom)
                            .opacity(0.3)
                            .frame(width: 100, height: 200)
                            .rotationEffect(Angle(degrees: 35))
                            .offset(x: xOffset)
                            .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                            .onAppear {
                                xOffset = UIScreen.main.bounds.width + 50
                            }
                         */
                        
                       
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                
                SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                    .blendMode(.luminosity)
                    .offset(y: UIScreen.main.bounds.height * 0.99)
                
                
                VStack {
                    Text("Welcome to ShowBoard")
                        .font(.custom("Rajdhani-Medium", size: 23))
                        .shadow(radius: 1)
                       
                    /*
                    Text("Tap the ") +
                    Text("\(Image(systemName: "square.grid.2x2"))")
                        .fontWeight(.bold) +
                    Text(" button to get started")
                     */
                    
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Text("HINT: ")
                            .font(.custom("Rajdhani-Medium", size: 18))
                        +
                        Text(randomHint)
                            .font(.custom("Rajdhani-Medium", size: 14))
                           
                    }
                    .padding(.horizontal, 10)
                    .shadow(radius: 1)
                    
                    
                    
                }
                .font(.subheadline)
                .foregroundColor(.white)
                .frame(width: 300, height: 100)
                
                
                
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

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .small)
            .environment(\.colorScheme, .light)
    }
}

/*
 import SwiftUI
 import SpriteKit

 struct BackgroundView: View {
     @Binding var showBgPickerSheet: Bool
     @Binding var importedBackground: UIImage?
     @Binding var hideMenuButtons: Bool
     @State private var isDragging: Bool = false
     
     @State private var isRectangleAnimating = false
     @State private var xOffset: CGFloat = -UIScreen.main.bounds.width
     
     let hints = [
         "Double Tap the canvas to import a wallpaper",
         "Tap the menu icon in the top left to get started adding objects to the canvas",
         "Tap the layers icon to edit and delete layers from the canvas",
         // Add more hints here...
     ]
     
     @State private var currentHintIndex = 0 // Track current hint index
     @State private var timer: Timer? // Timer property
     
     var randomHint: String {
         hints[currentHintIndex]
     }
     
     var body: some View {
         ZStack {
             // ... (other parts of the code)
             
             VStack {
                 Text("Welcome to ShowBoard")
                     .fontWeight(.bold)
                 
                 Spacer()
                     .frame(height: 20)
                 
                 Text("HINT: ")
                     .fontWeight(.bold) +
                     Text(randomHint)
             }
             .font(.subheadline)
             .foregroundColor(.white)
             .frame(width: 300, height: 100)
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
         timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
             currentHintIndex = (currentHintIndex + 1) % hints.count
         }
     }
     
     private func stopTimer() {
         timer?.invalidate()
         timer = nil
     }
 }

 struct BackgroundView_Previews: PreviewProvider {
     static var previews: some View {
         // Assuming there's a ShowBoardView struct defined
         ShowBoardView()
             .preferredColorScheme(.light)
             .environment(\.sizeCategory, .small)
             .environment(\.colorScheme, .light)
     }
 }

 */


