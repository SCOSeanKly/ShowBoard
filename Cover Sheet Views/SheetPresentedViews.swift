//
//  SheetPresentedViews.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI

struct SheetPresentedViews: View {
    
    //MARK: Sheet Presented - Layer Elements
    @Binding var pressedButtonObjectIndex: Int?
    @Binding var showLayerElementView: Bool
    
    /*
    @Binding var showWeatherElementView: Bool
    @Binding var showTextElementView: Bool
    @Binding var showGaugesElementView: Bool
    @Binding var showChartsElementView: Bool
    @Binding var showShapesElementView: Bool
    @Binding var showCalendarElementView: Bool
    @Binding var showMapsElementView: Bool
     */
    
    @Binding var showImportImageElementView: Bool
    @Binding var showLayerEditView: Bool
    
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    @Binding var showUrlImageView: Bool
  //  @Binding var showDynamicTextEditView: Bool
   
  
    var body: some View {
        ZStack{
            /// Empty content placeholder
        }
        
        //MARK: Element Selection Menu
        .sheet(isPresented: $showLayerElementView) {
       
            ObjectSelectionView(showLayerElementView: $showLayerElementView, showImportImageElementView: $showImportImageElementView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
        
        /*
        //MARK: Import Image Element
        .sheet(isPresented: $showImportImageElementView) {
            ImportImageElementView(showLayerElementView: $showLayerElementView, showImportImageElementView: $showImportImageElementView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
        //MARK: Import URL Image Element
        .sheet(isPresented: $showUrlImageView) {
            URLImages(showUrlImageView: $showUrlImageView, showLayerElementView: $showLayerElementView)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
         */ //MARK: Not Used - To be removed
        
        //MARK: Layer Edit View
        .sheet(isPresented: $showLayerEditView) {
            LayerEditView(showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView)
                .customPresentationWithPrimaryBackground(detent: .medium, detent2: .large, backgroundColorOpacity: 1.0)
        }
        
        // App Settings still to be added
      
    }
}

