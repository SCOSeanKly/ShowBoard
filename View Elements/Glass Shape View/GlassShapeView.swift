//
//  GlassShape.swift
//  ShowBoard
//
//  Created by Sean Kelly on 27/06/2023.
//

import SwiftUI


struct GlassShapeView: View {
    
    @StateObject var shape = CustomShapeObject()
    @State private var showSettings: Bool = false
    
    var body: some View {
        
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .foregroundColor(.clear)
                    .background {
                        TransparentBlurView(removeAllFilters: true)
                            .blur(radius: shape.shapeBlur, opaque: true)
                            .background(.white.opacity(0.05))
                    }
                    .clipShape(RoundedRectangle(cornerRadius: shape.appearance.cornerRadius))
                
                if shape.shapeGrain {
                    Image("grain")
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: shape.appearance.cornerRadius))
                        .blendMode(.multiply)
                        .opacity(0.2)
                }
                
                RoundedRectangle(cornerRadius: shape.appearance.cornerRadius)
                    .strokeBorder(LinearGradient(colors: [Color.white.opacity(0.4), Color.white.opacity(0), Color.white.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)
                
            }
            .frame(width: shape.shapeFrameWidth,  height: shape.shapeFrameHeight)
            .shadow(color: .black.opacity(shape.appearance.shadowOpacity), radius: shape.appearance.shadow.radius, y: shape.appearance.shadow.offset.y)
            .animation(.spring())
            .padding(.top, 100)
            .onTapGesture {
                showSettings.toggle()
            }
            Spacer()
        }
        .sheet(isPresented: $showSettings){
            //MARK: Glass shape settings
            GlassShapeSettings(shape: shape)
        }
      
        
    }
}



struct GlassShapeView_Previews: PreviewProvider {
    static var previews: some View {
        GlassShapeView()
    }
}
