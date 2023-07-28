//
//  Scroll.swift
//  ShowBoard
//
//  Created by Sean Kelly on 29/06/2023.
//

import SwiftUI

struct URLImagesGallery: View {
    @ObservedObject var viewModelURLImages = DataViewModelURLImages()
    let screenWidth = UIScreen.main.bounds.width
    @State private var currentIndex = 0
    @Binding var showUrlImageView: Bool
    @Binding var showLayerElementView: Bool
    @State private var showAlert = false
    
    @State private var showAnotherView = false
    
    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            VStack {
                if !viewModelURLImages.images.isEmpty {
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LayerBackButton(selfViewToClose: $showUrlImageView, viewToOpen: $showAnotherView, showLayerElementView: $showLayerElementView, headerText: "Gallery", systemImage: "arrow.left.circle", systemImage2: "")
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 0) { // Use LazyVGrid to create the grid
                            ForEach(viewModelURLImages.images.indices, id: \.self) { index in
                                
                                Button {
                                    showAlert = true
                                    currentIndex = index
                                } label: {
                                    URLImageViewURLImages(image: viewModelURLImages.images[index])
                                        .frame(width: screenWidth * 0.25, height: screenWidth * 0.5)
                                        .scaledToFill()
                                        .clipped()
                                        .cornerRadius(10)
                                        .padding()
                                        .shadow(radius: 5)
                                }
                            }
                        }
                    }
                } else {
                    Text("Loading...")
                }
            }
            .padding(.top)
        }
        .presentationDragIndicator(.visible)
        .onAppear {
            viewModelURLImages.loadImages()
        }
        .onReceive(viewModelURLImages.$forceRefresh) { refresh in
            if refresh {
                viewModelURLImages.loadImages()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Import Board"),
                message: Text("Are you sure you want to import this Board?"),
                primaryButton: .default(Text("Import")) {
                    showUrlImageView.toggle()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

struct URLImageViewURLImages: View {
    let image: ImageModelURLImages
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: image.image)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        ProgressView()
                    }
                case .success(let loadedImage):
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                case .failure:
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        Image(systemName: "xmark.circle")
                    }
                @unknown default:
                    EmptyView()
                }
            }
        }
    }
}

struct ImageModelURLImages {
    let image: String
}

class DataViewModelURLImages: ObservableObject {
    @Published var images: [ImageModelURLImages] = []
    @Published var forceRefresh: Bool = false {
        didSet {
            if forceRefresh {
                loadImages()
            }
        }
    }
    
    func loadImages() {
        let baseUrlString = "https://raw.githubusercontent.com/SCOSeanKly/ShowBoard/main/JSON/Images/"
        let urlString = "https://raw.githubusercontent.com/SCOSeanKly/ShowBoard/main/JSON/ShowBoard.json"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 10
        config.timeoutIntervalForResource = 10
        
        let session = URLSession(configuration: config)
        
        session.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let imageNames = try JSONDecoder().decode([String].self, from: data)
                DispatchQueue.main.async {
                    self.images = imageNames.indices.map { index in
                        let imageName = imageNames[index]
                        let imageUrlString = baseUrlString + imageName
                        let image = ImageModelURLImages(image: imageUrlString)
                        return image
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
