//
//  DetailsView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

import SwiftUI

struct DetailsView: View {
  var font: GoogleFont

  var body: some View {
    VStack {
      Text(font.family)
        .font(.system(size: 20, weight: .bold))
      Spacer()
      ScrollView {
        LazyVStack(alignment: .leading) {
          ForEach(font.files, id: \.id) { value in
            StyleCell(style: value)
          }
        }
      }
      .id(font.family)
    }
    .padding()
  }
}
