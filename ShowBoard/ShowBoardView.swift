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
   // @StateObject var shape = CustomShapeObject()
    
    
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
    @State private var hiddenLayers: Set<UUID> = []
   
    
   
    
    var body: some View {
        ZStack {
            
            //MARK: Imported Background (Wallpaper) Image
            BackgroundView(showBgPickerSheet: $showBgPickerSheet, importedBackground: $importedBackground, hideMenuButtons: $hideMenuButtons, placedObjects: $placedObjects)
                .onTapGesture {
                    if placedObjects.count >= 1 {
                        if selection != nil {
                            feedback()
                            
                            // Check if micro controls are in view
                            if showMicroControls {
                                // Close the micro controls
                                showMicroControls = false
                            } else {
                                // De-select the layer
                               selection = nil
                            }
                        }
                    }
                }

            
            //MARK: Widget Placeholder ZStack - All Elements go here
            ZStack{
                ImportedImageView(importedImage1: importedImage1, importedImage2: importedImage2, importedImage3: importedImage3)
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
                            case .map:          MapView( map: obj as! MapObject)
                            case .circleGauge:  BatteryCircleGauge(batteryViewModel: batteryViewModel)
                            case .customShape:  CustomShapeView()
                            case .glassShape:   GlassShapeView()
                            case .weatherIcon:  WeatherIconView(weatherIconObject: WeatherIconLayerObject())
                            }
                        }
                        .padding(10)
                        .background {
                            MarchingAntsBorder(opacity: selection == obj.id ? 1 : 0)
                        }
                        .offset(x: obj.id == selection ? offsetX : 0, y: obj.id == selection ? offsetY : 0)
                        .scaleEffect(obj.id == selection ? CGSize(width: widthRatio, height: heightRatio) : CGSize(width: 1.0, height: 1.0))
                        .onLongPressGesture {
                            showMicroControls.toggle()
                        }
                        .modifier(WidgetModifier(isDragging: $isDragging, enableZoom: false))
                      
                        .disabled(selection == obj.id ? false : true)
                        .allowsHitTesting(selection == obj.id ? true : false)
                        .fadeOnAppear()
                    }
                }
            }
            
            /// Group View has: Grid Overlay, Micro Controller Buttons, Manu Buttons, Image Picker Sheets and Sheet Presented Views
            GroupView(isDragging: $isDragging,
                      showMicroControls: $showMicroControls,
                      offsetX: $offsetX,
                      offsetY: $offsetY,
                      widthRatio: $widthRatio,
                      heightRatio: $heightRatio,
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
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .small)
            .environment(\.colorScheme, .light)
    }
}





//MARK: Started on the list view
struct PlacedObjectsListView: View {
    @Binding var placedObjects: [LayerObject]
    @State private var showAlert = false
    @State private var objectToDelete: LayerObject?
    @Binding var selection: UUID?
    @Binding var hiddenLayers: Set<UUID>
    @State private var isPressing: Bool = false
    @State private var isPressingHideLayer: Bool = false
    @State private var isPressingSettings: Bool = false
    @State private var isPressingDelete: Bool = false
    @Binding var showLayerEditView: Bool
    
    let highlightColor = Color.red.opacity(0.05)
    
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.3.layers.3d")
                    .font(.title3)
                
                Text("Edit Layers")
                    .font(.headline.weight(.semibold))
                
                Spacer()
                
                if placedObjects.count > 1 {
                    Button(action: {
                        showAlertForDeleteAllLayers()
                    }, label: {
                        Text("Delete All")
                            .foregroundColor(.red)
                            .padding(.trailing)
                    })
                }
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
                    ForEach(Array(placedObjects.enumerated()), id: \.element.id) { (index, obj) in
                        Button {
                            //Selection of layer
                            feedback()
                            
                            if let currentSelection = selection, currentSelection == obj.id {
                                
                                selection = nil
                                
                            } else {
                                
                                selection = obj.id
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    showLayerEditView.toggle()}
                            }
                        } label: {
                            objectButtonView(for: obj)
                                .scaleEffect(isPressing ? 0.98 : 1)
                                .animation(.interpolatingSpring(stiffness: 300, damping: 20), value: isPressing)
                                .opacity(hiddenLayers.contains(obj.id) ? 0.4 : 1.0)
                        }
                        .padding(8)
                        .background(selection == obj.id ? highlightColor : Color.clear)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    .onMove(perform: moveLayer)
                }
                .listStyle(.plain)
                
            }
            
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            if let objectToDelete = objectToDelete {
                return Alert(
                    title: Text("Delete Layer"),
                    message: Text("Are you sure you want to delete this layer?"),
                    primaryButton: .cancel(Text("Cancel")),
                    secondaryButton: .destructive(Text("Delete"), action: {
                        removeLayer(at: objectToDelete.id)
                        if placedObjects.isEmpty {
                            showLayerEditView.toggle()
                        }
                    })
                )
            } else {
                return Alert(
                    title: Text("Delete All Layers"),
                    message: Text("Are you sure you want to delete all layers?"),
                    primaryButton: .cancel(Text("Cancel")),
                    secondaryButton: .destructive(Text("Delete All"), action: {
                        removeAllLayers()
                        if placedObjects.isEmpty {
                            showLayerEditView.toggle()
                        }
                    })
                )
            }
        }
    }
    
    private func moveLayer(from source: IndexSet, to destination: Int) {
        // Reorder the placedObjects array based on the new index
        placedObjects.move(fromOffsets: source, toOffset: destination)
    }
    
    
    private func showAlertForDeleteAllLayers() {
        showAlert = true
        objectToDelete = nil
    }
    
    private func removeAllLayers() {
        placedObjects.removeAll()
    }
    
    private func removeLayer(at index: UUID) {
        placedObjects.removeAll { $0.id == index }
    }
    
    private func objectButtonView(for obj: LayerObject) -> some View {
        let objectTypeInfo: ObjectTypeInfo
        
        switch obj.objectType {
        case .text: objectTypeInfo = .text
        case .map: objectTypeInfo = .map
        case .circleGauge: objectTypeInfo = .circleGauge
        case .customShape: objectTypeInfo = .customShape
        case .glassShape: objectTypeInfo = .glassShape
        case .weatherIcon: objectTypeInfo = .weatherIcon
      
        }
        
        return HStack {
            Image(systemName: objectTypeInfo.icon)
            Text(objectTypeInfo.title)
            
            Spacer()
            
            Button(action: {
                // Action to hide or show layer
                
                isPressingHideLayer.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    feedback()
                    isPressingHideLayer.toggle()
                }
                if hiddenLayers.contains(obj.id) {
                    hiddenLayers.remove(obj.id)
                } else {
                    hiddenLayers.insert(obj.id)
                }
            }, label: {
                Image(systemName: hiddenLayers.contains(obj.id) ? "eye.slash" : "eye")
                    .scaleEffect(isPressingHideLayer ? 0.9 : 1)
                    .scaleEffect(0.9)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isPressingHideLayer)
            })
            .buttonStyle(.plain)
            
            /*
            Button(action: {
                isPressingSettings.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    feedback()
                    isPressingSettings.toggle()
                }
            }, label: {
                Image(systemName: "gear")
                    .scaleEffect(isPressingSettings ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isPressingSettings)
            })
            .buttonStyle(.plain)
            .padding(.horizontal)
             */
            
            Button(action: {
                isPressingDelete.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    feedback()
                    isPressingDelete.toggle()
                }
                objectToDelete = obj
                showAlert = true
                
            }, label: {
                Image(systemName: "trash")
                    .scaleEffect(isPressingDelete ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isPressingDelete)
            })
            .foregroundColor(.red)
        }
        
    }
    
    
    // Store icons and titles for each objectType in an enum
    enum ObjectTypeInfo {
        case text
        case map
        case circleGauge
        case customShape
        case glassShape
        case weatherIcon
       
        
        
        var icon: String {
            switch self {
            case .text: return "character.textbox"
            case .map: return "map"
            case .circleGauge: return "circle"
            case .customShape: return "star"
            case .glassShape: return "square"
            case .weatherIcon: return "sun.max"
          
                
            }
        }
        
        var title: String {
            switch self {
            case .text: return "Text Object"
            case .map: return "Map Object"
            case .circleGauge: return "Circle Gauge Object"
            case .customShape: return "Custom Shape Object"
            case .glassShape: return "Glass Object"
            case .weatherIcon: return "Weather Icon Object"
          
                
            }
        }
    }
}

//MARK: For the micro controls
/*
 @State private var microControlSettings: [UUID: MicroControlSettings] = [:]

 struct MicroControlSettings {
     var offsetX: CGFloat
     var offsetY: CGFloat
     var widthRatio: CGFloat
     var heightRatio: CGFloat
 }
 
 .onLongPressGesture {
     feedback()
     showMicroControls.toggle()
     
     if let selectedLayer = placedObjects.first(where: { $0.id == obj.id }) {
         microControlSettings[obj.id] = MicroControlSettings(
             offsetX: offsetX,
             offsetY: offsetY,
             widthRatio: widthRatio,
             heightRatio: heightRatio
         )
     }
 }

 
 .offset(x: microControlSettings[obj.id]?.offsetX ?? 0, y: microControlSettings[obj.id]?.offsetY ?? 0)
 .scaleEffect(
     CGSize(
         width: microControlSettings[obj.id]?.widthRatio ?? 1.0,
         height: microControlSettings[obj.id]?.heightRatio ?? 1.0
     )
 )


 */
