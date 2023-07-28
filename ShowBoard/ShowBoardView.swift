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
    @StateObject var locationDataManager = LocationDataManager()
    @ObservedObject var weatherKitManager = WeatherKitManager()
    @State private var isRefreshing = false // Refresh trigger
    
    //MARK: Micro controls - Should work on all elements once implemented correctly
    @State private var offsetX: CGFloat = 0.0
    @State private var offsetY: CGFloat = 0.0
    @State private var widthRatio: CGFloat = 1.0
    @State private var heightRatio: CGFloat = 1.0
    @State private var showMicroControls: Bool = false
    
    //MARK: New Variables
    @State private var placedObjects: [LayerObject] = []
    @State private var selection: UUID?
    
    
    var body: some View {
        ZStack {
            
            //MARK: Imported Background (Wallpaper) Image
            BackgroundView(showBgPickerSheet: $showBgPickerSheet, importedBackground: $importedBackground, hideMenuButtons: $hideMenuButtons)
            
            //MARK: Widget Placeholder ZStack - All Elements go here
            ZStack{
                
                /// These Image views should be able to be placed in and zIndex order
                ImportedImageView(importedImage1: importedImage1, importedImage2: importedImage2, importedImage3: importedImage3)
                
               // PlacedObjectsListView(placedObjects: $placedObjects)
                
                ForEach(self.placedObjects) { obj in
                    VStack {
                        
                        switch obj.objectType {
                        case .text:         Text("Insert Text View Here").hidden(); GlassShapeView()
                        case .map:          Text("Insert map here").hidden(); GlassShapeView()
                        case .circleGauge:  Text("Insert circle gauge here").hidden(); GlassShapeView()
                        case .customShape:  Text("Custom shape").hidden(); GlassShapeView()
                        case .glassShape:    Text("Glass Shape").hidden(); GlassShapeView()
                              
                        }
                    }
                    .padding()
                    .border(selection == obj.id ? .red : .clear)
                    .simultaneousGesture(TapGesture()
                        .onEnded { self.selection = obj.id }
                    )
                    .onLongPressGesture { //MARK: ONLY A TEST TO DELETE THE LAYER
                        removeLayer(at: obj.id)
                    }
                    
                    .modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
                    .fadeOnAppear()
                }
            }
            
           
            
            /// Group View has: Grid Overlay, Micro Controller Buttons, Manu Buttons, Image Picker Sheets and Sheet Presented Views
            GroupView(isDragging: $isDragging, showMicroControls: $showMicroControls, offsetX: $offsetX, offsetY: $offsetY, widthRatio: $widthRatio, heightRatio: $heightRatio, hideMenuButtons: $hideMenuButtons, showClipboardAlert: $showClipboardAlert, showLayerElementView: $showLayerElementView, showLayerEditView: $showLayerEditView, showImagePickerSheet1: $showImagePickerSheet1, showImagePickerSheet2: $showImagePickerSheet2, showImagePickerSheet3: $showImagePickerSheet3, importedImage1: $importedImage1, importedImage2: $importedImage2, importedImage3: $importedImage3, importedBackground: $importedBackground, showBgPickerSheet: $showBgPickerSheet, showUrlImageView: $showUrlImageView, placedObjects: $placedObjects, selection: $selection)
            
            
            
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
        ShowBoardView()
    }
}

/* //MARK: Started on the list view
struct PlacedObjectsListView: View {
    @Binding var placedObjects: [LayerObject]
    
    var body: some View {
        List {
            ForEach(placedObjects, id: \.id) { obj in
                switch obj.objectType {
                case .text:
                    HStack {
                        Image(systemName: "photo")
                        Text("Text Object")
                        
                        Spacer()
                        
                        Button(action: {
                            removeLayer(at: obj.id)
                        }, label: {
                            Image(systemName: "minus.circle")
                        })
                        .foregroundColor(.red)
                    }
                    
                case .map:
                    Text("Map Object")
                        .offset(y: 50)
                case .circleGauge:
                    Text("Circle Gauge Object")
                        .offset(y: 50)
                case .customShape:
                    Text("Custom Shape Object")
                        .offset(y: 50)
                case .glassShape:
                    Text("Glass Shape Object")
                        .offset(y: 50)
                }
            }
        }
        .listStyle(PlainListStyle())
        .padding(.top, 200)
    }
    
    private func removeLayer(at index: UUID) {
        placedObjects.removeAll { $0.id == index }
    }
}
*/
