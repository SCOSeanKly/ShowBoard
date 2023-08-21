//
//  CustomFontGridPicker.swift
//  ShowBoard
//
//  Created by Sean Kelly on 10/08/2023.
//

import SwiftUI

struct CustomFontGridPicker: View {
    @Binding var bindingValue: String
    @StateObject var text: TextObject
    @State private var isPressing: Bool = false
    @State private var searchText = ""
    
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            
            HStack {
                
                Image(systemName: "character.textbox")
                    .font(.title3)
                
                HStack {
                    Text("Pick a font...")
                        .font(.headline.weight(.semibold))
                    
                    Spacer()
                    
                    Text("Fonts: \(UIFont.familyNames.count)")
                        .font(.headline.weight(.semibold))
                }
                
                Spacer()
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            
            
            ZStack {
                TextField("Search fonts...", text: $searchText)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(1.2), radius: 0.5, x: 0, y: 0)
                    .tint(.black)
                    .padding(.horizontal)
                
                HStack {
                    Spacer()
                    ZStack {
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                    .padding(.trailing, 30)
                }
            }
            
            
            
            
            
            
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredFontFamilyNames, id: \.self) { familyName in
                    if let fontName = UIFont.fontNames(forFamilyName: familyName).first {
                        
                        Button {
                            
                            bindingValue = fontName
                            
                            isPressing.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressing.toggle()}
                        }label: {
                            ZStack {
                                
                                VStack {
                                    
                                    Spacer()
                                    
                                    Text(fontName)
                                        .font(.system(size: 8).weight(.medium))
                                        .lineLimit(1)
                                    
                                }
                                
                                Text(fontName.prefix(2))
                                    .font(Font.custom(fontName, size: 24))
                                    .frame(height: 30)
                                
                            }
                            .frame(width: 50, height: 60)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(12)
                            .shadow(color: .black.opacity(0.2), radius: 3, x: 0, y: 3)
                            .tint(.black)
                        }
                        
                    }
                }
            }
            .padding()
            .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
        }
        
        var filteredFontFamilyNames: [String] {
            if searchText.isEmpty {
                return UIFont.familyNames.sorted()
            } else {
                return UIFont.familyNames.filter { familyName in
                    familyName.localizedCaseInsensitiveContains(searchText)
                }.sorted()
            }
        }
    }
}


struct CustomFontGridPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontGridPicker(bindingValue: .constant("Initial Value"), text: TextObject())
    }
}



