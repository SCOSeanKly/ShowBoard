//
//  WeatherIconLayerObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/08/2023.
//



import SwiftUI


class WeatherIconLayerObject: LayerObject {
    
    // MARK: - Public Properties
    
    
    /// Currently selected weather icon set
    @Published var activeWeatherIconImageSet: WeatherIconImageSet
    
    enum WeatherIconImageSet {
        case set1
        case set2
        case set3
    }
 
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), activeWeatherIconImageSet: WeatherIconImageSet = .set1) {

        self.activeWeatherIconImageSet = activeWeatherIconImageSet
       
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon
    }
}



 
