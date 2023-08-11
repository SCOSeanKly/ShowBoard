//
//  sfSymbols.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

import SwiftUI

struct SymbolListView: View {
    let symbols: [String]
    
    init() {
        if let bundle = Bundle(identifier: "com.apple.CoreGlyphs"),
           let resourcePath = bundle.path(forResource: "symbol_search", ofType: "plist"),
           let plist = NSDictionary(contentsOfFile: resourcePath) as? [String: Any] {
            symbols = Array(plist.keys)
        } else {
            symbols = []
        }
    }
    
    var body: some View {
        NavigationView {
            List(symbols, id: \.self) { symbol in
                Text(symbol)
            }
            .navigationTitle("Available Symbols")
        }
    }
}


