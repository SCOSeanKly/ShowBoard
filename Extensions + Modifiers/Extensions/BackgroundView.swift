//
//  BackgroundView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var showBgPickerSheet: Bool
    @Binding var importedBackground: UIImage?
    @Binding var hideMenuButtons: Bool
    @Binding var isDragging: Bool
    
    var body: some View {
        ZStack{
      
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center, startAngle: .zero, endAngle: .degrees(360))
                .blur(radius: 50)
                .scaleEffect(2)
                .onTapGesture(count: 2, perform: {
                    showBgPickerSheet = true
                })
            
            if let importedBackground = importedBackground {
                Image(uiImage: importedBackground)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .onTapGesture(count: 2) {
                        showBgPickerSheet = true
                    }
            }
        }
    }
}

