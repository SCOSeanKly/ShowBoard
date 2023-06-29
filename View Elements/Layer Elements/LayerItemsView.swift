//
//  list.swift
//  ShowBoard
//
//  Created by Sean Kelly on 29/06/2023.
//


import SwiftUI

struct LayerItems: View {
    
    //MARK: This array should be populated with the items we add to the view
    @State private var items = ["Text", "Gauges", "Weather", "Charts", "Shapes", "Calendar", "Image", "Maps", "Gallery"]
    
    //MARK: id Tag would determine what image to use based on the item added to the view
    private let itemImages = ["character.textbox", "barometer", "cloud.sun", "chart.xyaxis.line", "dot.squareshape", "calendar", "photo", "map", "platter.filled.bottom.and.arrow.down.iphone"]
    @Binding var isEditing: Bool
    
    var body: some View {
        List {
            ForEach(items.indices, id: \.self) { index in
                HStack {
                    Image(systemName: itemImages[index % itemImages.count])
                        .foregroundColor(.blue)
                    
                    if isEditing {
                        TextField("Enter text", text: $items[index])
                    } else {
                        Text(items[index])
                    }
                }
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
        }
        .listStyle(PlainListStyle())
        .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
    }
    
    func delete(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        items.move(fromOffsets: source, toOffset: destination)
    }
}







