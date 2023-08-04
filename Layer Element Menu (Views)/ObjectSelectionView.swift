//
//  ObjectSelectionView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ObjectSelectionView: View {
    
    //MARK: Grid Items for LazyVGrid
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    //MARK: Object Selection View
    @Binding var showLayerElementView: Bool
    
    //MARK: Image Pickers
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    //MARK: New Variables
    @Binding var placedObjects: [LayerObject]
    @Binding var selection: UUID?
    
    var body: some View {
        ZStack {
            
            ScrollView {
                
                Spacer()
                    .frame(height: 70)
                
                Group {
                    ObjectTitleText(titleText: "Text")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(TextObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "character.textbox"),
                            textDescription: "Custom",
                            disabled: false
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(TextObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "globe"),
                            textDescription: "RSS",
                            disabled: true
                        )
                        .disabled(true)
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(TextObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "text.quote"),
                            textDescription: "Quote",
                            disabled: true
                        )
                        .disabled(true)
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                    
                Group {
                    ObjectTitleText(titleText: "Weather Icon")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather1"),
                            textDescription: "Style1",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather2"),
                            textDescription: "Style2",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather3"),
                            textDescription: "Style3",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather4"),
                            textDescription: "Style4",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather5"),
                            textDescription: "Style5",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "weather6"),
                            textDescription: "Style6",
                            disabled: true
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                //  placedObjects.append(WeatherIconObject()) //MARK: TODO
                                showLayerElementView = false
                            },
                            imageType: .asset(name: "8d"),
                            textDescription: "Imported",
                            disabled: true
                        )
                    }
                    .padding([.leading, .bottom, .trailing])
                   
                }
                    
                Group {
                    ObjectTitleText(titleText: "Map Image")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(MapObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "map"),
                            textDescription: "Custom Map",
                            disabled: false
                        )
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    
                    ObjectTitleText(titleText: "Shapes")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(LayerObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "rectangle"),
                            textDescription: "Glass",
                            disabled: false
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(CustomShapeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "star"),
                            textDescription: "Custom",
                            disabled: false
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                
                                showLayerElementView = false
                            },
                            imageType: .system(name: "apple.logo"),
                            textDescription: "SF Symbols",
                            disabled: true
                        )
                      
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    
                    ObjectTitleText(titleText: "Gauges")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(CircleGaugeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "circle"),
                            textDescription: "Battery",
                            disabled: false
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                
                                showLayerElementView = false
                            },
                            imageType: .system(name: "circle.dashed"),
                            textDescription: "Hi / Lo",
                            disabled: true
                        )
                      
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                    
                
                
                
                ObjectTitleText(titleText: "Import Layer Image")
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ImportImageButton(systemImage: "square.3.layers.3d.bottom.filled", buttontext: "Image1", disabled: false, buttonAction: $showImagePickerSheet1, showLayerElementView: $showLayerElementView, importedImage: $importedImage1)
                        .overlay {
                            ImageTrashButtonView(importedImage: $importedImage1)
                        }
                    ImportImageButton(systemImage: "square.3.layers.3d.middle.filled", buttontext: "Image2", disabled: false,buttonAction: $showImagePickerSheet2, showLayerElementView: $showLayerElementView, importedImage: $importedImage2)
                        .overlay {
                            ImageTrashButtonView(importedImage: $importedImage2)
                        }
                    ImportImageButton(systemImage: "square.3.layers.3d.top.filled", buttontext: "Image3", disabled: false,buttonAction: $showImagePickerSheet3, showLayerElementView: $showLayerElementView, importedImage: $importedImage3)
                        .overlay {
                            ImageTrashButtonView(importedImage: $importedImage3)
                        }
                }
                .padding([.leading, .bottom, .trailing])
                
                Spacer()
                    .frame(height: 80)
            }
            
            SheetHeader()
        }
    }
}

struct ObjectTitleText: View {
    
    let titleText: String
    
    var body: some View {
        HStack {
            Text(titleText)
                .font(.headline.weight(.semibold))
            
            Spacer()
            
        }
        .padding([.horizontal, .top])
        
    }
}

struct SheetHeader: View {
    
    @State private var showNothing: Bool = false
    
    var body: some View {
        VStack {
            LayerBackButton(selfViewToClose: $showNothing, viewToOpen: $showNothing, showLayerElementView: $showNothing, headerText: "Object Selection", systemImage: "square.grid.2x2", systemImage2: "gearshape")
                .frame(height: 80)
                .background{
                    
                    LinearGradient(colors: [.white, .white,  .clear], startPoint: .top, endPoint: .bottom)
                    
                    TransparentBlurView(removeAllFilters: true)
                        .blur(radius: 5, opaque: true)
                        .background(Color.primary.opacity(0.05).colorInvert())
                        .blur(radius: 15)
                }
            
            Spacer()
        }
    }
}

enum ImageType: Equatable {
    case system(name: String)
    case asset(name: String)
}


