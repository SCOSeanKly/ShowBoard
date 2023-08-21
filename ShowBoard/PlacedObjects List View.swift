//
//  PlacedObjects List View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI

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
   // @Binding var showLayerElementView: Bool
    
    let highlightColor = Color.blue.opacity(0.05)
    
    
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
                        .overlay {
                            MarchingAntsBorder(opacity: selection == obj.id ? 1 : 0)
                                .opacity(0.5)
                        }
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
        case .batteryCircleGauge: objectTypeInfo = .batteryCircleGauge
        case .customShape: objectTypeInfo = .customShape
        case .wavyDock: objectTypeInfo = .wavyDock
        case .glassShape: objectTypeInfo = .glassShape
        case .weatherIcon: objectTypeInfo = .weatherIcon
        case .squareShape: objectTypeInfo = .squareShape
        case .batteryLinearGauge: objectTypeInfo = .batteryLinearGauge
        case .calendar: objectTypeInfo = .calendar
        case .hiLoCircleGauge: objectTypeInfo = .hiLoCircleGauge
        case .hiLoLinearGauge: objectTypeInfo = .hiLoLinearGauge
        case .conditionAsset: objectTypeInfo = .conditionAsset
            
        }
        
        return HStack {
            Image(systemName: objectTypeInfo.icon)
            Text(objectTypeInfo.title)
            
            Spacer()
            
            //MARK: Other buttons go here
           
            
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
        case batteryCircleGauge
        case customShape
        case wavyDock
        case glassShape
        case weatherIcon
        case squareShape
        case batteryLinearGauge
        case calendar
        case hiLoCircleGauge
        case hiLoLinearGauge
        case conditionAsset
        
        
        
        var icon: String {
            switch self {
            case .text: return "character.textbox"
            case .map: return "map"
            case .batteryCircleGauge: return "timer"
            case .customShape: return "star"
            case .wavyDock: return "alternatingcurrent"
            case .glassShape: return "bubbles.and.sparkles"
            case .weatherIcon: return "sun.max"
            case .squareShape: return "square"
            case .batteryLinearGauge: return "chart.line.flattrend.xyaxis"
            case .calendar: return "calendar"
            case .hiLoCircleGauge: return "speedometer"
            case .hiLoLinearGauge: return "chart.line.flattrend.xyaxis"
            case .conditionAsset: return "sun.max"
                
                
            }
        }
        
        var title: String {
            switch self {
            case .text: return "Text"
            case .map: return "Map"
            case .batteryCircleGauge: return "Battery Circle Gauge"
            case .customShape: return "Custom Shape"
            case .wavyDock: return "Wavy Dock"
            case .glassShape: return "Glass"
            case .weatherIcon: return "Weather Icon"
            case .squareShape: return "Squared Shape"
            case .batteryLinearGauge: return "Linear Gauge"
            case .calendar: return "Calendar"
            case .hiLoCircleGauge: return "Hi/Lo Circle Gauge"
            case .hiLoLinearGauge: return "Hi/Lo Linear Gauge"
            case .conditionAsset: return "Condition Asset"
                
                
            }
        }
    }
}


/*
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
