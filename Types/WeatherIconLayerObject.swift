//
//  WeatherIconLayerObject.swift
//  ShowBoard
//
//  Created by Sean Kelly on 07/08/2023.
//



import SwiftUI


class WeatherIconLayerObject: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

    //    self.activeWeatherIconImageSet = activeWeatherIconImageSet
       
        
        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon
    }
}


class WeatherIconLayerObject2: LayerObject {
    
    // MARK: - Public Properties

    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon2
    }
}
 
class WeatherIconLayerObject3: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon3
    }
}

class WeatherIconLayerObject4: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon4
    }
}

class WeatherIconLayerObject5: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon5
    }
}

class WeatherIconLayerObject6: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIcon6
    }
}

class weatherIconForecast: LayerObject {
    
    // MARK: - Public Properties
    
    
    // MARK: - Public Methods
    
    
    init(id: UUID = UUID(), appearance: LayerObjectAppearance = LayerObjectAppearance()) {

        super.init()
        self.id = id
        self.appearance = appearance
        self.objectType = .weatherIconForecast
    }
}
