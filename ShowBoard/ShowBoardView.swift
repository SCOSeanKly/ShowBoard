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
                ImportedImageView(importedImage1: importedImage1, importedImage2: importedImage2, importedImage3: importedImage3)
                
                ForEach(self.placedObjects) { obj in
                    VStack {
                        switch obj.objectType {
                        case .text:         TextObjectView(text: obj as! TextObject)
                        case .map:          MapView(
                                                locationDataManager: locationDataManager,
                                                map: obj as! MapObject
                                            )
                        case .circleGauge:  GlassShapeView()
                        case .customShape:  GlassShapeView()
                        case .glassShape:   GlassShapeView()
                        }
                    }
                    .padding()
                    .border(selection == obj.id ? Color.red : .clear) // Add the red border
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

//MARK: Started on the list view
struct PlacedObjectsListView: View {
    @Binding var placedObjects: [LayerObject]
    @State private var showAlert = false
    @State private var objectToDelete: LayerObject?
    @Binding var selection: UUID?
    
    let highlightColor = Color.red.opacity(0.05)
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.3.layers.3d")
                    .font(.title3)
                
                Text("Edit Layers")
                    .font(.headline.weight(.semibold))
                
                Spacer()
            }
            .padding([.leading, .vertical])
            
            if placedObjects.isEmpty {
                // Show "No Layers" text if there are no layers
                HStack {
                    Text("No editable layers added yet!")
                        .lineLimit(1)
                        .font(.body)
                }
            } else {
                List {
                    ForEach(placedObjects, id: \.id) { obj in
                        Button {
                            // Handle tap event for the list item (tapping the list would action the trash button)
                            
                            if let currentSelection = selection, currentSelection == obj.id {
                                selection = nil
                            } else {
                                selection = obj.id
                            }
                            
                        } label: {
                            
                            switch obj.objectType {
                            case .text:
                                HStack {
                                    Image(systemName: "character.textbox")
                                    Text("Text Object")
                                      
                                        
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        //Action to hide layer
                                        
                                    }, label: {
                                        
                                        /*
                                         Image(systemName:(itemButtons[index] ? "eye.slash" : "eye"))
                                         .font(.footnote)
                                         .foregroundColor(itemButtons[index] ? Color.red : Color.primary)
                                         */
                                        
                                    })
                                    .buttonStyle(.plain)
                                    
                                    Button(action: {
                                        //MARK: Show and Hide settinsg for selected layer
                                    }, label: {
                                        Image(systemName: "gear")
                                    })
                                    .buttonStyle(.plain)
                                    .padding(.horizontal)
                                    
                                    
                                    Button(action: {
                                        objectToDelete = obj
                                        showAlert = true
                                    }, label: {
                                        Image(systemName: "trash")
                                    })
                                    .foregroundColor(.red)
                                    
                                    
                                }
                               
                                
                            case .map:
                                HStack {
                                    Image(systemName: "map")
                                    Text("Map Object")
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        //Action to hide layer
                                        
                                    }, label: {
                                        
                                        /*
                                         Image(systemName:(itemButtons[index] ? "eye.slash" : "eye"))
                                         .font(.footnote)
                                         .foregroundColor(itemButtons[index] ? Color.red : Color.primary)
                                         */
                                        
                                    })
                                    .buttonStyle(.plain)
                                    
                                    Button(action: {
                                        //MARK: Show and Hide settinsg for selected layer
                                    }, label: {
                                        Image(systemName: "gear")
                                    })
                                    .buttonStyle(.plain)
                                    .padding(.horizontal)
                                    
                                    
                                    Button(action: {
                                        objectToDelete = obj
                                        showAlert = true
                                    }, label: {
                                        Image(systemName: "trash")
                                    })
                                    .foregroundColor(.red)
                                    
                                    
                                }
                            case .circleGauge:
                                Text("Circle Gauge Object")
                                    .offset(y: 50)
                            case .customShape:
                                Text("Custom Shape Object")
                                    .offset(y: 50)
                            case .glassShape:
                                HStack {
                                    Image(systemName: "square")
                                    Text("Glass Object")
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        //Action to hide layer
                                        
                                    }, label: {
                                        
                                        /*
                                         Image(systemName:(itemButtons[index] ? "eye.slash" : "eye"))
                                         .font(.footnote)
                                         .foregroundColor(itemButtons[index] ? Color.red : Color.primary)
                                         */
                                        
                                    })
                                    .buttonStyle(.plain)
                                    
                                    Button(action: {
                                        //MARK: Show and Hide settinsg for selected layer
                                    }, label: {
                                        Image(systemName: "gear")
                                    })
                                    .buttonStyle(.plain)
                                    .padding(.horizontal)
                                    
                                    
                                    Button(action: {
                                        objectToDelete = obj
                                        showAlert = true
                                    }, label: {
                                        Image(systemName: "trash")
                                    })
                                    .foregroundColor(.red)
                                    
                                    
                                }
                            }
                        }.padding(8)
                        .background(selection == obj.id ? highlightColor : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                }
                .listStyle(PlainListStyle())
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Delete Image"),
                message: Text("Are you sure you want to delete this image?"),
                primaryButton: .cancel(Text("Cancel")),
                secondaryButton: .destructive(Text("Delete"), action: {
                    if let objToDelete = objectToDelete {
                        removeLayer(at: objToDelete.id)
                    }
                })
            )
        }
    }
    
    private func removeLayer(at index: UUID) {
        placedObjects.removeAll { $0.id == index }
    }
    
}

