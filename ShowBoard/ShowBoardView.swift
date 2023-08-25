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
    @State private var showLayerElementView = false
    @State private var showLayerEditView = false
    @State private var showGallery: Bool = false
    @State private var showAppSettings: Bool = false ///Still to be added
    
    //MARK: Observed Objects
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    
    //MARK: Micro controls - Should work on all elements once implemented correctly
    @State private var showMicroControls: Bool = false
    
    //MARK: New Variables
    @State private var placedObjects: [LayerObject] = []
    @State private var selection: UUID?
    @State private var hiddenLayers: Set<UUID> = []
    
    
    var body: some View {
        
        ZStack {
            
            //MARK: Imported Background (Wallpaper) Image
            BackgroundView(showBgPickerSheet: $showBgPickerSheet, importedBackground: $importedBackground, hideMenuButtons: $hideMenuButtons, placedObjects: $placedObjects)
                .onTapGesture {
                    if placedObjects.count >= 1 {
                        if selection != nil {
                            feedback()
                            if showMicroControls {
                                showMicroControls = false
                            } else {
                                selection = nil
                            }
                        }
                    }
                }
            
            
            //MARK: Widget Placeholder ZStack - All Elements go here
            ZStack{
                ImportedImageView1(importedImage1: importedImage1)
                    .onTapGesture {
                        if placedObjects.count >= 1 {
                            if selection != nil{
                                feedback()
                                showMicroControls = false
                            }
                        }
                        selection = nil
                    }
                
                ImportedImageView2(importedImage2: importedImage2)
                    .onTapGesture {
                        if placedObjects.count >= 1 {
                            if selection != nil{
                                feedback()
                                showMicroControls = false
                            }
                        }
                        selection = nil
                    }
                
                ForEach(self.placedObjects) { obj in
                    if !hiddenLayers.contains(obj.id) {
                        ZStack {
                            switch obj.objectType {
                            case .weatherIcon:   WeatherIconView(showMicroControls: $showMicroControls)
                            case .text:         TextObjectView(text: obj as! TextObject, showMicroControls: $showMicroControls)
                            case .map:          MapView(map: obj as! MapObject, showMicroControls: $showMicroControls)
                            case .customShape:  CustomShapeView(showMicroControls: $showMicroControls)
                            case .wavyDock:     WavyDockView(showMicroControls: $showMicroControls)
                            case .glassShape:   GlassShapeView(showMicroControls: $showMicroControls)
                            case .squareShape:  SquareShapeView(showMicroControls: $showMicroControls)
                            case .calendar:     CalendarView(showMicroControls: $showMicroControls)
                            case .batteryCircleGauge:  BatteryCircleGauge(batteryViewModel: batteryViewModel, showMicroControls: $showMicroControls)
                            case .batteryLinearGauge:  BatteryLinearGauge(batteryViewModel: batteryViewModel, showMicroControls: $showMicroControls)
                            case .hiLoCircleGauge: HiLoCircleGauge(showMicroControls: $showMicroControls)
                            case .hiLoLinearGauge: HiLoLinearGauge(showMicroControls: $showMicroControls)
                            case .conditionAsset: Condition_Asset(showMicroControls: $showMicroControls)
                            case .rain : RainView(showMicroControls: $showMicroControls)
                            case .weatherIcon2: WeatherIcon2View(showMicroControls: $showMicroControls)
                            case .weatherIcon3: WeatherIcon3View(showMicroControls: $showMicroControls)
                            case .weatherIcon4: WeatherIcon4View(showMicroControls: $showMicroControls)
                            case .weatherIcon5: WeatherIcon5View(showMicroControls: $showMicroControls)
                            case .weatherIcon6: WeatherIcon6View(showMicroControls: $showMicroControls)
                            case .weatherIconForecast: WeatherIconPlus7View(showMicroControls: $showMicroControls)
                            }
                        }
                        .onAppear {
                            if let lastAddedObject = placedObjects.last {
                                // Automatically select the last added object
                                selection = lastAddedObject.id
                            }
                        }
                        .padding(10)
                        .modifier(WidgetModifier(isDragging: $isDragging))
                        .disabled(selection == obj.id ? false : true)
                        .allowsHitTesting(selection == obj.id)
                        .fadeOnAppear()
                    }
                }
                
                ImportedImageView3(importedImage3: importedImage3)
                    .onTapGesture {
                        if placedObjects.count >= 1 {
                            if selection != nil{
                                feedback()
                                showMicroControls = false
                            }
                        }
                        selection = nil
                    }
            }
            
            GroupView(isDragging: $isDragging,
                      showMicroControls: $showMicroControls,
                      hideMenuButtons: $hideMenuButtons,
                      showClipboardAlert: $showClipboardAlert,
                      showLayerElementView: $showLayerElementView,
                      showLayerEditView: $showLayerEditView,
                      showImagePickerSheet1: $showImagePickerSheet1,
                      showImagePickerSheet2: $showImagePickerSheet2,
                      showImagePickerSheet3: $showImagePickerSheet3,
                      importedImage1: $importedImage1,
                      importedImage2: $importedImage2,
                      importedImage3: $importedImage3,
                      importedBackground: $importedBackground,
                      showBgPickerSheet: $showBgPickerSheet,
                      showGallery: $showGallery,
                      placedObjects: $placedObjects,
                      selection: $selection,
                      hiddenLayers: $hiddenLayers)
        }
        .onAppear {
            batteryViewModel.startBatteryMonitoring()
        }
        .prefersPersistentSystemOverlaysHidden()
        .modifier(AlertModifier(showClipboardAlert: $showClipboardAlert, runShortcut: {
            runShortcut() }))
    }
    
    func removeSelectedObject() {
        self.placedObjects.removeAll { $0.id == selection }
    }
    
    private func removeLayer(at index: UUID) {
        placedObjects.removeAll { $0.id == index }
    }
}

struct ShowBoardView_Previews: PreviewProvider {
    static var previews: some View {
        
        return ShowBoardView()
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .small)
            .environment(\.colorScheme, .light)
    }
}


