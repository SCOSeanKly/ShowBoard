//
//  FontNames.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

struct FontListView: View {
    var body: some View {
        ScrollView {
            ForEach(UIFont.familyNames.sorted(), id: \.self) { familyName in
                VStack(alignment: .leading) {
    
                    ForEach(UIFont.fontNames(forFamilyName: familyName).sorted(), id: \.self) { fontName in
                        HStack {
                            Text(fontName)
                                .font(Font.custom(fontName, size: 16))
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
    }
}

struct ContentView2: View {
    var body: some View {
     
            FontListView()
        
    }
    }


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}

