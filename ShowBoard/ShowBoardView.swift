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
    @State private var showLayerElementView = false
    @State private var showLayerEditView = false
    @State private var showUrlImageView: Bool = false
    @State private var showAppSettings: Bool = false ///Still to be added
    
    //MARK: Observed Objects
    @ObservedObject private var batteryViewModel = BatteryViewModel()
    
    //MARK: Micro controls - Should work on all elements once implemented correctly
    @State private var showMicroControls: Bool = false
    @StateObject var micro: MicroControls

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
                            case .text:         TextObjectView(text: obj as! TextObject)
                            case .map:          MapView(map: obj as! MapObject)
                            case .circleGauge:  BatteryCircleGauge(batteryViewModel: batteryViewModel)
                            case .customShape:  CustomShapeView()
                            case .wavyDock:     WavyDockView()
                            case .glassShape:   GlassShapeView()
                            case .weatherIcon:  WeatherIconView(weatherIconObject: WeatherIconLayerObject())
                            case .squareShape:  SquareShapeView()
                            }
                        }
                        .padding(10)
                        .overlay {
                            MarchingAntsBorder(opacity: selection == obj.id ? 1 : 0)
                        }
                        .if(obj.objectType != .wavyDock) { content in
                            content.modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
                        }
                        .disabled(selection == obj.id ? false : true)
                        .allowsHitTesting(selection == obj.id)
                        .fadeOnAppear()
                        .offset(x: obj.id == selection ? micro.offsetX : 0, y: obj.id == selection ? micro.offsetY : 0)
                        .onLongPressGesture {
                            showMicroControls.toggle()
                        }
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
                
                //MARK: Micro controls for fine adjustment. Currently when deslected the image jumps back
                MicroControlsView(micro: micro, showMicroControls: $showMicroControls)

            }
            
            /// Group View has: Grid Overlay, Micro Controller Buttons, Manu Buttons, Image Picker Sheets and Sheet Presented Views
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
                      showUrlImageView: $showUrlImageView,
                      placedObjects: $placedObjects,
                      selection: $selection,
                      hiddenLayers: $hiddenLayers)   
        }
        .onAppear {
            batteryViewModel.startBatteryMonitoring()
        }
        .prefersPersistentSystemOverlaysHidden()
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
        let microControls = MicroControls()

        return ShowBoardView(micro: microControls)
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .small)
            .environment(\.colorScheme, .light)
    }
}



