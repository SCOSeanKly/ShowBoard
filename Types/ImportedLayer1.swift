//
//  ImportedLayer1.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/09/2023.
//

import SwiftUI

    class ImportedImage1Object: LayerObject {
        
        // MARK: - Public Properties
        
        
        
        
        // MARK: - Public Methods
        
        
        init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

           
            super.init()
            self.id = id
            self.appearance = appearance
            self.objectType = .importedImage1 //MARK: remember and update this!
        }
    }

class ImportedImage2Object: LayerObject {
    
    // MARK: - Public Properties
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

       
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .importedImage2 //MARK: remember and update this!
    }
}

class ImportedImage3Object: LayerObject {
    
    // MARK: - Public Properties
    
    
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

       
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .importedImage3 //MARK: remember and update this!
    }
}
