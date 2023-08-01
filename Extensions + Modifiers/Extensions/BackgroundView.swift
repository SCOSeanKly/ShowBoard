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
                                .blur(radius: 30, opaque: true)
                            
                            SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                                .blendMode(.luminosity)
                               
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                      
                    
                    SpriteView(scene: RainFallLanding(),options: [.allowsTransparency])
                        .blendMode(.luminosity)
                        .offset(y: UIScreen.main.bounds.height * 0.99)
                     
                
                    VStack {
                        Text("Welcome to ShowBoard")
                            .fontWeight(.bold)
                        
                        Text("Tap the ") +
                        Text("\(Image(systemName: "square.grid.2x2"))")
                            .fontWeight(.bold) +
                        Text(" button to get started")
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Text("HINT: ")
                            .fontWeight(.bold) +
                        Text("Double Tap ") +
                        
                        Text("to import a wallpaper")
                        
                        
                    }
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 100)
                    
                    
                    
                }
              //  .modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
            
            if let importedBackground = importedBackground {
                Image(uiImage: importedBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                  
            }
        }
        .onTapGesture(count: 2) {
            showBgPickerSheet = true
        }
       
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



