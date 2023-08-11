//
//  ImportedImageType.swift
//  ShowBoard
//
//  Created by Sean Kelly on 11/08/2023.
//

import SwiftUI

    class ImportedImageType: LayerObject {
        
        // MARK: - Public Properties
        
        @Published var importedImage1: UIImage? = nil
        @Published var showImagePickerSheet1 = false
        @Published var importedImage2: UIImage? = nil
        @Published var showImagePickerSheet2 = false
        @Published var importedImage3: UIImage? = nil
        @Published var showImagePickerSheet3 = false
        
      
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), importedImage1: UIImage? = nil, importedImage2: UIImage? = nil, importedImage3: UIImage? = nil, showImagePickerSheet1: Bool = false, showImagePickerSheet2: Bool = false, showImagePickerSheet3: Bool = false) {

            self.importedImage1 = importedImage1
            self.importedImage2 = importedImage2
            self.importedImage3 = importedImage3
            self.showImagePickerSheet1 = showImagePickerSheet1
            self.showImagePickerSheet2 = showImagePickerSheet2
            self.showImagePickerSheet3 = showImagePickerSheet3
            
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .squareShape //MARK: remember and update this!
        }
    }
