//
//  WeatherIconLayerObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/08/2023.
//



import SwiftUI


class WeatherIconLayerObject: LayerObject {
     
    // MARK: - Public Properties
     
  
    @Published var activeWeatherIconImageSet: WeatherIconImageSet
     
    enum WeatherIconImageSet {
        case set1
        case set2
        case set3
        case set4
        case set5
        case set6
        
    }
     
    func changeActiveWeatherIconSet(to newSet: WeatherIconImageSet) {
        DispatchQueue.main.async {
            self.activeWeatherIconImageSet = newSet
        }
    }
  
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance(), activeWeatherIconImageSet: WeatherIconImageSet = .set4) {
        self.activeWeatherIconImageSet = activeWeatherIconImageSet
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon
    }
}



 
