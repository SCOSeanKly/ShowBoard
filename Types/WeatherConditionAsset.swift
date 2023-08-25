//
//  WeatherConditionAsset.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//
//
import WeatherKit
import SwiftUI


let wI = WeatherIconLayerObject()

extension WeatherCondition {
    public var asset: String {
        
        let iconSetPrefix: String = "set1_"
        /*
        switch wI.activeWeatherIconImageSet {
        case .set1:
            iconSetPrefix = "set1_"
        case .set2:
            iconSetPrefix = "set2_"
        case .set3:
            iconSetPrefix = "set3_"
        case .set4:
            iconSetPrefix = "set4_"
        case .set5:
            iconSetPrefix = "set5_"
        case .set6:
            iconSetPrefix = "set6_"
        }
         */
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset2: String {
        
        let iconSetPrefix: String = "set2_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset3: String {
        
        let iconSetPrefix: String = "set3_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset4: String {
        
        let iconSetPrefix: String = "set4_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset5: String {
        
        let iconSetPrefix: String = "set5_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset6: String {
        
        let iconSetPrefix: String = "set6_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset7: String {
        
        let iconSetPrefix: String = "set7_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset8: String {
        
        let iconSetPrefix: String = "set8_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset9: String {
        
        let iconSetPrefix: String = "set9_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset10: String {
        
        let iconSetPrefix: String = "set10_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset11: String {
        
        let iconSetPrefix: String = "set11_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset12: String {
        
        let iconSetPrefix: String = "set12_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset13: String {
        
        let iconSetPrefix: String = "set13_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset14: String {
        
        let iconSetPrefix: String = "set14_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

extension WeatherCondition {
    public var asset15: String {
        
        let iconSetPrefix: String = "set15_"
        
        
        switch self {
        case .blizzard:
            return iconSetPrefix + "50d"
        case .blowingDust:
            return iconSetPrefix + "14d"
        case .blowingSnow:
            return iconSetPrefix + "9d"
        case .breezy:
            return iconSetPrefix + "7d"
        case .clear:
            return iconSetPrefix + "1d"
        case .cloudy:
            return iconSetPrefix + "2d"
        case .drizzle:
            return iconSetPrefix + "5d"
        case .flurries:
            return iconSetPrefix + "10d"
        case .foggy:
            return iconSetPrefix + "7d"
        case .freezingDrizzle:
            return iconSetPrefix + "10d"
        case .freezingRain:
            return iconSetPrefix + "10d"
        case .frigid:
            return iconSetPrefix + "1d"
        case .hail:
            return iconSetPrefix + "10d"
        case .haze:
            return iconSetPrefix + "7d"
        case .heavyRain:
            return iconSetPrefix + "6d"
        case .heavySnow:
            return iconSetPrefix + "9d"
        case .hot:
            return iconSetPrefix + "51d"
        case .hurricane:
            return iconSetPrefix + "8d"
        case .isolatedThunderstorms:
            return iconSetPrefix + "8d"
        case .mostlyClear:
            return iconSetPrefix + "1d"
        case .mostlyCloudy:
            return iconSetPrefix + "2d"
        case .partlyCloudy:
            return iconSetPrefix + "2d"
        case .rain:
            return iconSetPrefix + "5d"
        case .scatteredThunderstorms:
            return iconSetPrefix + "8d"
        case .sleet:
            return iconSetPrefix + "10d"
        case .smoky:
            return iconSetPrefix + "7d"
        case .snow:
            return iconSetPrefix + "9d"
        case .strongStorms:
            return iconSetPrefix + "8d"
        case .sunFlurries:
            return iconSetPrefix + "5d"
        case .sunShowers:
            return iconSetPrefix + "5d"
        case .thunderstorms:
            return iconSetPrefix + "8d"
        case .tropicalStorm:
            return iconSetPrefix + "8d"
        case .windy:
            return iconSetPrefix + "7d"
        case .wintryMix:
            return iconSetPrefix + "10d"
        @unknown default:
            return iconSetPrefix + "dunno"
        }
    }
}

