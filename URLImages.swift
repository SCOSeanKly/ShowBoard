//
//  Scroll.swift
//  ShowBoard
//
//  Created by Sean Kelly on 29/06/2023.
//

import SwiftUI

struct URLImages: View {
    @ObservedObject var viewModelHeader = DataViewModelHeader()
    let screenWidth = UIScreen.main.bounds.width
    @State private var currentIndex = 0
    @State private var isPressing: Bool = false
    
    let gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())] // Define the grid layout
    
    var body: some View {
        ZStack {
            VStack {
                if !viewModelHeader.images.isEmpty {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridItemLayout, spacing: 0) { // Use LazyVGrid to create the grid
                            ForEach(viewModelHeader.images.indices, id: \.self) { index in
                                
                                Button {
                                    // Some Action
                                } label: {
                                    URLImageViewHeader(image: viewModelHeader.images[index])
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
                    Text("Loading images...")
                }
            }
        }
        .onAppear {
            viewModelHeader.loadImages()
        }
        .onReceive(viewModelHeader.$forceRefresh) { refresh in
            if refresh {
                viewModelHeader.loadImages()
            }
        }
    }
}






struct URLImageViewHeader: View {
    let image: ImageModelHeader
    
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

struct ImageModelHeader {
    let image: String
}

class DataViewModelHeader: ObservableObject {
    @Published var images: [ImageModelHeader] = []
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
                        let image = ImageModelHeader(image: imageUrlString)
                        return image
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}


struct URLImages_Previews: PreviewProvider {
    static var previews: some View {
        URLImages()
    }
}



