//
//  ImagePickerViews.swift
//  ShowBoard
//
//  Created by Sean Kelly on 26/06/2023.
//

import SwiftUI

struct ImagePickerViews: View {
    
    //MARK: TEMP...
    @Binding var importedImage1: UIImage?
    @Binding var showImagePickerSheet1: Bool
    @Binding var importedImage2: UIImage?
    @Binding var showImagePickerSheet2: Bool
    @Binding var importedImage3: UIImage?
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedBackground: UIImage?
    @Binding var showBgPickerSheet: Bool
   
    
    var body: some View {
        ZStack{
            
        }
        .fullScreenCover(isPresented: $showBgPickerSheet) {
            PhotoPicker(filter: .images, limit: 1) { results in
                PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                    if let error = errorOrNil {
                        print(error)
                    }
                    if let images = imagesOrNil {
                        if let first = images.first {
                            print(first)
                            importedBackground = first
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $showImagePickerSheet1) {
            PhotoPicker(filter: .images, limit: 1) { results in
                PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                    if let error = errorOrNil {
                        print(error)
                    }
                    if let images = imagesOrNil {
                        if let first = images.first {
                            print(first)
                            importedImage1 = first
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $showImagePickerSheet2) {
            PhotoPicker(filter: .images, limit: 1) { results in
                PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                    if let error = errorOrNil {
                        print(error)
                    }
                    if let images = imagesOrNil {
                        if let first = images.first {
                            print(first)
                            importedImage2 = first
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .fullScreenCover(isPresented: $showImagePickerSheet3) {
            PhotoPicker(filter: .images, limit: 1) { results in
                PhotoPicker.convertToUIImageArray(fromResults: results) { (imagesOrNil, errorOrNil) in
                    if let error = errorOrNil {
                        print(error)
                    }
                    if let images = imagesOrNil {
                        if let first = images.first {
                            print(first)
                            importedImage3 = first
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
