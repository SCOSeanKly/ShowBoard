//
//  PlacedObjects List View.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI
import UniformTypeIdentifiers

//MARK: Started on the list view
struct PlacedObjectsListView: View {
    @Binding var placedObjects: [LayerObject]
    @State private var showAlert = false
    @State private var alertType: AlertType = .delete
    @State private var objectToDelete: LayerObject?
    @Binding var selection: UUID?
    @Binding var hiddenLayers: Set<UUID>
    @State private var isPressing: Bool = false
    @State private var isPressingHideLayer: Bool = false
    @State private var isPressingSettings: Bool = false
    @State private var isPressingDelete: Bool = false
    @Binding var showLayerEditView: Bool
    let highlightColor = Color.blue.opacity(0.05)
    @Binding var showGallery: Bool
    let cornerRadius: CGFloat = 12

    @State private var name: String = ""

    @State private var showImporter = false
    @State private var importError: Error? = nil
    @State private var shareURL: URL? = nil

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "square.3.layers.3d")
                    .font(.title3)

                Text("Edit Layers")
                    .font(.headline.weight(.semibold))

                Spacer()

                if placedObjects.count > 1 {
                    Button(action: { //MARK: Delete all button
                        feedback()
                        alertType = .deleteAll
                        showAlert = true
                        objectToDelete = nil
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

                VStack {
                    Text("No editable layers added yet!")
                        .lineLimit(1)
                        .font(.system(size: 16).weight(.medium))
                        .foregroundColor(.red)
                        .padding(.bottom, 5)

                    Text("Start adding layers by tapping the \(Image(systemName: "square.grid.2x2")) button or alternatively browse the Boards section")
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .font(.system(size: 12).weight(.medium))
                        .foregroundColor(.red)
                        .padding(.bottom, 25)
                        .padding(.horizontal, 30)

                    HStack(spacing: 16) {
                        VStack {
                            ObjectSelectionButton(
                                action: {
                                    showLayerEditView.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        showGallery.toggle()}
                                },
                                imageType: .system(name: "arrow.right.doc.on.clipboard"),
                                textDescription: "ShowBoards",
                                disabled: false,
                                cornerRadius: cornerRadius
                            )

                            Text("Browse Boards")
                                .lineLimit(1)
                                .font(.system(size: 12).weight(.medium))
                        }
                        VStack {
                            ObjectSelectionButton(
                                action: {
                                    showImporter = true
                                },
                                imageType: .system(name: "square.and.arrow.up.on.square"),
                                textDescription: "Import Config",
                                disabled: false,
                                cornerRadius: cornerRadius
                            )

                            Text("Import Config")
                                .lineLimit(1)
                                .font(.system(size: 12).weight(.medium))
                        }
                    }

                    Spacer()
                }
            } else {
                ZStack {
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

                    VStack {

                        Spacer()
                        HStack{

                            Spacer()

                            ObjectSelectionButton( //MARK: Save button
                                action: {
                                    feedback()
                                    alertType = .save
                                    showAlert = true

                                },
                                imageType: .system(name: "square.and.arrow.down"),
                                textDescription: "Save",
                                disabled: false,
                                cornerRadius: cornerRadius
                            )
                            .scaleEffect(0.8)
                            .padding()
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        switch alertType {
                        case .delete:
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
                            }
                            else {
                                return Alert(title: Text(""), message: Text("")) // Empty Alert
                            }
                        case .deleteAll:
                            return  Alert(
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
                        case .save:
                            let saveAlertMessage: Text
                            let layerText = placedObjects.count == 1 ? "layer" : "layers"
                            if placedObjects.count < 5 {
                                saveAlertMessage = Text("Are you certain about saving your current ShowBoard config file? Please note that you currently have \(placedObjects.count) \(layerText).")
                            } else {
                                saveAlertMessage = Text("Are you sure you want to save the ShowBoard config file with your current settings? It's recommended to save a backup of any previous config files before making any changes. Would you like to proceed?")
                            }

                            return Alert(
                                title: Text("Save ShowBoard?"),
                                message: saveAlertMessage,
                                primaryButton: .cancel(Text("Cancel")),
                                secondaryButton: .destructive(Text("Save"), action: {
                                    exportConfigAndShowShareSheet()
                                })
                            )
                        }
                    }

                    if let error = importError {
                        AlertWrapper(
                            isPresented: Binding<Bool>(
                                get: { importError != nil },
                                set: { newValue in
                                    if !newValue { importError = nil }
                                }),
                            error: error
                        )
                    }
                }

                Spacer()
            }
        }
        .sheet(item: $shareURL) { url in
            ShareSheet(activityItems: [url])
        }
        .fileImporter(
            isPresented: $showImporter,
            allowedContentTypes: [.json],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case .success(let urls):
                guard let selectedFile = urls.first else { return }
                do {
                    let data = try Data(contentsOf: selectedFile)
                    let decodedObjects = try JSONDecoder().decode([LayerObject].self, from: data)
                    DispatchQueue.main.async {
                        placedObjects = decodedObjects
                    }
                } catch {
                    DispatchQueue.main.async {
                        importError = error
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    importError = error
                }
            }
        }
    }

    private func moveLayer(from source: IndexSet, to destination: Int) {
        // Reorder the placedObjects array based on the new index
        placedObjects.move(fromOffsets: source, toOffset: destination)
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
        case .rain: objectTypeInfo = .rain
        case .weatherIcon2: objectTypeInfo = .weatherIcon2
        case .weatherIcon3: objectTypeInfo = .weatherIcon3
        case .weatherIcon4: objectTypeInfo = .weatherIcon4
        case .weatherIcon5: objectTypeInfo = .weatherIcon5
        case .weatherIcon6: objectTypeInfo = .weatherIcon6
        case .weatherIcon7: objectTypeInfo = .weatherIcon7
        case .weatherIcon8: objectTypeInfo = .weatherIcon8
        case .weatherIcon9: objectTypeInfo = .weatherIcon9
        case .weatherIcon10: objectTypeInfo = .weatherIcon10
        case .weatherIcon11: objectTypeInfo = .weatherIcon11
        case .weatherIcon12: objectTypeInfo = .weatherIcon12
        case .weatherIcon13: objectTypeInfo = .weatherIcon13
        case .weatherIcon14: objectTypeInfo = .weatherIcon14
        case .weatherIcon15: objectTypeInfo = .weatherIcon15
        case .weatherIconForecast: objectTypeInfo = .weatherIconForecast
        case .strokeShape: objectTypeInfo = .strokeShape
        case .importedImage1: objectTypeInfo = .importedImage1
        case .importedImage2: objectTypeInfo = .importedImage2
        case .importedImage3: objectTypeInfo = .importedImage3
        case .DOTW: objectTypeInfo = .DOTW

        }

        return HStack {
            Image(systemName: objectTypeInfo.icon)
            Text(objectTypeInfo.title)


            Spacer()

            //MARK: Other buttons go here

            Button(action: {
                feedback()
                isPressingDelete.toggle()

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {

                    isPressingDelete.toggle()
                }
                alertType = .delete
                showAlert = true
                objectToDelete = obj


            }, label: {
                Image(systemName: "trash")
                    .scaleEffect(isPressingDelete ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 200, damping: 10), value: isPressingDelete)
            })
            .foregroundColor(.red)
        }
    }

    enum AlertType {
        case delete
        case deleteAll
        case save
    }

    // Store icons and titles for each objectType in an enum
    enum ObjectTypeInfo {
        case text
        case map
        case batteryCircleGauge
        case customShape
        case wavyDock
        case glassShape
        case squareShape
        case batteryLinearGauge
        case calendar
        case hiLoCircleGauge
        case hiLoLinearGauge
        case conditionAsset
        case rain
        case weatherIcon
        case weatherIcon2
        case weatherIcon3
        case weatherIcon4
        case weatherIcon5
        case weatherIcon6
        case weatherIcon7
        case weatherIcon8
        case weatherIcon9
        case weatherIcon10
        case weatherIcon11
        case weatherIcon12
        case weatherIcon13
        case weatherIcon14
        case weatherIcon15
        case weatherIconForecast
        case strokeShape
        case importedImage1
        case importedImage2
        case importedImage3
        case DOTW


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
            case .rain: return "cloud.heavyrain"
            case .weatherIcon2: return "sun.max"
            case .weatherIcon3: return "sun.max"
            case .weatherIcon4: return "sun.max"
            case .weatherIcon5: return "sun.max"
            case .weatherIcon6: return "sun.max"
            case .weatherIcon7: return "sun.max"
            case .weatherIcon8: return "sun.max"
            case .weatherIcon9: return "sun.max"
            case .weatherIcon10: return "sun.max"
            case .weatherIcon11: return "sun.max"
            case .weatherIcon12: return "sun.max"
            case .weatherIcon13: return "sun.max"
            case .weatherIcon14: return "sun.max"
            case .weatherIcon15: return "sun.max"
            case .weatherIconForecast: return "sun.max"
            case .strokeShape: return "square.dashed"
            case .importedImage1: return "photo"
            case .importedImage2: return "photo"
            case .importedImage3: return "photo"
            case .DOTW: return "birthday.cake"

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
            case .squareShape: return "Squared Shape"
            case .batteryLinearGauge: return "Linear Gauge"
            case .calendar: return "Calendar"
            case .hiLoCircleGauge: return "Hi/Lo Circle Gauge"
            case .hiLoLinearGauge: return "Hi/Lo Linear Gauge"
            case .conditionAsset: return "Condition Asset"
            case .rain: return "Live Rain Effect"
            case .weatherIcon: return "Weather Icon Style 1"
            case .weatherIcon2: return "Weather Icon Style 2"
            case .weatherIcon3: return "Weather Icon Style 3"
            case .weatherIcon4: return "Weather Icon Style 4"
            case .weatherIcon5: return "Weather Icon Style 5"
            case .weatherIcon6: return "Weather Icon Style 6"
            case .weatherIcon7: return "Weather Icon Style 7"
            case .weatherIcon8: return "Weather Icon Style 8"
            case .weatherIcon9: return "Weather Icon Style 9"
            case .weatherIcon10: return "Weather Icon Style 10"
            case .weatherIcon11: return "Weather Icon Style 11"
            case .weatherIcon12: return "Weather Icon Style 12"
            case .weatherIcon13: return "Weather Icon Style 13"
            case .weatherIcon14: return "Weather Icon Style 14"
            case .weatherIcon15: return "Weather Icon Style 15"
            case .weatherIconForecast: return "Weather Icon Forecast"
            case .strokeShape: return "Stroke Shape"
            case .importedImage1: return "Imported Image 1"
            case .importedImage2: return "Imported Image 2"
            case .importedImage3: return "Imported Image 3"
            case .DOTW: return "Days Of The Week"

            }
        }
    }

    private func exportConfigAndShowShareSheet() {
        print("Starting exportConfigAndShowShareSheet")
        do {
            let data = try JSONEncoder().encode(placedObjects)
            print("Successfully encoded placedObjects")
            let tempDir = FileManager.default.temporaryDirectory
            let fileURL = tempDir.appendingPathComponent("ShowBoardConfig.json")
            try data.write(to: fileURL)
            print("Successfully wrote file to: \(fileURL.path)")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                print("Triggering SwiftUI share sheet")
                self.shareURL = fileURL
            }
        } catch {
            print("Failed to export config: \(error)")
            DispatchQueue.main.async {
                importError = error
            }
        }
    }
}

private struct AlertWrapper: View {
    @Binding var isPresented: Bool
    var error: Error

    var body: some View {
        EmptyView()
            .alert("Import Error",
                   isPresented: $isPresented,
                   actions: {
                        Button("OK", role: .cancel) {
                            isPresented = false
                        }
                   },
                   message: {
                    Text(error.localizedDescription)
                   })
    }
}

import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
    }
    func updateUIViewController(_ vc: UIActivityViewController, context: Context) {}
}
