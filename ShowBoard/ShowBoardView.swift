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
    
    //MARK: Date formatter
    private var currentDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E. d MMM"
        return formatter.string(from: Date()).uppercased()
    }
    
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
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isDragging = false
    @State private var onAppearOpacity: Bool = false
    
    //MARK: Sheet Presented - Layer Elements
    @State private var pressedButtonObjectIndex: Int? = nil
    @State private var showLayerElementView = false
    @State private var showTextElementView = false
    @State private var showGaugesElementView = false
    @State private var showWeatherElementView = false
    @State private var showChartsElementView = false
    @State private var showShapesElementView = false
    @State private var showCalendarElementView = false
    @State private var showMapsElementView = false
    @State private var showImportImageElementView = false
    @State private var showLayerEditView = false
    @State private var showUrlImageView: Bool = false
    
    //MARK: Observed Objects
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var isRefreshing = false // Refresh trigger
    
    @State private var offsetX: CGFloat = 0.0
    @State private var offsetY: CGFloat = 0.0
    
    @State private var widthRatio: CGFloat = 1.0
    @State private var heightRatio: CGFloat = 1.0
    
    @State private var showMicroControls: Bool = false
    
    var body: some View {
        ZStack {
            
            //MARK: Background View
            BackgroundView(showBgPickerSheet: $showBgPickerSheet, importedBackground: $importedBackground, hideMenuButtons: $hideMenuButtons, isDragging: $isDragging)
            
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
            
                ZStack{
                    //MARK: Widget Placeholder ZStack - All Elements go here
                        SWAWidget2(batteryViewModel: batteryViewModel, locationDataManager: locationDataManager, weatherKitManager: weatherKitManager)
                            .scaleEffect(x: widthRatio, y: heightRatio, anchor: .center)
                            .offset(x: offsetX, y: offsetY)
                            .modifier(WidgetModifier(isDragging: $isDragging))
                            .modifier(AlertModifier(showClipboardAlert: $showClipboardAlert, runShortcut: {
                                runShortcut() }))
                }
                .opacity(onAppearOpacity ? 1.0 : 0.0)
                .onAppear{
                    performDelayedAction(after: 2.0) {
                        onAppearOpacity.toggle()
                    }
                }
            
            
            if let importedImage3 = importedImage3 {
                Image(uiImage: importedImage3)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width)
                    .allowsHitTesting(false)
            }
            
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
                
                //MARK: View containig the SheetPresentedViews
                SheetPresentedViews(pressedButtonObjectIndex: $pressedButtonObjectIndex, showLayerElementView: $showLayerElementView, showWeatherElementView: $showWeatherElementView, showTextElementView: $showTextElementView, showGaugesElementView: $showGaugesElementView, showChartsElementView: $showChartsElementView, showShapesElementView: $showShapesElementView, showCalendarElementView: $showCalendarElementView, showMapsElementView: $showMapsElementView, showImportImageElementView: $showImportImageElementView, showLayerEditView: $showLayerEditView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3, showUrlImageView: $showUrlImageView)
            }
        }
        .prefersPersistentSystemOverlaysHidden()
    }
}

struct ShowBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ShowBoardView()
    }
}

