//
//  ImportedImageView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ImportedImageView: View {
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


