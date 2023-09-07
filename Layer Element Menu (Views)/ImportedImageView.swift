//
//  ImportedImageView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ImportedImageView1: View {
    let importedImage1: UIImage?
    @Binding var showBgPickerSheet: Bool
    @StateObject var image1 = ImportedImage1Object()
    @Binding var showMicroControls: Bool
    
    var body: some View {
        ZStack {
            if let importedImage1 = importedImage1 {
                Image(uiImage: importedImage1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .objectAppearanceModifier(layer: image1, systemImageName: "photo", systemImage2: "", titleText: "Layer Image 1", showMicroControls: $showMicroControls)
            }
        }
    }
}

struct ImportedImageView2: View {
    let importedImage2: UIImage?
    @Binding var showBgPickerSheet: Bool
    @StateObject var image1 = ImportedImage2Object()
    @Binding var showMicroControls: Bool
    
    var body: some View {
        ZStack {
        
            if let importedImage2 = importedImage2 {
                Image(uiImage: importedImage2)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .objectAppearanceModifier(layer: image1, systemImageName: "photo", systemImage2: "", titleText: "Layer Image 2", showMicroControls: $showMicroControls)
            }
        }
    }
}

struct ImportedImageView3: View {
    let importedImage3: UIImage?
    @Binding var showBgPickerSheet: Bool
    @StateObject var image1 = ImportedImage3Object()
    @Binding var showMicroControls: Bool
    
    var body: some View {
        ZStack {
          
            if let importedImage3 = importedImage3 {
                Image(uiImage: importedImage3)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .objectAppearanceModifier(layer: image1, systemImageName: "photo", systemImage2: "", titleText: "Layer Image 3", showMicroControls: $showMicroControls)
            }
        }
    }
}


