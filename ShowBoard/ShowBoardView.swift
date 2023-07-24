//
//  TestWeatherView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 20/06/2023.
//

import SwiftUI
import CoreLocation
import Photos

struct ShowBoardView: View {
    //MARK: Modifier Variables
    @GestureState private var dragOffset = CGSize.zero
    
    //MARK: View Variables
    @State private var showBgPickerSheet = false
    @State private var importedBackground: UIImage? = nil
    
    //MARK: Test to import images
    @State private var importedImage1: UIImage? = nil
    @State private var showImagePickerSheet1 = false
    @State private var importedImage2: UIImage? = nil
    @State private var showImagePickerSheet2 = false
    @State private var importedImage3: UIImage? = nil
    @State private var showImagePickerSheet3 = false
    
    @State private var showClipboardAlert = false
    @State private var hideMenuButtons = false
    @State private var isDragging = false
    @State private var onAppearOpacity: Bool = false
    
    //MARK: Sheet Presented - Layer Elements
    @State private var pressedButtonObjectIndex: Int? = nil
    @State private var showLayerElementView = false
    @State private var showTextElementView = false
    //   @State private var showDynamicTextEditView = false
    @State private var showGaugesElementView = false
    @State private var showWeatherElementView = false
    @State private var showChartsElementView = false
    @State private var showShapesElementView = false
    @State private var showCalendarElementView = false
    @State private var showMapsElementView = false
    @State private var showImportImageElementView = false
    @State private var showLayerEditView = false
    @State private var showUrlImageView: Bool = false
    @State private var showAppSettings: Bool = false ///Still to be added
    
    //MARK: Observed Objects
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var isRefreshing = false // Refresh trigger
    
    //MARK: Micro controls - Should work on all elements once implemented correctly
    @State private var offsetX: CGFloat = 0.0
    @State private var offsetY: CGFloat = 0.0
    @State private var widthRatio: CGFloat = 1.0
    @State private var heightRatio: CGFloat = 1.0
    @State private var showMicroControls: Bool = false
    
    
    @State var objects: [any LayerObject] = Array()
    
    
    var body: some View {
        ZStack {
            
            /// Imported Background (Wallpaper) Image
            BackgroundView(showBgPickerSheet: $showBgPickerSheet, importedBackground: $importedBackground, hideMenuButtons: $hideMenuButtons, isDragging: $isDragging)
            
            
            
        
            //MARK: Widget Placeholder ZStack - All Elements go here
            ZStack{
                /// These Image views should be able to be placed in and zInde order
                ImageViews(importedImage1: importedImage1, importedImage2: importedImage2, importedImage3: importedImage3)
                
                GlassShapeView()
                
               // MapView(locationDataManager: locationDataManager)
                
            }
            .fadeOnAppear()
            
            
            
            /// Group View has: Grid Overlay, Micro Controller Buttons, Manu Buttons, Image Picker Sheets and Sheet Presented Views
            GroupView(isDragging: $isDragging, showMicroControls: $showMicroControls, offsetX: $offsetX, offsetY: $offsetY, widthRatio: $widthRatio, heightRatio: $heightRatio, hideMenuButtons: $hideMenuButtons, showClipboardAlert: $showClipboardAlert, showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3, importedBackground: $importedBackground, showBgPickerSheet: $showBgPickerSheet, pressedButtonObjectIndex: $pressedButtonObjectIndex, showWeatherElementView: $showWeatherElementView, showTextElementView: $showTextElementView, showGaugesElementView: $showGaugesElementView, showChartsElementView: $showChartsElementView, showShapesElementView: $showShapesElementView, showCalendarElementView: $showCalendarElementView, showMapsElementView: $showMapsElementView, showImportImageElementView: $showImportImageElementView, showUrlImageView: $showUrlImageView)
        }
        .prefersPersistentSystemOverlaysHidden()
    }
}

struct ShowBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
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



