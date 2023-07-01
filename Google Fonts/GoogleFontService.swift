//
//  GoogleFontService.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

import Foundation

class GoogleFontService {
  let apiKey = "AIzaSyBeS99UKnzKtrh5LRnAhPnmsLh3aVwN4EQ"

  func syncFonts() async throws -> [GoogleFont] {
    var components = URLComponents()

    components.scheme = "https"
    components.host = "www.googleapis.com"
    components.path = "/webfonts/v1/webfonts"
    components.queryItems = [
      URLQueryItem(name: "key", value: apiKey),
      URLQueryItem(name: "sort", value: "alpha")
    ]

    let url = components.url!
    let request = URLRequest(url: url)

    let (data, _) = try await URLSession.shared.data(for: request)
    let googleResponse = try JSONDecoder()
      .decode(GoogleResponse.self, from: data)

    return googleResponse.items
  }
}
