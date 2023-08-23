//
//  ImagePickerViews.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/06/2023.
//

import SwiftUI

struct ImagePickerViews: View {
    
    @Binding var importedImage1: UIImage?
    @Binding var showImagePickerSheet1: Bool
    @Binding var importedImage2: UIImage?
    @Binding var showImagePickerSheet2: Bool
    @Binding var importedImage3: UIImage?
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedBackground: UIImage?
    @Binding var showBgPickerSheet: Bool
    
    
    var body: some View {
        ZStack {
            /// Empty content placeholder
        }
        .fullScreenCover(isPresented: $showBgPickerSheet) {
            createFullScreenCover(for: $importedBackground) { images in
                importedBackground = images.first
            }
        }
        .fullScreenCover(isPresented: $showImagePickerSheet1) {
            createFullScreenCover(for: $importedImage1) { images in
                importedImage1 = images.first
            }
        }
        .fullScreenCover(isPresented: $showImagePickerSheet2) {
            createFullScreenCover(for: $importedImage2) { images in
                importedImage2 = images.first
            }
        }
        .fullScreenCover(isPresented: $showImagePickerSheet3) {
            createFullScreenCover(for: $importedImage3) { images in
                importedImage3 = images.first
            }
        }
    }
    
    private func createFullScreenCover(for binding: Binding<UIImage?>, completion: @escaping ([UIImage]) -> Void) -> some View {
        PhotoPicker(filter: .images, limit: 1) { results in
            PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                if let error = errorOrNil {
                    print(error)
                }
                if let images = imagesOrNil {
                    completion(images)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
