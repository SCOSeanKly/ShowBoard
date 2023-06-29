//
//  ImageElementView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 23/06/2023.
//

import SwiftUI


struct ImportImageElementView: View {
    @Binding var showLayerElementView: Bool
    @Binding var showImportImageElementView: Bool
    @Binding var showImagePickerSheet1: Bool
    @Binding var showImagePickerSheet2: Bool
    @Binding var showImagePickerSheet3: Bool
    
    @Binding var importedImage1: UIImage?
    @Binding var importedImage2: UIImage?
    @Binding var importedImage3: UIImage?
    
    @State private var importImage: Bool = false
    @State private var importFile: Bool = false
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var buttonIsPressedAnimationImage1: Bool = false
    @State private var buttonIsPressedAnimationImage2: Bool = false
    @State private var buttonIsPressedAnimationImage3: Bool = false
    
    @State private var settingsButtonIsPressedAnimationImage1: Bool = false
    @State private var settingsButtonIsPressedAnimationImage2: Bool = false
    @State private var settingsButtonIsPressedAnimationImage3: Bool = false
    
    var body: some View {
        ZStack {
            VStack{
                HStack {
                    Button {
                        
                        showImportImageElementView.toggle()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            showLayerElementView.toggle()
                        }
                        
                    } label: {
                        Image(systemName: "arrow.left.circle")
                            .font(.title)
                            .tint(.black)
                    }
                    Spacer()
                }
                .padding()
                .padding(.horizontal)
                
                HStack{
                    Text("Import Image")
                        .font(.headline.weight(.heavy))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                LazyVGrid(columns: gridItems, spacing: 16) {
                    
                    ImportImageButton(systemImage: "photo", buttontext: "Image1", buttonAction: $showImagePickerSheet1, showImportImageElementView: $showImportImageElementView, importedImage: $importedImage1)
                        .overlay {
                            ImageTrashButtonView(buttonIsPressedAnimation: $buttonIsPressedAnimationImage1, settingButtonIsPressedAnimation: $settingsButtonIsPressedAnimationImage1, importedImage: $importedImage1)
                        }
                    
                    ImportImageButton(systemImage: "photo", buttontext: "Image2", buttonAction: $showImagePickerSheet2, showImportImageElementView: $showImportImageElementView, importedImage: $importedImage2)
                        .overlay {
                            ImageTrashButtonView(buttonIsPressedAnimation: $buttonIsPressedAnimationImage2, settingButtonIsPressedAnimation: $settingsButtonIsPressedAnimationImage2, importedImage: $importedImage2)
                        }
                    
                    ImportImageButton(systemImage: "photo", buttontext: "Image3", buttonAction: $showImagePickerSheet3, showImportImageElementView: $showImportImageElementView, importedImage: $importedImage3)
                        .overlay {
                            ImageTrashButtonView(buttonIsPressedAnimation: $buttonIsPressedAnimationImage3, settingButtonIsPressedAnimation: $settingsButtonIsPressedAnimationImage3, importedImage: $importedImage3)
                        }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .presentationDetents([.fraction(0.45)])
        .presentationDragIndicator(.visible)
    }
}
