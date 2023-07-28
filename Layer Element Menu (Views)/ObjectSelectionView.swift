//
//  ObjectSelectionView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 28/07/2023.
//

import SwiftUI

struct ObjectSelectionView: View {
    
    @State private var showNothing: Bool = false
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @Binding var showLayerElementView: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    
    var body: some View {
        ZStack {
            
            ScrollView {
                
                Spacer()
                    .frame(height: 70)
                
                Group {
                    ObjectTitleText(titleText: "Text")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .system(name: "character.textbox"), textDescription: "Custom")
                        ObjectSelectionButton(imageType: .system(name: "character.textbox"), textDescription: "RSS")
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    ObjectTitleText(titleText: "Gauges")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .system(name: "barometer"), textDescription: "Battery")
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    ObjectTitleText(titleText: "Weather")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .asset(name: "weather1"), textDescription: "Style 1")
                        ObjectSelectionButton(imageType: .asset(name: "weather2"), textDescription: "Style 2")
                        ObjectSelectionButton(imageType: .asset(name: "weather3"), textDescription: "Style 3")
                        ObjectSelectionButton(imageType: .asset(name: "weather4"), textDescription: "Style 4")
                        ObjectSelectionButton(imageType: .asset(name: "weather5"), textDescription: "Style 5")
                        ObjectSelectionButton(imageType: .asset(name: "weather6"), textDescription: "Style 6")
                        
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                
                Group {
                    ObjectTitleText(titleText: "Charts")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .system(name: "chart.bar"), textDescription: "Bar")
                        ObjectSelectionButton(imageType: .system(name: "chart.xyaxis.line"), textDescription: "Line")
                        ObjectSelectionButton(imageType: .system(name: "chart.pie"), textDescription: "Pie")
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    
                    ObjectTitleText(titleText: "Shapes")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .system(name: "rectangle"), textDescription: "Glass")
                        ObjectSelectionButton(imageType: .system(name: "star"), textDescription: "Custom")
                        
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                    
                    ObjectTitleText(titleText: "Calendar")
                    
                    LazyVGrid(columns: gridItems, spacing: 16) {
                        ObjectSelectionButton(imageType: .system(name: "calendar"), textDescription: "Calendar")
                        
                        ObjectSelectionButton(imageType: .system(name: "calendar.day.timeline.left"), textDescription: "Timeline")
                        
                    }
                    .padding([.leading, .bottom, .trailing])
                }
                
                
                
                ObjectTitleText(titleText: "Import Layer Image")
                
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ImportImageButton(systemImage: "photo", buttontext: "Image1", buttonAction: $showImagePickerSheet1, showLayerElementView: $showLayerElementView, importedImage: $importedImage1)
                }
                .padding([.leading, .bottom, .trailing])
                
                Spacer()
                    .frame(height: 80)
            }
            
            SheetHeader()
        }
    }
}
/*
 struct ObjectSelectionView_Previews: PreviewProvider {
 static var previews: some View {
 ObjectSelectionView()
 }
 }
 */

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
                }
            
            Spacer()
        }
    }
}

enum ImageType: Equatable {
    case system(name: String)
    case asset(name: String)
}

struct ObjectSelectionButton: View {
    
    @State private var isPressing: Bool = false
    let imageType: ImageType
    let textDescription: String
    
    var body: some View {
        ZStack {
            VStack {
                if let imageName = getImageName() {
                    switch imageType {
                    case .system:
                        Image(systemName: imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .scaleEffect(isPressing ? 0.8 : 1)
                            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                    case .asset:
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .scaleEffect(isPressing ? 0.8 : 1)
                            .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                    }
                }
                
                Text(textDescription)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 50)
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
                    .scaleEffect(isPressing ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: isPressing)
            }
        }
        .frame(width: 50, height: 60)
        .padding(10)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(isPressing ? 0.3 : 0.2),
                radius: isPressing ? 1 : 5,
                x: 0,
                y: isPressing ? 0 : 4)
        .tint(.black)
        .scaleEffect(isPressing ? 0.95 : 1)
        .animation(.easeIn(duration: 0.1), value: isPressing)
        .onTapGesture {
            isPressing.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
            }
        }
    }
    
    private func getImageName() -> String? {
        switch imageType {
        case .system(let name):
            return name
        case .asset(let name):
            return name
        }
    }
}

struct ImportImageButton: View {
    
    let systemImage: String
    let buttontext: String
    @State private var isPressing: Bool = false
    @Binding var buttonAction: Bool
    @Binding var showLayerElementView: Bool
    @Binding var importedImage: UIImage?
    
    var body: some View {
        ZStack {
            VStack {
                if let image = importedImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                        .scaleEffect(isPressing ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                        .animation(.spring(), value: importedImage)
                    
                } else {
                    Image(systemName: systemImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .scaleEffect(isPressing ? 0.8 : 1)
                        .animation(.interpolatingSpring(stiffness: 300, damping: 10), value: isPressing)
                }
                
                Text(buttontext)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .padding(.top, -2)
                    .frame(width: 60)
                    .lineLimit(1)
                    .scaleEffect(isPressing ? 0.9 : 1)
                    .animation(.interpolatingSpring(stiffness: 300, damping: 12), value: isPressing)
            }
        }
        .frame(width: 50, height: 60)
        .padding(10)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(isPressing ? 0.3 : 0.2),
                radius: isPressing ? 1 : 5,
                x: 0,
                y: isPressing ? 0 : 4)
        .tint(.black)
        .scaleEffect(isPressing ? 0.95 : 1)
        .animation(.easeIn(duration: 0.1), value: isPressing)
        .onTapGesture {
            isPressing.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressing.toggle()
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showLayerElementView = false
                 
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        buttonAction.toggle()
                    }
                 
                }
                 
            }
        }
    }
}





