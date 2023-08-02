//
//  DynamicText.swift
//  ShowBoard
//
//  Created by Szigeti József on 25.06.23.
//

import Foundation


struct DynamicText {
    
    @MainActor static func convert(input: String, wk: WeatherKitManager) -> String {
        var text = input
        let pattern = "\\[.*?\\]"
        let regex = try! NSRegularExpression(pattern: pattern)
        let matches = regex.matches(in: input, range: NSRange(input.startIndex..., in: input))
        
        for match in matches {
            let range = match.range
            let tag = String(input[Range(range, in: input)!])
            
            guard let placeholder = DynamicText.Placeholder(rawValue: tag) else {
                continue
            }
            
            text = text
            .replacingOccurrences(
                of: tag,
                with: placeholder.withCurrentDate()
            )
            .replacingOccurrences(
                of: tag,
                with: placeholder.withCurrentWeather(
                    wk.weather?.currentWeather,
                    unit: .celsius
                )
            )
        }
        
        return text
    }

}
