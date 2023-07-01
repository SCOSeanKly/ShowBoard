//
//  GoogleView.swift
//  ShowBoard
//
//  Created by Sean Kelly on 01/07/2023.
//

import SwiftUI

struct GoogleView: View {
  @State var fonts = [GoogleFont]()
  @State var font: GoogleFont?

  var body: some View {
    NavigationSplitView {
     FontList(selectedFont: $font, fonts: fonts)
    } detail: {
      if let font = font {
        DetailsView(font: font)
      } else {
        EmptyView()
      }
    }
    .task {
      do {
        fonts = try await GoogleFontService().syncFonts()
      
        await MainActor.run {
          font = fonts[0]
        }
      } catch {
        print (error)
      }
    }
  }
}

struct GoogleView_Previews: PreviewProvider {
  static var previews: some View {
      GoogleView()
  }
}
