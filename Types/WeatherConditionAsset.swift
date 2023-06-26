//
//  WeatherConditionAsset.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//

import WeatherKit

extension WeatherCondition {
    
    public var asset: String {
        
        switch self {
            
        case .blizzard:
            return "50d"
        case .blowingDust:
            return "14d"
        case .blowingSnow:
            return "9d"
        case .breezy:
            return "7d"
        case .clear:
            return "1d"
        case .cloudy:
            return "2d"
        case .drizzle:
            return "5d"
        case .flurries:
            return "10d"
        case .foggy:
            return "7d"
        case .freezingDrizzle:
            return "10d"
        case .freezingRain:
            return "10d"
        case .frigid:
            return "1d"
        case .hail:
            return "10d"
        case .haze:
            return "7d"
        case .heavyRain:
            return "6d"
        case .heavySnow:
            return "9d"
        case .hot:
            return "51d"
        case .hurricane:
            return "8d"
        case .isolatedThunderstorms:
            return "8d"
        case .mostlyClear:
            return "1d"
        case .mostlyCloudy:
            return "2d"
        case .partlyCloudy:
            return "2d"
        case .rain:
            return "5d"
        case .scatteredThunderstorms:
            return "8d"
        case .sleet:
            return "10d"
        case .smoky:
            return "7d"
        case .snow:
            return "9d"
        case .strongStorms:
            return "8d"
        case .sunFlurries:
            return ""
        case .sunShowers:
            return "5d"
        case .thunderstorms:
            return "8d"
        case .tropicalStorm:
            return "8d"
        case .windy:
            return "7d"
        case .wintryMix:
            return "10d"
        @unknown default:
            return "dunno"
        }
    }
}
