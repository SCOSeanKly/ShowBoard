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
    //var action: () -> Void
    
    
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
            
            LazyVGrid(columns: columns, spacing: 10) {
                /*
                 ForEach(UIFont.familyNames.sorted(), id: \.self) { familyName in
                 ForEach(UIFont.fontNames(forFamilyName: familyName).sorted(), id: \.self) { fontName in
                 */
                ForEach(UIFont.familyNames.sorted(), id: \.self) { familyName in
                    if let fontName = UIFont.fontNames(forFamilyName: familyName).first {
                        
                        Button {
                            
                            bindingValue = fontName
                            
                            isPressing.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isPressing.toggle()}
                        }label: {
                            ZStack {
                                VStack {
                                    Text("Aa")
                                        .font(Font.custom(fontName, size: 26))
                                    
                                    
                                    Text(fontName)
                                        .font(.system(size: 8).weight(.medium))
                                        .lineLimit(1)
                                       
                                    
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
            }
            .padding()
        }
        .customPresentationWithPrimaryBackground(detent: .medium, backgroundColorOpacity: 1.0)
    }
}

struct CustomFontGridPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontGridPicker(bindingValue: .constant("Initial Value"), text: TextObject())
    }
}



