//
//  BackgroundView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct ImportedImagesView: View {
    @Binding var showBgPickerSheet: Bool
    @Binding var importedBackground: UIImage?
    @Binding var hideMenuButtons: Bool
    @Binding var isDragging: Bool
    
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    
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
            
            ImageViews(importedImage1: importedImage1, importedImage2: importedImage2, importedImage3: importedImage3)
            
        }
    }
}



struct ImageViews: View {
    let importedImage1: UIImage?
    let importedImage2: UIImage?
    let importedImage3: UIImage?
    
    var body: some View {
        ZStack {
            
            if let importedImage1 = importedImage1 {
                Image(uiImage: importedImage1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
            }
            
            if let importedImage2 = importedImage2 {
                Image(uiImage: importedImage2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
            }
            
            if let importedImage3 = importedImage3 {
                Image(uiImage: importedImage3)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .allowsHitTesting(false)
            }
        }
    }
}

