//
//  CustomFontPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 24/07/2023.
//

import SwiftUI

struct CustomFontPicker: View {
    @Binding var bindingValue: String
    @StateObject var text: TextObject
    
    var body: some View {
        HStack {
            Text("Font Style:")
                .titleFont()
            
            Spacer()
            
            Picker("Font Style", selection: $bindingValue) {
                
                ForEach(UIFont.familyNames.sorted(), id: \.self) { familyName in
                    VStack(alignment: .leading) {
                        Text(familyName)
                            .font(text.appearance.font)
                            .padding(.bottom, 8)
                        ForEach(UIFont.fontNames(forFamilyName: familyName).sorted(), id: \.self) { fontName in
                            Text(fontName)
                                .font(Font.custom(fontName, size: 16))
                        }
                    }
                   
                }
                 
            }
            .pickerStyle(.menu)
        }
        .frame(height: 30)
        .padding(.horizontal)
      
    }
}



