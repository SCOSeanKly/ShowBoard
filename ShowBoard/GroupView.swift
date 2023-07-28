//
//  GroupView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 30/06/2023.
//

import SwiftUI

struct GroupView: View {
    @Binding var isDragging: Bool
    @Binding var showMicroControls: Bool
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    @Binding var widthRatio: CGFloat
    @Binding var heightRatio: CGFloat
    @Binding var hideMenuButtons: Bool
    @Binding var showClipboardAlert: Bool
    @Binding var showLayerElementView: Bool
    @Binding var showLayerEditView: Bool
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    @Binding var importedBackground: UIImage?
    @Binding var showBgPickerSheet: Bool
    @Binding var pressedButtonObjectIndex: Int?
    @Binding var showWeatherElementView: Bool
    @Binding var showTextElementView: Bool
    @Binding var showGaugesElementView: Bool
    @Binding var showChartsElementView: Bool
    @Binding var showShapesElementView: Bool
    @Binding var showCalendarElementView: Bool
    @Binding var showMapsElementView: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var showUrlImageView: Bool
    
    var body: some View {
        Group {
            //MARK: Grid Overlay appears when dragging or micro adjustments are on screen
            GridOverlay(isDragging: $isDragging, showMicroContols: $showMicroControls)
            
            //MARK: Micro controller buttons
            MicroControlsView(offsetX: $offsetX, offsetY: $offsetY, widthRatio: $widthRatio, heightRatio: $heightRatio, showMicroControls: $showMicroControls)
                .modifier(VerticalDragModifier())
            
            //MARK:  Menu Buttons
            MenuButtonsView(hideMenuButtons: $hideMenuButtons, showClipboardAlert: $showClipboardAlert, showAdjustmentsView: $showLayerElementView, showLayerEditView: $showLayerEditView, showMicroContols: $showMicroControls)
            
            //MARK: Show Image Picker Sheets
            ImagePickerViews(importedImage1: $importedImage1, showImagePickerSheet1: $showImagePickerSheet1, importedImage2: $importedImage2, showImagePickerSheet2: $showImagePickerSheet2, importedImage3: $importedImage3, showImagePickerSheet3: $showImagePickerSheet3, importedBackground: $importedBackground, showBgPickerSheet: $showBgPickerSheet)
            
            //MARK: View containing the SheetPresentedViews
            SheetPresentedViews(pressedButtonObjectIndex: $pressedButtonObjectIndex, showLayerElementView: $showLayerElementView, showWeatherElementView: $showWeatherElementView, showTextElementView: $showTextElementView, showGaugesElementView: $showGaugesElementView, showChartsElementView: $showChartsElementView, showShapesElementView: $showShapesElementView, showCalendarElementView: $showCalendarElementView, showMapsElementView: $showMapsElementView, showImportImageElementView: $showImportImageElementView, showLayerEditView: $showLayerEditView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3, showUrlImageView: $showUrlImageView)
        }
    }
}

