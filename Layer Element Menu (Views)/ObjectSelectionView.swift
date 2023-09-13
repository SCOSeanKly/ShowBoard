//
//  ObjectSelectionView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI
import WeatherKit

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
    
    
    @Binding var placedObjects: [LayerObject]
    
    @ObservedObject var wObserver = AppModel.shared.wObserver
    @StateObject var weatherIconObject = WeatherIconLayerObject()
    
    
    var currentWeather: CurrentWeather? {
        wObserver.weather?.currentWeather
    }
    
    var todaysForecast: DayWeather? {
        wObserver.getGorecast(offset: 0)
    }
    
    let cornerRadius: CGFloat = 12
    
    
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
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(TextObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "globe"),
                            textDescription: "RSS",
                            disabled: true,
                            cornerRadius: cornerRadius
                        )
                        .disabled(true)
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(TextObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "text.quote"),
                            textDescription: "Quote",
                            disabled: true,
                            cornerRadius: cornerRadius
                        )
                        .disabled(true)
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                
                //MARK: Buttons for weather icons. Doesnt currently select different "sets"
                WeatherIconsObjectSelectionView(showLayerElementView: $showLayerElementView, placedObjects: $placedObjects)
                
                Group {
                    ObjectTitleText(titleText: "Map Image")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(MapObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "map"),
                            textDescription: "Map",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    ObjectTitleText(titleText: "Calendar")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(CalendarViewModel())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "calendar"),
                            textDescription: "Calendar",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(DOTWObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "birthday.cake"),
                            textDescription: "DOTW",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    ObjectTitleText(titleText: "Shapes & Effects")
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(LayerObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "bubbles.and.sparkles"),
                            textDescription: "Glass",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(SquareShapeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "square"),
                            textDescription: "Squared",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(StrokeShapeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "square.dashed"),
                            textDescription: "Stroke",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(CustomShapeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "star"),
                            textDescription: "Custom",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(WavyDockObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "alternatingcurrent"),
                            textDescription: "Wavy Dock",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(RainObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "cloud.heavyrain"),
                            textDescription: "Live Rain",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                
                                showLayerElementView = false
                            },
                            imageType: .system(name: "apple.logo"),
                            textDescription: "SF Symbols",
                            disabled: true,
                            cornerRadius: cornerRadius
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
                            imageType: .system(name: "timer"),
                            textDescription: "Battery Circle",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(LinearGaugeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "chart.line.flattrend.xyaxis"),
                            textDescription: "Battery Linear",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(HiLoGaugeObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "speedometer"),
                            textDescription: "Hi/Lo Circle",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                        
                        ObjectSelectionButton(
                            action: {
                                placedObjects.append(LinearHiLoObject())
                                showLayerElementView = false
                            },
                            imageType: .system(name: "chart.line.flattrend.xyaxis"),
                            textDescription: "Hi/Lo Linear",
                            disabled: false,
                            cornerRadius: cornerRadius
                        )
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                
                ObjectTitleText(titleText: "Import Layer Image")
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ImportImageButton(systemImage: "square.3.layers.3d.bottom.filled", buttontext: "Image1", disabled: false, cornerRadius: cornerRadius, buttonAction: $showImagePickerSheet1, showLayerElementView: $showLayerElementView, importedImage: $importedImage1, action: {
                        placedObjects.append(ImportedImage1Object())
                        showLayerElementView = false
                    })
                        .overlay {
                            ImageTrashButtonView(importedImage: $importedImage1)
                        }
                    ImportImageButton(systemImage: "square.3.layers.3d.middle.filled", buttontext: "Image2", disabled: false,cornerRadius: cornerRadius, buttonAction: $showImagePickerSheet2, showLayerElementView: $showLayerElementView, importedImage: $importedImage2, action: {
                        placedObjects.append(ImportedImage2Object())
                        showLayerElementView = false
                    })
                        .overlay {
                            ImageTrashButtonView(importedImage: $importedImage2)
                        }
                    ImportImageButton(systemImage: "square.3.layers.3d.top.filled", buttontext: "Image3", disabled: false,cornerRadius: cornerRadius, buttonAction: $showImagePickerSheet3, showLayerElementView: $showLayerElementView, importedImage: $importedImage3, action: {
                        placedObjects.append(ImportedImage3Object())
                        showLayerElementView = false
                    })
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
    let shortcutURL = URL(string: "https://www.icloud.com/shortcuts/5894fed6945746a493569b35fa4a5732")!
    @State private var showClipboardAlert = false
    
    var body: some View {
        VStack {
            LayerBackButton(selfViewToClose: $showNothing, viewToOpen: $showClipboardAlert, showLayerElementView: $showNothing, headerText: "Object Selection", systemImage: "square.grid.2x2", systemImage2: "square.2.layers.3d.top.filled")
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
        .modifier(DownloadShortcutModifier(showClipboardAlert: $showClipboardAlert, url: shortcutURL))
    }
}

enum ImageType: Equatable {
    case system(name: String)
    case asset(name: String)
}


struct WeatherIconsObjectSelectionView: View {
    
    //MARK: Grid Items for LazyVGrid
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    //MARK: Object Selection View
    @Binding var showLayerElementView: Bool
    @Binding var placedObjects: [LayerObject]
    let cornerRadius: CGFloat = 12
    
    var body: some View {
        
        ObjectTitleText(titleText: "Weather Icon (1)")
        LazyVGrid(columns: gridItems, spacing: 16) {
            Group {
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(ConditionAssetObject())
                        showLayerElementView = false
                    },
                    imageType: .system(name: "sun.max"),
                    textDescription: "iOS Day",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set1_5d"),
                    textDescription: "Style1",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        //  weatherIconObject.activeWeatherIconImageSet = .set2
                        placedObjects.append(WeatherIconLayerObject2())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set2_8d"),
                    textDescription: "Style2",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        
                        placedObjects.append(WeatherIconLayerObject3())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set3_7d"),
                    textDescription: "Style3",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        
                        placedObjects.append(WeatherIconLayerObject4())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set4_7d"),
                    textDescription: "Style4",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        
                        placedObjects.append(WeatherIconLayerObject5())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set5_7d"),
                    textDescription: "Style5",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        
                        placedObjects.append(WeatherIconLayerObject6())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set6_1d"),
                    textDescription: "Style6",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject7())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set7_5d"),
                    textDescription: "Style7",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
            }
        }
        .padding([.leading, .bottom, .trailing])
        
        
        ObjectTitleText(titleText: "Weather Icon (2)")
        LazyVGrid(columns: gridItems, spacing: 16) {
            Group {
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject8())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set8_5d"),
                    textDescription: "Style8",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject9())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set9_5d"),
                    textDescription: "Style9",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject10())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set10_5d"),
                    textDescription: "Style10",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject11())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set11_5d"),
                    textDescription: "Style11",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject12())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set12_5d"),
                    textDescription: "Style12",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject13())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set13_5d"),
                    textDescription: "Style13",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject14())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set14_5d"),
                    textDescription: "Style14",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
                
                ObjectSelectionButton(
                    action: {
                        placedObjects.append(WeatherIconLayerObject15())
                        showLayerElementView = false
                    },
                    imageType: .asset(name: "set15_5d"),
                    textDescription: "Style15",
                    disabled: false,
                    cornerRadius: cornerRadius
                )
            }
        }
        .padding([.leading, .bottom, .trailing])
        
        
        ObjectTitleText(titleText: "Weather Forecast")
        LazyVGrid(columns: gridItems, spacing: 16) {
            ObjectSelectionButton(
                action: {
                    
                    placedObjects.append(weatherIconForecast())
                    showLayerElementView = false
                },
                imageType: .asset(name: "set1_50d"),
                textDescription: "Forecast",
                disabled: false,
                cornerRadius: cornerRadius
            )
        }
        .padding([.leading, .bottom, .trailing])
        
    }
}
