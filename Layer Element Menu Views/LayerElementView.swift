//
//  AdjustmentsView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 21/06/2023.
//

import SwiftUI

struct LayerElementView: View {
    // MARK: Show other element views
    @Binding var showLayerElementView: Bool
    @Binding var pressedButtonObjectIndex: Int?

    // Arrays
    let sfSymbolsArray = ["character.textbox", "barometer", "cloud.sun", "chart.xyaxis.line", "dot.squareshape", "calendar", "photo", "map", "platter.filled.bottom.and.arrow.down.iphone"]
    let sfSymbolsText = ["Text", "Gauges", "Weather", "Charts", "Shapes", "Calendar", "Image", "Maps", "Gallery"]

    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    // Mapping between symbols and view bindings
    let viewBindings: [String: WritableKeyPath<LayerElementView, Bool>] = [
        "Weather": \.showWeatherElementView,
        "Text": \.showTextElementView,
        "Gauges": \.showGaugesElementView,
        "Charts": \.showChartsElementView,
        "Shapes": \.showShapesElementView,
        "Calendar": \.showCalendarElementView,
        "Image": \.showImportImageElementView,
        "Maps": \.showMapsElementView,
        "Gallery": \.showUrlImageView
    ]

    @Binding var showWeatherElementView: Bool
    @Binding var showTextElementView: Bool
    @Binding var showGaugesElementView: Bool
    @Binding var showChartsElementView: Bool
    @Binding var showShapesElementView: Bool
    @Binding var showCalendarElementView: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var showMapsElementView: Bool
    @Binding var showUrlImageView: Bool
    
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    @State private var shouldShowRedDot = false
    @State private var showNoView = false // This is a dummy Bool for the LayerBackbutton
    

    var body: some View {
        ZStack {
            ScrollView {
                
                LayerBackButton(selfViewToClose: $showNoView, viewToOpen: $showNoView, showLayerElementView: $showNoView, headerText: "Home", systemImage: "house", systemImage2: "gearshape")
                
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(sfSymbolsArray.indices, id: \.self) { index in
                        let symbol = sfSymbolsArray[index]
                        let text = sfSymbolsText[index]

                        ZStack {
                            VStack {
                                Image(systemName: symbol)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .scaleEffect(pressedButtonObjectIndex == index ? 0.8 : 1)
                                    .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: pressedButtonObjectIndex)

                                Text(text)
                                    .font(.caption)
                                    .foregroundColor(.primary)
                                    .padding(.top, -2)
                                    .frame(width: 60)
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                    .scaleEffect(pressedButtonObjectIndex == index ? 0.9 : 1)
                                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: pressedButtonObjectIndex)
                            }
                        }
                        .onTapGesture {
                            if pressedButtonObjectIndex == index {
                                pressedButtonObjectIndex = nil
                            } else {
                                pressedButtonObjectIndex = index

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    pressedButtonObjectIndex = nil
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    showLayerElementView.toggle()

                                    if let bindingKeyPath = viewBindings[text] {
                                        DispatchQueue.main.async {
                                            var mutableSelf = self
                                            mutableSelf[keyPath: bindingKeyPath].toggle()
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(pressedButtonObjectIndex == index ? 0.3 : 0.2),
                                radius: pressedButtonObjectIndex == index ? 1 : 5,
                                x: 0,
                                y: pressedButtonObjectIndex == index ? 0 : 4)
                        .tint(.black)
                        .scaleEffect(pressedButtonObjectIndex == index ? 0.95 : 1)
                        .animation(.easeIn(duration: 0.1), value: pressedButtonObjectIndex)
                        .overlay {
                            if index == 6 && shouldShowRedDot {
                             
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.red)
                                            .frame(width: 20, height: 20)

                                        Text("\(imageCount(for: index))")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    }
                                    .offset(x: 33, y: -35)
                                    .shadow(color: Color.black.opacity(0.3),radius: 2, y: 1)
                            }
                        }
                    }
                }
              
            }
            .padding(.horizontal)
        }
        .onAppear {
            shouldShowRedDot = hasImages(for: 6) // Check if red dot should be initially shown
        }
        .presentationDragIndicator(.visible)
    }
    
    func hasImages(for index: Int) -> Bool {
        switch index {
        case 6:
            return importedImage1 != nil || importedImage2 != nil || importedImage3 != nil
        default:
            return false
        }
    }

    func imageCount(for index: Int) -> Int {
        var count = 0
        if index == 6 {
            if importedImage1 != nil {
                count += 1
            }
            if importedImage2 != nil {
                count += 1
            }
            if importedImage3 != nil {
                count += 1
            }
        }
        return count
    }
}
