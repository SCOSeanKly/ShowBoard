//
//  FontList.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

import SwiftUI

struct FontList: View {
  @Binding var selectedFont: GoogleFont?
  var fonts: [GoogleFont]
  
  var body: some View {
    List(fonts, selection: $selectedFont) { font in
      NavigationLink(value: font) {
        VStack(alignment: .leading) {
          Text(font.family)
            .font(.system(size: 14, weight: .bold))
          Text("\(font.files.count) styles")
            .font(.system(size: 14))
        }
        .padding(8)
      }
    }
    .listStyle(PlainListStyle())
  }
}
