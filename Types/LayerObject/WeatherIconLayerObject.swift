//
//  WeatherIconLayerObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/08/2023.
//
/*
import Foundation

class WeatherIconLayerObject: Identifiable, ObservableObject {
    
    
    // MARK: - Public properties
    
    
    /// The unique identifier of the object
    var id = UUID()
    
    
    /// The class which defines the objects appearance on the screen
    @Published var appearance: LayerObjectAppearance = .init()
    
    /// The type of the object
    var objectType: LayerObjectType = .weatherIcon
    
}
 */


 import SwiftUI


 class WeatherIconLayerObject: LayerObject {
     
     // MARK: - Public Properties
     
     
     
     /// Map Frame Width
     @Published var weatherIconFrameWidth: CGFloat
     
     /// Map Frame Height
     @Published var weatherIconFrameHeight: CGFloat
     

     
     
     
     
     // MARK: - Public Methods
     
     
     init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), weatherIconFrameWidth: CGFloat = 300.0, weatherIconFrameHeight: CGFloat = 150) {

         self.weatherIconFrameWidth = weatherIconFrameWidth
         self.weatherIconFrameHeight = weatherIconFrameHeight
        
         
         super.init()
         self.id = id
         self.appearance = appearance
         self.objectType = .weatherIcon
     }
 }
 
