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
        
        let iconSetPrefix: String
        
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

