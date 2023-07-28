//
//  SheetPresentedViews.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct SheetPresentedViews: View {
    
    //MARK: Sheet Presented - Layer Elements
 //   @Binding var pressedButtonObjectIndex: Int?
    @Binding var showLayerElementView: Bool
    @Binding var showLayerEditView: Bool
    
    //MARK: Image Picker
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    //MARK: Show URL Image Gallery View
    @Binding var showUrlImageView: Bool
    
    //MARK: New Variables
    @Binding var placedObjects: [LayerObject]
    @Binding var selection: UUID?
   
  
    var body: some View {
        ZStack{
            /// Empty content placeholder
        }
        //MARK: Element Selection Menu
        .sheet(isPresented: $showLayerElementView) {
            ObjectSelectionView(showLayerElementView: $showLayerElementView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3, placedObjects: $placedObjects, selection: $selection)
                .customPresentationWithPrimaryBackground(detent: .large, backgroundColorOpacity: 1.0)
        }
        //MARK: Import URL Image Gallery Element
        .sheet(isPresented: $showUrlImageView) {
            URLImagesGallery(showUrlImageView: $showUrlImageView, showLayerElementView: $showLayerElementView)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
        //MARK: Layer Edit View
        .sheet(isPresented: $showLayerEditView) {
            LayerEditView(showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
    }
}

